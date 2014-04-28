module tasks::ETask2

import MovieMM;
import Set;
import IO;
import Map;

MovieMM findCliques(m:mm(movies, persons, groups, pim), int n) =
	mm(movies, persons, newGroups(m, n), pim);

set[set[int]] comb(set[int] numbers, 1) = {{i}| i <- numbers};

set[set[int]] comb(set[int] numbers, n){
	result = {};
	sets = comb(numbers, n-1);
	for (i<-numbers){
		for (s<-sets){
			if (i notin s){
				newSet = s + i;
				result = result + {newSet};
			};
		};
	};
	return result;
}

set[Group] newGroups(model:mm(movies, persons, groups, pim), int n){
	costars = toMap(pim);
	map[set[int],set[int]] cliques = ();
	for (movie <- costars){
		costarsInMovie = costars[movie];
		for (s <- comb(costarsInMovie, n)){
			if (s in cliques)
				cliques[s] = cliques[s] + movie;
			else
				cliques[s] = {}; 
		}
	}
	return {clique(0.0, s, getMovies(ms, model)) | s <- domain(cliques),
									  size(cliques[s]) >= 3,
									  ms := cliques[s]};
}