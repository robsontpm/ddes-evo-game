// see this file for the initialization of the library for this particular example
#include "setup.h"

using namespace std;
using namespace capd;

// The best results so far:
//
//		./numattractor --tmpdir=./tmp --p=128 --n=4 --Ssteps=-1000 --Tsteps=-500 --Psteps=500 --a=1.54
//
// Note: the parameters can be given in any order to the program.
//       it is only important they have the exact form as shown.
//       no spaces are allowed! E.g. --tmpdir=./my tmp is wrong!
//       if you need spaces, you can do '--tmpdir=./my tmp', (the whole parameter together with its name must be inside ''!)
//       spaces after parameter name are forbidden: '--tmpdir = ./my tmp' wil not even work!

///////////////////////////////////////////
///////////////////////////////////////////
int main(int argc, char** argv){
	std::cout.precision(16);
	std::cerr.precision(16);
	ComputationSetup setup(argc, argv);

	// we use the version with tau normalized to 1!
	auto tau = setup.tau();
	auto zero = setup.zero();
	auto order = setup.n;
	auto h = double(setup.t(1));

	DS::Eq eq(setup.a);
	DS::DDEq dde(eq, tau);
	DS::Solver solver(dde, 2*order);

	DS::Segment X(-tau, zero, order, {1.05});
	solver(X, setup.Ssteps);
	capd::ddeshelper::plot_value(setup.path(""), h, X, true);

	DS::Section section(1, 0, 1.);
	DS::PoincareMap P(solver, section, capd::poincare::PlusMinus, 0, setup.Tsteps);

	// this will land the segment on the section and also will produce
	// a fixed shape of the representation as a C^n_p function.
	// this will reduce a little computation times I believe.
	auto Y = X.subcurve(X.t0()-tau);
	X = DS::Segment(-tau, zero, order, {1.05});
	double tp;
	P(Y, X, tp); // to start on section.
	cout << tp << endl;

	auto PX = DS::Segment(-tau, zero, order, {1.05});
	std::vector<DS::Solution> attractor; attractor.push_back(X);
	for (int i = 1; i < setup.Psteps; i++){
		P(X, PX, tp);
		attractor.push_back(PX);
		std::cout << i << " tp = " << tp << endl;
		X = PX;
	}

	// generate the (X, P(X)) or (x_n, x_n+1)
	// poincare plot (like in the 1D logistic map) of values x(t-tau)
	// we should see the bending in it that
	std::ofstream of(setup.path("xpx.dat"));
	std::vector<DS::Vector> U; // we also store solutions as vector in \R^M for future.
	auto const& SX = attractor[0];
	auto x = SX.eval(SX.t0() - tau)[0];
	for (int i = 1; i < attractor.size(); i++){
		auto X = attractor[i];
		auto px = X.eval(X.t0() - tau)[0];
		of << x << " " << px << endl; x = px;
		U.push_back(exhead(DS::Vector(X), 1));
	}
	capd::ddeshelper::plot_many(setup.path(""), {
		"'" + setup.filename("xpx.dat") + "' u 1:2 with points pt 7 ps 1"
	}, true, "XPX");

	// sort the attractor, to have gradient on the section depending on the position
	auto sorted = attractor;
	std::sort(sorted.begin(), sorted.end(), [&](auto const& a, auto const& b){
		return a.eval(a.t0()-tau) < b.eval(b.t0()-tau);
	});

	// make a nice plot, to see the attractor in colours.
	// in the X plot we will have colours sorted accroding to the value of x(t-tau)
	// then we shuld see the gadient mixes in the PX plot, indicating chaotic behaviour.
	std::vector<std::string> plot_all_X, plot_all_PX;
	for (int i = 0; i < sorted.size(); ++i){
		auto& X = sorted[i];
		auto PX = P(X);

		auto make_plots = [&](std::vector<std::string>& plot_all, std::string suffix, DS::Solution& Y){
			auto info = capd::ddeshelper::plot_value(setup.tmp_path(i) + suffix, Y, false);
			std::ostringstream cmd;
			std::string out = setup.tmp_path(i) + suffix + "-numbered.dat";
			cmd << "awk '{print " << i << ", $0}' < " << info.first << " > " << out;
			auto dump = system(cmd.str().c_str());
			plot_all.push_back("'" + setup.filename(i) + suffix + "-numbered.dat' u 2:4:1 with lines notitle lc palette");
		};
		make_plots(plot_all_X, "X", X);
		make_plots(plot_all_PX, "PX", PX);

	}
	for (auto flag: {true, false}){
		capd::ddeshelper::plot_many(setup.tmp_path("ALL_X"), plot_all_X, flag);
		capd::ddeshelper::plot_many(setup.tmp_path("ALL_PX"), plot_all_PX, flag);
	}
	// copy images from tmp dir to the working dir.
	std::ostringstream cmd;
	cmd << "cp " << setup.tmp_path("ALL_X") << ".png " << setup.path("ALL_X") << ".png\n";
	cmd << "cp " << setup.tmp_path("ALL_PX") << ".png " << setup.path("ALL_PX") << ".png\n";
	auto dump = system(cmd.str().c_str());

	// do the PCA/Karhunen-Loeve decomposition to see attractor in nice coordinates.
	int M = U[0].dimension();
	DS::Vector ref(M);
	DS::Matrix C(M, M);
	DS::Vector eigen(M);
	capd::ddeshelper::correlationCoords(M, U, ref, C, eigen, true);
	for (int i = 0; i < 25; ++i)
		cout << "lambda_" << i << ": " << eigen[i] << endl;
	// by the algorithm, C is Orthogonal, and C*C^T = Id (because of normalize=true above
	auto Cinv = C; Cinv.Transpose();
	std::ofstream out_nice_coords(setup.path("-attractor-in-coords.dat"));
	// in scatter[i] we hold all values of (y(u))[i] for all u in U
	std::vector<std::vector<double>> scatter(M);
	for (auto& u: U){
		auto y = Cinv * (u - ref);
		for (int i = 0; i < M; ++i){
			out_nice_coords << y[i] << " ";
			scatter[i].push_back(y[i]);
		}
		out_nice_coords << endl;
	}
	out_nice_coords.close();

	capd::ddeshelper::splot_many(setup.path("-interactive-attractor-in-coords"), {
		"'" + setup.filename("-attractor-in-coords.dat") + "' u 1:2:3 with points pt 7 ps 1"
	}, true);
	capd::ddeshelper::splot_many(setup.path("-attractor-in-coords"), {
		"'" + setup.filename("-attractor-in-coords.dat") + "' u 1:2:3 with points pt 7 ps 1"
	}, false);

	std::ofstream out_scatter(setup.path("-sizes-scatter.dat"));
	out_scatter << "# num diam min_value max_value" << endl;
	for (int i = 0; i < M; i++){
		auto min = *std::min_element(scatter[i].begin(), scatter[i].end());
		auto max = *std::max_element(scatter[i].begin(), scatter[i].end());
		auto diam = max - min;
		out_scatter << i << " " << diam << " " << min << " " << max << endl;
	}
	out_scatter.close();

	for (auto flag: {true, false}){
		capd::ddeshelper::plot_many(setup.path("-sizes-scatter-diameters"), {
			"'" + setup.filename("-sizes-scatter.dat") + "' u 1:2 with points pt 7 ps 1"
		}, flag);
	}

	return 0;

}
///////////////////////////////////////////
///////////////////////////////////////////

