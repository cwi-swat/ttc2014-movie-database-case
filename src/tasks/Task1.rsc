module tasks::Task1

import MovieMM;
import util::Math;

MovieMM createExample(int N) = createExample(mm((),(),{},{}), N);
		 
MovieMM createExample(MovieMM m0, int N) =
	( m0 | addMM(it, createTest(i)) | i <- [0..N] );
	
MovieMM createTest(int i) =
	addMM(createPositive(i), createNegative(i));
	
MovieMM createPositive(int i) =
	mm(movies, people, groups, pim)
	when movies := ( j: movie("m<j>", toReal(j), 2013) | j <- [10*i..10*i+5] ),
		 people := ( 10*i: actor("a<10*i>"), 10*i+1: actor("a<10*i+1>"), 10*i+2: actor("a<10*i+2>"),
		             10*i+3: actress("a<10*i+3>"), 10*i+4: actress("a<10*i+4>") ),
		 groups := {},
		 pim := {<10*i, 10*i>, <10*i, 10*i+1>, <10*i, 10*i+2>, <10*i, 10*i+3>,
		         <10*i+1, 10*i>, <10*i+1, 10*i+1>, <10*i+1, 10*i+2>, <10*i+1, 10*i+3>,
		         <10*i+2, 10*i+1>, <10*i+2, 10*i+2>, <10*i+2, 10*i+3>,
		         <10*i+3, 10*i+1>, <10*i+3, 10*i+2>, <10*i+3, 10*i+3>, <10*i+3, 10*i+4>,
		         <10*i+4, 10*i+1>, <10*i+4, 10*i+2>, <10*i+4, 10*i+3>, <10*i+4, 10*i+4>};
		  
MovieMM createNegative(int i) =
	mm(movies, people, groups, pim)
	when movies := (j: movie("m<j>", toReal(j), 2013) | j <- [10*i+5..10*i+10] ),
		 people := (10*i+5: actor("a<10*i+5>"), 10*i+6: actor("a<10*i+6>"),
		            10*i+7: actress("a<10*i+7>"), 10*i+8: actress("a<10*i+8>"), 
		            10*i+9: actress("a<10*i+9>") ),
		 groups := {},
		 pim := {<10*i+5, 10*i+5>, <10*i+5, 10*i+6>,
		         <10*i+6, 10*i+5>, <10*i+6, 10*i+6>, <10*i+6, 10*i+7>,
		         <10*i+7, 10*i+6>, <10*i+7, 10*i+7>, <10*i+7, 10*i+8>,
		         <10*i+8, 10*i+7>, <10*i+8, 10*i+8>, <10*i+8, 10*i+9>,
		         <10*i+9, 10*i+8>, <10*i+9, 10*i+9>};