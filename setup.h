#ifndef CUBICIKEDA_SETUP_H_
#define CUBICIKEDA_SETUP_H_

#include <iostream>
#include <iomanip>
#include <capd/capdlib.h>
#include <capd/ddes/ddeslib.h>

#include <capd/ddeshelper/ddeshelperlib.h>
#include <capd/ddeshelper/DDEHelperDrawing.hpp>
#include <capd/ddeshelper/DDECoordinateFrameHelper.hpp>

// declaration before definition, for the below classes
template<typename ScalarSpec, typename ParamSpec> class EvolutionaryGame;

// declaration of classes from DDEs library
typedef EvolutionaryGame<double, double> DEq;
typedef capd::ddes::NonrigorousSetup<DEq> DS;

/**
 * Class to represent $f$ in the equation $x'(t) = f(x(t), x(t-\tau), ...)$
 */
template<typename ScalarSpec, typename ParamSpec = ScalarSpec>
class EvolutionaryGame{
public:
	typedef ScalarSpec ScalarType;
	typedef unsigned int size_type;
	typedef ScalarType RealType;
	typedef ParamSpec ParamType;
	typedef capd::vectalg::Vector<ParamSpec, 0> ParamsVectorType;
	typedef capd::vectalg::Vector<ScalarType, 0> VectorType;

	EvolutionaryGame(char mode = 'a'): mode(mode) {}

	static size_type imageDimension() { return 3; } // output dimension of the f in RHS
	static size_type dimension() { return 6; }		// input dimension, i.e. the ambient space dimension d of x(t)
	static size_type getParamsCount() { return 13; }// number of parameters, except the delays

	template<typename RealSpec, typename InVectorSpec, typename OutVectorSpec>
	void operator()(const RealSpec& t, const InVectorSpec v, OutVectorSpec& fv) const {
		auto qd = v[0], qd_gamma = v[3];
		auto n = v[1], n_gamma = v[4];
		auto x = v[2], x_gamma = v[5];

		auto Dn = n; // assign, just to get the data type compatible with n
		if (mode == 'b')
			Dn = (1. - n / K);
		else if (mode == 'c')
			Dn = exp(log(u) * n_gamma / z);
		else // includes 'a'
			Dn = 1.;
		// to avoid 'nan' error propagating from various terms, we do the ?: operator.
		auto A = alpha != 0. ? alpha * (1 + sin(2*M_PI/theta * t)) : 0.;
		auto B = p != 0. ? p * x : 0.;
		auto C = Omega != 0. ? Omega * n : 0.;

		// qd'
		fv[0] =
			(n_gamma / n) * (qd_gamma*qd_gamma - qd) * 0.5 * F * Dn +
			(n_gamma / n) * (qd_gamma          - qd) * Phi * Dn +
			qd * (1-qd)*(1-qd) * 0.5 * d;

		// n'
		fv[1] =
			n_gamma * (0.5 * F + Phi) * Dn -
			n * ((1-qd)*(1-qd) * 0.5 * d + Psi + A + B + C);

		// x'
		fv[2] = x * b_p * n - x * d_p;
	}

	static std::string show(){
		return "An evolutionary game model by Argasinski et. al. (2025), see paper.";
	}

public:
	char mode = 'a';
	ParamType K = 30000; 		// max population, default from paper
	ParamType u = 0., z = 1.; 	// D function, definition c), default from paper
	ParamType F = 0.9;			// ??, default from paper
	ParamType Phi = 0.5;		// ??, default from paper
	ParamType Psi = 0.2;		// ??, default from paper
	ParamType Omega = 0.0001;	// ??, default from paper
	ParamType d = 1;			// ??, default from paper
	ParamType b_p = 0.0, d_p = 0.0, p = 0.; // predator model params, model disabled: p = 0.;
	ParamType alpha = 0., theta = 1.;// ??, default: no dependence on forcing (alpha = 0.)
};


/**
 * this helps to collect parameters from user input
 * (command line arguments) and to manage file paths.
 */
