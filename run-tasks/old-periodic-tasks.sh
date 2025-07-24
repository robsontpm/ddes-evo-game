# this file contains all the computations needed
# to recreate the various periodic orbits accompanying the biffurcation diagrams
# you can run them one by one or you can execute one of the files in ../run-scripts
######################################################################################
####### D3 - Lasota? #######
## const IVP.
# # jump around 3.2
#./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.50 --solver-p=100 --S=50000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.50--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.60 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.60--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.70 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.70--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.80 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.80--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.90 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.90--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.00 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.00--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.10 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.10--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.20 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.20--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.30 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.30--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.40 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.40--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.50 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.50--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.55 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.55--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.65 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.65--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.75 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.75--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.85 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.85--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=2.95 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma2.95--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.05 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.05--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.15 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.15--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.25 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.25--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.35 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.35--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.45 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.45--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.55 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.55--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.11 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.11--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.12 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.12--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.13 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.13--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=3.14 --solver-p=100 --S=10000.0 --T=100.0 --prefix=periodic_D3_a_gamma3.14--
# # blue sky in n(t) around 18
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=17.7 --solver-p=170 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma17.7--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=17.8 --solver-p=170 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma17.8--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=17.9 --solver-p=170 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma17.9--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=18.0 --solver-p=180 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma18.0--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=18.1 --solver-p=180 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma18.1--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=18.2 --solver-p=180 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma18.2--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=18.3 --solver-p=180 --S=10000.0 --T=150.0 --prefix=periodic_D3_a_gamma18.3--
# crossing around co
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.0 --solver-p=210 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.0--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.1 --solver-p=211 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.1--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.2 --solver-p=212 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.2--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.3 --solver-p=213 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.3--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.4 --solver-p=214 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.4--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.5 --solver-p=215 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.5--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.6 --solver-p=210 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.6--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.7 --solver-p=211 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.7--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.8 --solver-p=212 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.8--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=21.9 --solver-p=213 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma21.9--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=22.0 --solver-p=214 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma22.0--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=22.1 --solver-p=210 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma22.1--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=22.2 --solver-p=211 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma22.2--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=22.3 --solver-p=212 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma22.3--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=22.4 --solver-p=213 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma22.4--
./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=22.5 --solver-p=214 --S=10000.0 --T=250.0 --prefix=periodic_D3_a_gamma22.5--
# # blue sky in q(t) around 31.2-31.4
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.00 --solver-p=311 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.00--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.05 --solver-p=311 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.05--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.10 --solver-p=311 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.10--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.15 --solver-p=311 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.15--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.20 --solver-p=312 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.20--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.25 --solver-p=312 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.25--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.30 --solver-p=313 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.30--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.35 --solver-p=313 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.35--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.40 --solver-p=314 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.40--
# # blue sky in q(t) around 32.0
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.90 --solver-p=319 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.90--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=31.95 --solver-p=319 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma31.95--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=32.00 --solver-p=320 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma32.00--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=32.05 --solver-p=320 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma32.05--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=32.10 --solver-p=321 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma32.10--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=32.15 --solver-p=321 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma32.15--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=32.20 --solver-p=322 --S=10000.0 --T=400.0 --prefix=periodic_D3_a_gamma32.20--
# # blue sky in q(t) around 36.5
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.30 --solver-p=363 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.30--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.35 --solver-p=363 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.35--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.40 --solver-p=364 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.40--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.45 --solver-p=364 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.45--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.50 --solver-p=365 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.50--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.55 --solver-p=365 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.55--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.60 --solver-p=366 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.60--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.65 --solver-p=366 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.65--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=36.70 --solver-p=367 --S=20000.0 --T=400.0 --prefix=periodic_D3_a_gamma36.70--
# onset of chaos 40.20
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.50 --solver-p=405 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.50--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.55 --solver-p=405 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.55--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.60 --solver-p=406 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.60--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.65 --solver-p=406 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.65--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.70 --solver-p=407 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.70--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.75 --solver-p=407 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.75--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.80 --solver-p=408 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.80--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.85 --solver-p=408 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.85--
# ./plotter --config=../run-configs/case2-3--const-ivp-vanilla.conf --gamma=40.90 --solver-p=409 --S=40000.0 --T=5000.0 --prefix=periodic_D3_a_gamma40.90--