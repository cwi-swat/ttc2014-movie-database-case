module tasks::ETask2

import MovieMM;
import Set;
import IO;
import Map;
import Utils;

MovieMM findCliques(m:mm(movies, persons, groups, pim), int n) =
	mm(movies, persons, newGroups(m, n), pim);

set[Group] newGroups(model:mm(movies, persons, groups, pim), int n){
	costars = toMap(pim);
	cliques = 
		(() | it + (s : (s in it ? (it[s] + movie) : {movie})) | movie <- costars,
															     costarsInMovie := costars[movie],
																 s <- comb(costarsInMovie, n)); 
	return {clique(0.0, s, getMovies(ms, model)) | s <- domain(cliques),
									  			   size(cliques[s]) >= 3,
									  			   ms := cliques[s]};
}