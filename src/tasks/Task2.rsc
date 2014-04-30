module tasks::Task2

import MovieMM;
import Set;
import IO;
import Map;

MovieMM findCouples(m:mm(movies, persons, groups, pim)) =
	mm(movies, persons, newGroups(m), pim);

set[Group] newGroups(model:mm(movies, persons, groups, pim)){
    println("Starting grouping");
	map[int movie, set[int] stars] costars = toMap(pim);
	println("Made map from rel");
	map[tuple[int star1, int star2] couple, set[int] movies] couples = ();
	
	set[int] EMPTY = {}; // workaround bug in rascal interpreter.
	for (int movie <- costars, int s1 <- costars[movie], int s2 <- costars[movie], s1 < s2) {
	   couples[<s1, s2>]?EMPTY += {movie};
	}
	println("Grouped");
	r = { couple(0.0, x, y, ms) | <x, y> <- couples, 
	                              ms := couples[<x, y>],
							      size(ms) >= 3 };
    println("Created groups");
    return r;
									  			      
}