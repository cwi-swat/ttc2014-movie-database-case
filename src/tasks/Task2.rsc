module tasks::Task2

import IMDB;
import Set;
import Map;

IMDB addCouples(IMDB m) = m[groups=makeCouples(m)];

set[Group] makeCouples(IMDB m){
	map[int movie, set[int] stars] costars = toMap(m.stars);
	map[tuple[int star1, int star2] couple, set[int] movies] couples = ();
	
	set[int] EMPTY = {}; // workaround bug in rascal interpreter.
	for (int movie <- costars, int s1 <- costars[movie], int s2 <- costars[movie], s1 < s2) {
	   couples[<s1, s2>]?EMPTY += {movie};
	}
	
	return { couple(0.0, x, y, ms) | <x, y> <- couples, ms := couples[<x, y>], size(ms) >= 3 };
}