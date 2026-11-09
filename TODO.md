NEW Task: Lyapunov exponents
---
This repository computes biffurcation diagrams ond some periodic orbits for a DDE (Delay Differential Equation) defined as in setup.h file. 
The run files are in ./scripts directory, there are also other directories that define the runs. 
In this task I am interested in the biffurcation diagram.
I need to generate lyapunov exponents for the DDE, for each of the setup files used for the biffurcation diagram, as the delay parameter changes in the same ranges. 
For this use python3 code using JiTCDDE library to compute lyapunov exponents. Then use gnuplot to plot the values of 3-5 of the dominant ones. 
I want to be able to rerun the computations easily, and to easily modify the gnuplot files (to match the style of the publication, etc.).
