module Plugin

import lang::xml::DOM;
import IO;
import XML2IMDB;
import IMDB;
import tasks::ETask1;
import tasks::ETask2;
import tasks::Task1;
import tasks::Task2;
import tasks::Task3;
import util::Benchmark;
import List;
import String;

/*
Task 2 (Finding couples). This benchmark should be executed using two different sets of input data:
(a) synthetic test data generated using the transformation for Task 1,
(b) provided data from the IMDb movie database (available at [6]; parsable, e.g., using [5]).
For both cases, you should run the transformation for Task 2 and measure the time
needed to complete the transformation (without loading and saving the model). 
*/


map[str, num] benchmarkTask2a() {
  sizes = [1000, 2000]; //, 3000, 4000, 5000, 10000, 50000, 100000, 200000];
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


IMDB load(loc f) = xml2imdb(parseXMLDOMTrim(readFile(f)));

map[str,num] benchmarkCliqueFinding(loc f, int n) 
  = benchmarkCliqueFinding(f.path, load(f), n);

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

void smokeTest() {
  l = |cwd:///input/imdb-0005000-49930.movies|;
  println("Loading <l.path>...");
  m = xml2imdb(parseXMLDOMTrim(readFile(l)));
  
  println("Adding couples");
  m2 = addCouples(m);
  
  println("Adding group ratings...");
  m3 = addGroupRatings(m2);
  
  println("Top 15 avg rating...");
  iprintln(top15avgRating(m3));
  
  println("Top 15 num of movies...");
  iprintln(top15commonMovies(m3));
  
  println("Done.");
}

int main(list[str] args) {
  if (args == []) {
    println("Running smoke test.");
    smokeTest();
  }
  else if (size(args) >= 2, args[0] == "benchmark", /([0-9]+[,]?)+/ := args[1]) {
    println("Benchmark with inputs:\n- <intercalate("\n- ", args[2..])>");
    println("(group sizes: <args[1]>)");
    b = ();
    
    for (gs <- [ toInt(x) | x <- split(",", args[1]) ], i <- [2..size(args)]) {
      l = |cwd:///<args[i]>|;
      println("Benchmarking <l.path> with group size <gs>...");
      b += benchmarkCliqueFinding(l, gs);
    }
    iprintln(b);
  }
  else {
    println("Usage: java -Xmx2G -Xss32m -jar rascal-shell.jar benchmark 2,3,4 input/*.movies");
    println("or: java -Xmx2G -Xss32m -jar rascal-shell.jar to run smoke test.");
    return 1;
  }
  return 0;
}