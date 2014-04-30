module tasks::Task1

import IMDB;
import util::Math;

IMDB createExample(int N) = createExample(imdb((),(),{},{}), N);
		 
IMDB createExample(IMDB m0, int N) =
	( m0 | mergeDB(it, createTest(i)) | i <- [0..N] );
	
IMDB createTest(int i) =
	mergeDB(createPositive(i), createNegative(i));
	
IMDB createPositive(int i) =
	imdb(movies, people, groups, stars)
	when movies := ( j: movie("m<j>", toReal(j), 2013) | j <- [10*i..10*i+5] ),
		 people := ( 10*i: actor("a<10*i>"), 10*i+1: actor("a<10*i+1>"), 10*i+2: actor("a<10*i+2>"),
		             10*i+3: actress("a<10*i+3>"), 10*i+4: actress("a<10*i+4>") ),
		 groups := {},
		 stars := {<10*i, 10*i>, <10*i, 10*i+1>, <10*i, 10*i+2>, <10*i, 10*i+3>,
		         <10*i+1, 10*i>, <10*i+1, 10*i+1>, <10*i+1, 10*i+2>, <10*i+1, 10*i+3>,
		         <10*i+2, 10*i+1>, <10*i+2, 10*i+2>, <10*i+2, 10*i+3>,
		         <10*i+3, 10*i+1>, <10*i+3, 10*i+2>, <10*i+3, 10*i+3>, <10*i+3, 10*i+4>,
		         <10*i+4, 10*i+1>, <10*i+4, 10*i+2>, <10*i+4, 10*i+3>, <10*i+4, 10*i+4>};
		  
IMDB createNegative(int i) =
	imdb(movies, people, groups, stars)
	when movies := (j: movie("m<j>", toReal(j), 2013) | j <- [10*i+5..10*i+10] ),
		 people := (10*i+5: actor("a<10*i+5>"), 10*i+6: actor("a<10*i+6>"),
		            10*i+7: actress("a<10*i+7>"), 10*i+8: actress("a<10*i+8>"), 
		            10*i+9: actress("a<10*i+9>") ),
		 groups := {},
		 stars := {<10*i+5, 10*i+5>, <10*i+5, 10*i+6>,
		         <10*i+6, 10*i+5>, <10*i+6, 10*i+6>, <10*i+6, 10*i+7>,
		         <10*i+7, 10*i+6>, <10*i+7, 10*i+7>, <10*i+7, 10*i+8>,
		         <10*i+8, 10*i+7>, <10*i+8, 10*i+8>, <10*i+8, 10*i+9>,
		         <10*i+9, 10*i+8>, <10*i+9, 10*i+9>};
		         
IMDB mergeDB(imdb(movies1, persons1, groups1, stars1), imdb(movies2, persons2, groups2, stars2)) =
    imdb(movies1 + movies2, persons1 + persons2, groups1 + groups2, stars1 + stars2);
