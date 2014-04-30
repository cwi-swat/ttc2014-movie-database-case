module tasks::ETask2

import MovieMM;
import Set;
import IO;
import Map;
import Utils;

MovieMM addCliques(MovieMM m, int n) = m[groups=makeCliques(m, n)];

set[Group] makeCliques(model:mm(movies, persons, groups, pim), int n) {
    map[int movie, set[int] stars] costars = toMap(pim);
    map[set[int] clique, set[int] movies] cliques = ();
    
    set[int] EMPTY = {};
    for (int movie <- costars, int s <- combinations(costars[movie], n)) {
      cliques[s]?EMPTY += {movie};
    }
    
	return {clique(0.0, s, ms) | s <- cliques, ms := cliques[s], size(ms) >= 3 };
}