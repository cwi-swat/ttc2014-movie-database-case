module Plugin

import lang::xml::DOM;
import IO;
import XML2MovieMM;
import MovieMM;
import tasks::ETask2;
import tasks::Task2;
import util::Benchmark;

/*
Task 2 (Finding couples). This benchmark should be executed using two different sets of input data:
(a) synthetic test data generated using the transformation for Task 1,
(b) provided data from the IMDb movie database (available at [6]; parsable, e.g., using [5]).
For both cases, you should run the transformation for Task 2 and measure the time
needed to complete the transformation (without loading and saving the model). 
*/


void benchmarkTask2a() {
}




map[str,num] benchmarkCliqueFinding(loc f, int n) 
  = benchmarkCliqueFinding(f, moviem(parseXMLDOMTrim(readFile(f))), n);

map[str, num] benchmarkCliqueFinding(loc f, MovieMM m, int n) 
  = n == 2 
  ? benchmark(("<f> - <n> ": () { addCouples(m); }))
  : benchmark(("<f> - <n> ": () { addCliques(m, n); }));

/*
If you solved also the extension task 2 (finding cliques), please also generate benchmarks for 
these cases using n ∈ {3, 4, 5} for the synthetic test models and n = 3 for the IMDb models.
In order to evaluate the scalability of the solution and to compare it with other solutions, 
you should use specific input models / model sizes. For the synthetic test data, 
please use the values for N shown in Table 1. For the IMDb data version, 
please use the provided models listed in Table 2. The models are available on request2.
*/

int main(str movieFile = "") {
  l = |project://ttc2014-movie-database-case/<movieFile>|;
  for (i <- [2..5]) {
    b = benchmarkCliqueFinding(l, i);
    iprintln(b);
  }
  return 0;
}