class ComputationSetup {
public:
	int p = 128;
	int n = 4;
	int Ssteps = 100 * p; // 100 delays to approach attractor
	int Tsteps = 100 * p; // 100 delays on the attractor
	int Psteps = 100; // 100 poincare images

	double delay = 15.0;
	double biff_start = 10.0;
	double biff_end = 20.0;
	double biff_step = 0.1;

	capd::DVector ivp { 0.8, 100, 2 };
	capd::DVector slope { 0.0, 0.0, 0.0 };

	std::string file_prefix = "";
	std::string wd = "./evo"; // default: same as the program
	std::string tmpdir = "./tmp"; // default: same as the program

	std::shared_ptr<DS::Grid> m_grid;
	DEq equation;
	std::string sysmsg;

	bool show_on_screen = false;

	/**
	 * constructor from the parameters given in commend line parameters to the program.
	 * You can also load config file, with the same parameters, for your convenience,
	 * if you pass a command line parameter --config=path/to/a/file
	 * @see directory 'run-configs' for the configurations used in the paper.
	 */
	ComputationSetup(int argc, char* argv[]){
		capd::ddeshelper::ArgumentParser args(argc, argv);
		args.checkConfigFile();	// to load optional config from file with --config=path/to/a/file.txt. NOTE: We can always overwrite values of parameters with command line!
		args.parse("--gamma=", delay, "The delay in the model");
		args.parse("--ivp=", ivp, "The initial values for {q_d, n, x}. Supply as '--ivp={1., 2., 3.}' to avoid cmdline problems with { and spaces. Or use config file.");
		args.parse("--ivp-slope=", slope, "If given, the initial value will be: x(t) = ivp + ivp-slope * t, t in [-gamma, 0] (you can have different slope on each coordinate)");
		args.parse("--D=", equation.mode, {'a', 'b', 'c'}, "version of D (it is 'a', 'b', or 'c', as in paper)");
		args.parse("--K=", equation.K, "max population");
		args.parse("--u=", equation.u, "D function, definition 'c'");
		args.parse("--z=", equation.z, "D function, definition 'c'");
		args.parse("--F=", equation.F, "A parameter from the paper (TODO: docs)");
		args.parse("--Phi=", equation.Phi, "A parameter from the paper (TODO: docs)");
		args.parse("--Psi=", equation.Psi, "A parameter from the paper (TODO: docs)");
		args.parse("--Omega=", equation.Omega, "Defines C=\\Omega*n(t) term in the equation, see paper.");
		args.parse("--d=", equation.d, "A parameter from the paper (TODO: docs)");
		args.parse("--b_p=", equation.b_p, "Predator model parameter, birthrate coefficient");
		args.parse("--d_p=", equation.d_p, "Predator model parameter, deathrate coefficient.");
		args.parse("--p=", equation.p, "Predator model influence on doves. No influence if p = 0.");
		args.parse("--alpha=", equation.alpha, "Periodic forcing term A parameter, the amplitude.");
		args.parse("--theta=", equation.theta, "Periodic forcing term A parameter, the period.");
		args.parse("--biff-start=", biff_start, "Starting value of the parameter for the biffurcation diagram generation");
		args.parse("--biff-end=", biff_end, "End value of the parameter for the biffurcation diagram generation");
		args.parse("--biff-step=", biff_step, "Step between values in the biffurcaton diagram generation.");
		args.parse("--solver-n=", n, "n parameter in $C^n_p$ space, basically order of the method");
		args.parse("--solver-p=", p, "p parameter in $C^n_p$ space, basically defines step size = gamma/solver-p");
		args.parse("--Ssteps=", Ssteps, "initial steps to approach attractor (negative gives full delays)");
		args.parse("--Tsteps=", Tsteps, "computation steps to on the attractor (negative gives full delays)");
		args.parse("--Psteps=", Psteps, "number of images of the set on section. Absolute value will be used.");
		args.parse("--prefix=", file_prefix, "prefix in the name of the generated files");
		args.parse("--wd=", wd, "Working directory (important output files will be put here)");
		args.parse("--tmpdir=", tmpdir, "directory for tmp files, there might be a lot of them, so it should be easy to select by hand for remove.");
		show_on_screen = args.parse("--screen", "If present it forces to open drawings in a window on the screen. Might be annoying to close a lot of those!");
		double T, S;
		if(args.parse("--T=", T, "Computation steps for the plotter. If given, the Tsteps will be ignored and the solution for this time will be computed. ")){
			if (T < 0.) T = -T;
			Tsteps = int(T / delay * p);
		}
		if(args.parse("--S=", S, "Same as --T but for initial integration.")){
			if (S < 0.) S = -S;
			Ssteps = int(S / delay * p);
		}
		if (args.isHelpRequested()){
			std::cerr << args.getHelp() << std::endl;
			throw std::logic_error("Help Requested. Aborting.");
		}
		if (Tsteps < 0) Tsteps = -Tsteps * p;
		if (Ssteps < 0) Ssteps = -Ssteps * p;
		if (Psteps < 0) Psteps = -Psteps;
		if (p < 4 * int(delay))
			std::cerr << "WARNING! p=" << p << p << " is probably too small for delay gamma="<< delay << std::endl;

		if (wd == ".") wd = "";
		if (tmpdir == ".") tmpdir = "";

		if (wd != "") capd::ddeshelper::mkdir_p(wd);
		if (tmpdir != "") capd::ddeshelper::mkdir_p(tmpdir);

		m_grid = std::make_shared<DS::Grid>(DS::Grid(delay/p));

		sysmsg = args.getStoryMessage(" \\\n#");
	}
	/** reinitialize the grid and other things after some parameters change */
	void reinitialize(){
		m_grid = std::make_shared<DS::Grid>(DS::Grid(delay/p));
	}
	/** returns the grid (with the step size) */
	DS::Grid& grid() { return *m_grid; }
	/**
	 * returns the equation with all parameters set properly.
	 * NOTE: Use this instead of defining your own!
	 */
	DEq& rhs() { return equation; }
	/** returns a grid point */
	DS::TimePoint t(int i) { return m_grid->operator()(i); }
	/** returns the delay in form of a timepoint (important to use this!) */
	DS::TimePoint gamma() { return t(p); }
	/** returns a time point from the grid that coresponds to time t=0 */
	DS::TimePoint zero() { return t(0); }

