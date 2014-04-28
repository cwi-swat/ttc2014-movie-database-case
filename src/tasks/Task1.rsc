module tasks::Task1

import MovieMM;
import util::Math;

MovieMM createExample(int N) = createExample(mm({},{},{},{}), N);
		 
MovieMM createExample(MovieMM initialModel, int N) =
	(initialModel| addMM(it, mmi) | i <- [0..N], mmi := createTest(i));
	
MovieMM createTest(int i) =
	addMM(createPositive(i), createNegative(i));
	
MovieMM createPositive(int i) =
	mm(movies, people, groups, pim)
	when movies := {movie(j, "m<j>", toReal(j), 2013) | j <- [10*i..10*i+5]},
		 people := {actor(10*i, "a<10*i>"), actor(10*i+1, "a<10*i+1>"), actor(10*i+2, "a<10*i+2>"),
		            actress(10*i+3, "a<10*i+3>"), actress(10*i+4, "a<10*i+4>")},
		 groups := {},
		 pim := {<10*i, 10*i>, <10*i, 10*i+1>, <10*i, 10*i+2>, <10*i, 10*i+3>,
		         <10*i+1, 10*i>, <10*i+1, 10*i+1>, <10*i+1, 10*i+2>, <10*i+1, 10*i+3>,
		         <10*i+2, 10*i+1>, <10*i+2, 10*i+2>, <10*i+2, 10*i+3>,
		         <10*i+3, 10*i+1>, <10*i+3, 10*i+2>, <10*i+3, 10*i+3>, <10*i+3, 10*i+4>,
		         <10*i+4, 10*i+1>, <10*i+4, 10*i+2>, <10*i+4, 10*i+3>, <10*i+4, 10*i+4>};
		  
MovieMM createNegative(int i) =
	mm(movies, people, groups, pim)
	when movies := {movie(j, "m<j>", toReal(j), 2013) | j <- [10*i+5..10*i+10]},
		 people := {actor(10*i+5, "a<10*i+5>"), actor(10*i+6, "a<10*i+6>"), actress(10*i+7, "a<10*i+7>"),
		            actress(10*i+8, "a<10*i+8>"), actress(10*i+9, "a<10*i+9>")},
		 groups := {},
		 pim := {<10*i+5, 10*i+5>, <10*i+5, 10*i+6>,
		         <10*i+6, 10*i+5>, <10*i+6, 10*i+6>, <10*i+6, 10*i+7>,
		         <10*i+7, 10*i+6>, <10*i+7, 10*i+7>, <10*i+7, 10*i+8>,
		         <10*i+8, 10*i+7>, <10*i+8, 10*i+8>, <10*i+8, 10*i+9>,
		         <10*i+9, 10*i+8>, <10*i+9, 10*i+9>};