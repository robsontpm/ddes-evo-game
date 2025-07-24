cd ../bin
grep "^./biffdiag" ../run-tasks/biffdiag-tasks.sh  | xargs -I{} -n 1 -P 10 bash -c {}