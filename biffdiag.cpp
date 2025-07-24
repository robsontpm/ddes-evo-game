// see this file for the initialization of the library for this particular example
#include "setup.h"

using namespace std;
using namespace capd;

///////////////////////////////////////////
///////////////////////////////////////////

int main(int argc, char** argv){
	std::cout.precision(16);
	std::cerr.precision(16);
	ComputationSetup setup(argc, argv);

	std::ofstream of(setup.path("biff.dat"));
	of.precision(15);
	of << "# " << setup.sysmsg << "\n";
	of << "# this is a bifurcation diagram on a section n'(t-gamma) = 0. (both sides). \n";
	of << "# the flag parameter means if the Poincare map succeeded. If not (flag=0) then probably this is a fixed point. \n";
	of << "# a:1 flag:2 q_d:3 n:4 x:5\n";
	of << std::flush;
	for(double a = setup.biff_start; a < setup.biff_end; a += setup.biff_step){
		auto save = [&](DVector const& x, int flag){ of << a << " " << flag << " " << x[0] << " " << x[1] << " " << x[2] << endl; };
		setup.delay = a;
		setup.p = int(setup.delay * 10); // this is a hack... TODO: apply time change, so delay = 1 always.
		setup.reinitialize();
		auto gamma = setup.gamma();
		auto zero = setup.zero();
		auto order = setup.n;
		auto h = double(setup.t(1));
		cout << "Doing delay=" << setup.delay << ", gamma=" << gamma << endl;

		DS::DDEq dde(setup.rhs(), gamma);
		DS::Solver solver(dde, 2*order);

		capd::DMap ivp("par:q0,n0,x0,qs,ns,xs;var:t;fun:q0+qs*t,n0+ns*t,x0+xs*t;", order+2);
		ivp.setParameter("q0", setup.ivp[0]);
		ivp.setParameter("n0", setup.ivp[1]);
		ivp.setParameter("x0", setup.ivp[2]);
		ivp.setParameter("qs", setup.slope[0]);
		ivp.setParameter("ns", setup.slope[1]);
		ivp.setParameter("xs", setup.slope[2]);
		DS::Segment X(-gamma, zero, order, ivp);
		solver(X, setup.Ssteps);
//		capd::ddeshelper::plot_value(setup.path(a), h, X, setup.show_on_screen);
//		for (auto mode: {setup.show_on_screen, false}) {
//			capd::ddeshelper::plot_many(setup.path(a), {
//				" '" + setup.filename(a) + "ddes-plot.dat" + "' using 1:5 with lines title 'n(t)'",
//			}, mode);
//		}

		DS::Segment secsol(-gamma, zero, order, {0., 0., 0.});
		secsol.j(-gamma, 1)[1] = 1.0; // n'(t-\gamma)
//		std::cout << DVector(secsol) << endl;
//		std::cout << secsol << endl;
		DS::Section section(3, setup.p, setup.n, DVector(secsol), 0.); // n'(t-\gamma) == 0.
		DS::PoincareMap PP(solver, section, capd::poincare::PlusMinus, 0, setup.Tsteps);
		DS::PoincareMap PM(solver, section, capd::poincare::MinusPlus, 0, setup.Tsteps);

		// this will land the segment on the section and also will produce
		// a fixed shape of the representation as a C^n_p function.
		// this will reduce a little computation times I believe.
		auto Y = X.subcurve(X.t0() - gamma);
		X = DS::Segment(-gamma, zero, order, setup.ivp);
		double tp;
		try {
			PP.setRequiredSteps(0);
			PM.setRequiredSteps(0);
			PP(Y, X, tp);
			auto x = X.eval(X.t0() - gamma);
			auto dx = X.j(X.t0() - gamma, 1);
			auto d2x = X.j(X.t0() - gamma, 2);
			std::cout << "   " << 0 << " " << 0 << " " << x[1] << " " << dx[1] << " " << d2x[1] << endl;
			auto PX = DS::Segment(-gamma, zero, order, setup.ivp);
			save(x, 1);
			for (int i = 1; i < setup.Psteps; i++){
				PP.setRequiredSteps(0);
				PM.setRequiredSteps(0);
				if (i % 2 == 1)
					PM(X, PX, tp);
				else
					PP(X, PX, tp);
				X = PX;
				x = X.eval(X.t0() - gamma);
				dx = X.j(X.t0() - gamma, 1);
				d2x = X.j(X.t0() - gamma, 2);
				std::cout << "   " << i << " " << tp << " " << x[1] << " " << dx[1] << " " << d2x[1] << endl;
				save(x, 1);
			}
		} catch (std::logic_error& ex) {
			std::cerr << ex.what() << endl;
			auto x = Y.eval(Y.t0() - gamma);
			save(x, 0);
		}
	}
	of.close();

	for (auto mode: {setup.show_on_screen, false}) {
		capd::ddeshelper::plot_many(setup.path("biff-qd"), {
			" '" + setup.filename("biff.dat") + "' using 1:3 with points pt 7 ps 0.5 title 'q_d'",
		}, mode);
		capd::ddeshelper::plot_many(setup.path("biff-n"), {
			" '" + setup.filename("biff.dat") + "' using 1:4 with points pt 7 ps 0.5 title 'n'",
		}, mode);
		capd::ddeshelper::plot_many(setup.path("biff-x"), {
			" '" + setup.filename("biff.dat") + "' using 1:5 with points pt 7 ps 0.5 title 'x'",
		}, mode);
		if (mode == false) break; // to break if the user-specified mode is false.
	}

	return 0;

}
///////////////////////////////////////////
///////////////////////////////////////////

