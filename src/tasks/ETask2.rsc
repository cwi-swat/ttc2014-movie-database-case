module tasks::ETask2

extend MovieMM;
import Set;
import IO;
import Map;
import Utils;

// Extension
data Group = clique(real avgRating, set[Id] persons, set[Id] movies);

MovieMM addCliques(MovieMM m, int n) = m[groups=makeCliques(m, n)];

set[Group] makeCliques(MovieMM m, int n) {
    map[int movie, set[int] stars] costars = toMap(m.pim);
    map[set[int] clique, set[int] movies] cliques = ();
    
    set[int] EMPTY = {};
    //int i = 0;
    for (int movie <- costars, set[int] s <- combinations(costars[movie], n)) {
      //println("i = <i>");
      //i+=1;
      cliques[s]?EMPTY += {movie};
    }
    
	return {clique(0.0, s, ms) | s <- cliques, ms := cliques[s], size(ms) >= 3 };
}