# R. Szczelina, "Bifurcation diagram for evolutionary game system"

This repository contains codes needed to redo the computation of the bifurcation disgrams 
in a work "TODO: put work info here". 

### Requirements:

The program is written in C++ and has been tested under Linux Ubuntu 20.04 with gcc (Ubuntu 9.4.0-1ubuntu1~20.04.2) compiler. 
The program uses the [capdDDEs](https://github.com/robsontpm/capdDDEs) library, which in turn is based on [CAPD](http://capd.ii.uj.edu.pl/),
and all their requirements must be satisfied. The required libraries will be installed when following the intallation instruction.

### Instalation instruction:

- Follow the initalation instructions on the page of [capdDDEs](https://github.com/robsontpm/capdDDEs).
- When the library and its dependencies are installed, please navigate to the directory ``program/results``: ``cd program/results``.
- In this diectory clone the repository: ``git clone https://github.com/robsontpm/capdDDEs.git``.
- enter the directory ``ddes-evo-game``: ``cd ddes-evo-game``.
- compile necessary files: ``make all``.
- after compilation finishes the programs will be in ``bin``.

### Running programs:

You can run programs yourself. The programs has ``--help`` option to show the possible options to modify the run parameters. 

For the convenience of the rreader setup files to generate diagrams from the papaer are stored in ``run-configs/``, the
list of runs to be executed in ``run-configs/``, and utilitary scripts in ``scripts/``. 

In principle it is enough to run two scripts from ``scripts/``:

- ```bash run-biffdiag.sh```
- ```bash run-periodic.sh```

Then two scripts:

- ```bash collect-biffdiag.sh```
- ```bash collect-periodic.sh```

Can be used to aggregate the data into a single image. 

### Output:

All aoutput will be stored inside ``./bin`` directory. 