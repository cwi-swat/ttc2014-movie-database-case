ttc2014-movie-database-case
===========================

Rascal submission to Transformation Tool Contest 2014 - The Movie Database Case

To run the smoke test (Task 2, Task 3, Extension Task 2):

    ./run.sh
    
To run the smoke test.

To benchmark grouping on .movies file(s) in `./input` do:

    ./run.sh benchmark 2,3 input/*.movies

The comma separated list indicates the group sizes to run benchmarks
on. NB: already with group size 3 it takes _very_ long. The benchmark
prints a map from bechmark case to milliseconds (wall clock time).

