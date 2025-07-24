cd ../bin
grep "^./plotter" ../run-tasks/periodic-tasks.sh  | xargs -I{} -n 1 -P 10 bash -c {}