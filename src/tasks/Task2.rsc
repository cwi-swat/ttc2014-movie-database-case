module tasks::Task2

import MovieMM;
import Set;
import IO;
import Map;

MovieMM findCouples(m:mm(movies, persons, groups, pim)) =
	mm(movies, persons, newGroups(m), pim);

set[Group] newGroups(model:mm(movies, persons, groups, pim)){
	costars = toMap(pim);
	couples = 
		(() | it + (<x, y> : (<x, y> in it ? (it[<x, y>] + movie) : {movie})) | movie <- costars,
															     				costarsInMovie := costars[movie],
																 				<x, y> <- costarsInMovie * costarsInMovie,
																 				x < y); 
	return {couple(0.0, x, y, getMovies(ms, model)) | <x, y> <- domain(couples),
									  				  size(couples[<x, y>]) >= 3,
									  			      ms := couples[<x, y>]};
}