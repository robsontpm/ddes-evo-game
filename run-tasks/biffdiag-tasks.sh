# this file contains all the computations needed
# to recreate the biffurcation diagrams
# you can run them one by one or you can execute one of the files in ../run-scripts
#####################################################################################
###### D.1 - D(n) == 1   #######
# const ivp
simple part
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=5000.0 --biff-start=1.0 --biff-end=10.0 --biff-step=0.01 --prefix=D1_a_01-10--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=5000.0 --biff-start=10.01 --biff-end=15.0 --biff-step=0.01 --prefix=D1_a_10-15--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=5000.0 --biff-start=15.01 --biff-end=20.0 --biff-step=0.01 --prefix=D1_a_15-20--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=5000.0 --biff-start=20.01 --biff-end=25.0 --biff-step=0.01 --prefix=D1_a_20-25--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=5000.0 --biff-start=25.01 --biff-end=30.0 --biff-step=0.01 --prefix=D1_a_25-30--
# more difficult part!
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=5000.0 --biff-start=30.01 --biff-end=32.0 --biff-step=0.01 --prefix=D1_a_30-32--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=6000.0 --biff-start=32.01 --biff-end=34.0 --biff-step=0.01 --prefix=D1_a_32-34--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=7000.0 --biff-start=34.01 --biff-end=36.0 --biff-step=0.01 --prefix=D1_a_34-36--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=8000.0 --biff-start=36.01 --biff-end=38.0 --biff-step=0.01 --prefix=D1_a_36-38--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=9000.0 --biff-start=38.01 --biff-end=40.0 --biff-step=0.01 --prefix=D1_a_38-40--
# the most difficult part
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=40.01 --biff-end=41.0 --biff-step=0.01 --prefix=D1_a_40-41--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=41.01 --biff-end=42.0 --biff-step=0.01 --prefix=D1_a_41-42--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=42.01 --biff-end=43.0 --biff-step=0.01 --prefix=D1_a_42-43--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=43.01 --biff-end=44.0 --biff-step=0.01 --prefix=D1_a_43-44--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=44.01 --biff-end=45.0 --biff-step=0.01 --prefix=D1_a_44-45--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=45.01 --biff-end=46.0 --biff-step=0.01 --prefix=D1_a_45-46--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=46.01 --biff-end=47.0 --biff-step=0.01 --prefix=D1_a_46-47--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=47.01 --biff-end=48.0 --biff-step=0.01 --prefix=D1_a_47-48--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=48.01 --biff-end=49.0 --biff-step=0.01 --prefix=D1_a_48-49--
./biffdiag --config=../run-configs/case2-1--const-ivp-vanilla.conf --S=10000.0 --biff-start=49.01 --biff-end=50.0 --biff-step=0.01 --prefix=D1_a_49-50--
####### D.2 - logistic equation.  #######
## const ivp
# simple part
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=1.0 --biff-end=10.0 --biff-step=0.01 --prefix=D2_a_01-10--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=10.01 --biff-end=15.0 --biff-step=0.01 --prefix=D2_a_10-15--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=15.01 --biff-end=20.0 --biff-step=0.01 --prefix=D2_a_15-20--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=20.01 --biff-end=25.0 --biff-step=0.01 --prefix=D2_a_20-25--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=25.01 --biff-end=30.0 --biff-step=0.01 --prefix=D2_a_25-30--
# more difficult part!
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=5000.0 --biff-start=30.01 --biff-end=32.0 --biff-step=0.01 --prefix=D2_a_30-32--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=6000.0 --biff-start=32.01 --biff-end=34.0 --biff-step=0.01 --prefix=D2_a_32-34--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=7000.0 --biff-start=34.01 --biff-end=36.0 --biff-step=0.01 --prefix=D2_a_34-36--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=8000.0 --biff-start=36.01 --biff-end=38.0 --biff-step=0.01 --prefix=D2_a_36-38--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=9000.0 --biff-start=38.01 --biff-end=40.0 --biff-step=0.01 --prefix=D2_a_38-40--
# the most difficult part
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=40.01 --biff-end=41.0 --biff-step=0.01 --prefix=D2_a_40-41--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=41.01 --biff-end=42.0 --biff-step=0.01 --prefix=D2_a_41-42--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=42.01 --biff-end=43.0 --biff-step=0.01 --prefix=D2_a_42-43--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=43.01 --biff-end=44.0 --biff-step=0.01 --prefix=D2_a_43-44--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=44.01 --biff-end=45.0 --biff-step=0.01 --prefix=D2_a_44-45--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=45.01 --biff-end=46.0 --biff-step=0.01 --prefix=D2_a_45-46--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=46.01 --biff-end=47.0 --biff-step=0.01 --prefix=D2_a_46-47--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=47.01 --biff-end=48.0 --biff-step=0.01 --prefix=D2_a_47-48--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=48.01 --biff-end=49.0 --biff-step=0.01 --prefix=D2_a_48-49--
./biffdiag --config=../run-configs/case2-2--const-ivp-vanilla.conf --S=10000.0 --biff-start=49.01 --biff-end=50.0 --biff-step=0.01 --prefix=D2_a_49-50--
###### D3 - Lasota? #######
# const IVP.
simple part
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=1.0 --biff-end=2.0 --biff-step=0.01 --prefix=D3_a_01-02--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=15000.0 --biff-start=2.01 --biff-end=3.0 --biff-step=0.005 --prefix=D3_a_02-03--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=3.005 --biff-end=4.0 --biff-step=0.01 --prefix=D3_a_03-04--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=15000.0 --biff-start=4.01 --biff-end=4.5 --biff-step=0.0005 --prefix=D3_a_04-04--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=4.505 --biff-end=10.0 --biff-step=0.005 --prefix=D3_a_04-10--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=10.005 --biff-end=15.0 --biff-step=0.005 --prefix=D3_a_10-15--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=15.005 --biff-end=20.0 --biff-step=0.005 --prefix=D3_a_15-20--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=20.005 --biff-end=25.0 --biff-step=0.005 --prefix=D3_a_20-25--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=25.005 --biff-end=30.0 --biff-step=0.005 --prefix=D3_a_25-30--
# more difficult part!
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=5000.0 --biff-start=30.005 --biff-end=32.0 --biff-step=0.005 --prefix=D3_a_30-32--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=6000.0 --biff-start=32.005 --biff-end=34.0 --biff-step=0.005 --prefix=D3_a_32-34--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=7000.0 --biff-start=34.005 --biff-end=36.0 --biff-step=0.005 --prefix=D3_a_34-36--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=8000.0 --biff-start=36.005 --biff-end=38.0 --biff-step=0.005 --prefix=D3_a_36-38--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=15000.0 --biff-start=38.005 --biff-end=40.0 --biff-step=0.005 --prefix=D3_a_38-40--
# the most difficult part
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=40.002 --biff-end=41.0 --biff-step=0.002 --prefix=D3_a_40-41--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=41.002 --biff-end=42.0 --biff-step=0.002 --prefix=D3_a_41-42--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=42.002 --biff-end=43.0 --biff-step=0.002 --prefix=D3_a_42-43--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=43.002 --biff-end=44.0 --biff-step=0.002 --prefix=D3_a_43-44--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=44.002 --biff-end=45.0 --biff-step=0.002 --prefix=D3_a_44-45--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=45.002 --biff-end=46.0 --biff-step=0.002 --prefix=D3_a_45-46--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=46.002 --biff-end=47.0 --biff-step=0.002 --prefix=D3_a_46-47--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=47.002 --biff-end=48.0 --biff-step=0.002 --prefix=D3_a_47-48--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=48.002 --biff-end=49.0 --biff-step=0.002 --prefix=D3_a_48-49--
./biffdiag --config=../run-configs/case2-3--const-ivp-vanilla.conf --S=30000.0 --biff-start=49.002 --biff-end=50.0 --biff-step=0.002 --prefix=D3_a_49-50--