	/** returns a filename to be used within the working or tmp directory (uses prefix) */
	template<typename T>
	std::string filename(T const& suffix){
		std::stringstream oss;
		oss << file_prefix << suffix;
		return oss.str();
	}

	/**
	 * Returns a tmp path.
	 * The tmp paths are used to store temporary or not important files, to not clutter with real results.
	 * For important files use path(...)
	 */
	template<typename T>
	std::string tmp_path(T const& suffix){
		std::stringstream oss;
		if (tmpdir != "")
			oss << tmpdir << (tmpdir.back() == '/' ? "" : "/");
		oss << file_prefix << suffix;
		return oss.str();
	}
	/** returns a nice path within the result working dir */
	template<typename T>
	std::string path(T const& suffix){
		std::stringstream oss;
		if (wd != "")
			oss << wd << (wd.back() == '/' ? "" : "/");
		oss << file_prefix << suffix;
		return oss.str();
	}
};

/**
 * cuts the head of v, i.e., v[0],...,v[n-1]
 * For Vector of dimension d return vector of dimension d-n.
 * Returns zero-dimesnional vector if n >= d.
 * For negative values of n, it will grow the vector,
 * filling the leading coordinates with zeros.
 * It works on capd vectors.
 *
 * Examples:
 * std::vector<double> v = {1, 2, 3};
 * exhead(v, 1); // -> {2, 3}
 * exhead(v, -2); // -> {0, 0, 1, 2, 3}
 */
template<typename VectorSpec>
VectorSpec exhead(VectorSpec const& v, int n=1){
	auto d = v.dimension();
	if (n > 0 && d <= n) return VectorSpec();
	VectorSpec u(d - n);
	auto vi = v.rbegin();
	for (auto ui = u.rbegin(); ui != u.rend() && vi != v.rend(); ++vi, ++ui)
		*ui = *vi;
	return u;
}

#endif /* CUBICIKEDA_SETUP_H_ */
