module tasks::Task2

import MovieMM;
import Set;
import IO;
import Map;

MovieMM findCouples(m:mm(movies, persons, groups, pim)) =
	mm(movies, persons, newGroups(m), pim);
	
set[Group] newGroups(model:mm(movies, persons, groups, pim)){
	costars = toMap(pim);
	map[tuple[int,int], set[int]] couples = ();
	for (int movie <- costars){
		costarsInMovie = costars[movie];
		for (<x,y> <- costarsInMovie*costarsInMovie){
			if (x < y)
				if (<x,y> in couples)
					couples[<x,y>] = couples[<x,y>] + movie;
				else
					couples[<x,y>] = {}; 
		}
	}
	return {couple(0.0, p1, p2, getMovies(ms, model)) | <p1,p2> <- domain(couples),
									  size(couples[<p1,p2>]) >= 3,
									  ms := couples[<p1,p2>]};
}