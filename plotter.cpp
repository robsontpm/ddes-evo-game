// see this file for the initialization of the library for this particular example
#include "setup.h"

using namespace std;
using namespace capd;

///////////////////////////////////////////
///////////////////////////////////////////
int main(int argc, char** argv){
	try{
		std::cout.precision(16);
		std::cerr.precision(16);
		ComputationSetup setup(argc, argv);

		auto gamma = setup.gamma();
		auto zero = setup.zero();
		auto order = setup.n;
		auto h = double(setup.t(1));

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
		capd::ddeshelper::plot_value(setup.path("X"), h, X, setup.show_on_screen);
		std::cout << dde(zero, X) << endl;

		if (setup.Ssteps){
			solver(X, setup.Ssteps);
			capd::ddeshelper::plot_value(setup.path(""), h, X, setup.show_on_screen);
		}

		ofstream out(setup.path("phase.dat"));
		out << "# " << setup.sysmsg << endl;
		out << "# step:1 time:2 ";
		out << "qd(t):3 qd(t-\\gamma):4 ";
		out << "n(t):5 n(t-\\gamma):6 ";
		out << "x(t):7 x(t-\\gamma):8 ";
		out << endl;
		out.precision(16);
		for (int i = 0; i < setup.Tsteps; ++i){
			solver(X);
			auto xt = X.eval(X.t0());
			auto xtau = X.eval(X.t0() - gamma);
			out << i << " " << i * double(h);
			for (int i = 0; i < xt.dimension(); ++i)
				out << " " << xt[i] << " " << xtau[i];
			out << endl;
		}
		out.close();

		for (auto mode: {setup.show_on_screen, false}) {
			capd::ddeshelper::plot_many(setup.path("qd-sol"), {
				" '" + setup.filename("phase.dat") + "' using 2:3 with lines title 'q_d(t)'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("n-sol"), {
				" '" + setup.filename("phase.dat") + "' using 2:5 with lines title 'n(t)'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("x-sol"), {
				" '" + setup.filename("phase.dat") + "' using 2:7 with lines title 'x(t)'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("all-sol"), {
				" '" + setup.filename("phase.dat") + "' using 2:3 with lines title 'q_d(t)'",
				" '" + setup.filename("phase.dat") + "' using 2:5 with lines title 'n(t)'",
				" '" + setup.filename("phase.dat") + "' using 2:7 with lines title 'x(t)'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("qd-phase"), {
				" '" + setup.filename("phase.dat") + "' using 3:4 with lines title 'q_d'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("n-phase"), {
				" '" + setup.filename("phase.dat") + "' using 5:6 with lines title 'n'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("x-phase"), {
				" '" + setup.filename("phase.dat") + "' using 7:8 with lines title 'x'",
			}, mode);
			capd::ddeshelper::plot_many(setup.path("qd-vs-n"), {
				" '" + setup.filename("phase.dat") + "' using 5:3 with lines notitle",
			}, mode);
			if (mode == false) break; // to break if the user-specified mode is false.
		}
	} catch (std::exception& ex){
		std::cout << "WARNING: exception caught: " << ex.what() << endl;
	}
	return 0;

}
///////////////////////////////////////////
///////////////////////////////////////////

