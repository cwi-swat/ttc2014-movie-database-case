module Plugin

import lang::xml::DOM;
import IO;
import XML2IMDB;
import IMDB;
import tasks::ETask2;
import tasks::Task1;
import tasks::Task2;
import util::Benchmark;

/*
Task 2 (Finding couples). This benchmark should be executed using two different sets of input data:
(a) synthetic test data generated using the transformation for Task 1,
(b) provided data from the IMDb movie database (available at [6]; parsable, e.g., using [5]).
For both cases, you should run the transformation for Task 2 and measure the time
needed to complete the transformation (without loading and saving the model). 
*/


map[str, num] benchmarkTask2a() {
  sizes = [1000, 2000, 3000, 4000, 5000, 10000, 50000, 100000, 200000];
  bs = ();
  for (i <- sizes, j <- [2..6]) {
    println("SIZE = <i>, cliquesize = <j>");
    m = createExample(i);
    //iprintln(m);
    bs += benchmarkCliqueFinding("synth<i>", m, j);
  }
  iprintln(bs);
  return bs;
}




map[str,num] benchmarkCliqueFinding(loc f, int n) 
  = benchmarkCliqueFinding(f.path, moviem(parseXMLDOMTrim(readFile(f))), n);

map[str, num] benchmarkCliqueFinding(str key, IMDB m, int n) 
  = n == 2 
  ? benchmark(("<key>(<n>)": () { addCouples(m); }))
  : benchmark(("<key>(<n>)": () { addCliques(m, n); }));

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
  //for (i <- [3]) {
    b = benchmarkCliqueFinding(l, 2);
    iprintln(b);
  //}
  return 0;
}