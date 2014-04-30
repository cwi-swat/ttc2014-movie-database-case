module tasks::ETask2

extend IMDB;
import Set;
import List;


// Extension
data Group = clique(real avgRating, set[Id] persons, set[Id] movies);

IMDB addCliques(IMDB m, int n) = m[groups=makeCliques(m, n)];

set[Group] makeCliques(IMDB m, int n) {
    map[int movie, set[int] stars] costars = toMap(m.stars);
    map[set[int] clique, set[int] movies] cliques = ();
    
    set[int] EMPTY = {};
    for (Id movie <- costars, set[Id] s <- combinations(costars[movie], n)) {
      cliques[s]?EMPTY += {movie};
    }
    
	return {clique(0.0, s, ms) | s <- cliques, ms := cliques[s], size(ms) >= 3 };
}

set[set[int]] combinations(set[int] nums, int m) {
  xs = toList(nums);
  if (m > size(xs)) {
    return {};
  }
  map[int,set[set[int]]] arr = ( i: {} | i <- [0..m+1] );
  arr[0] = {{}};
  for (j <- [0..size(xs) - m + 1], i <- [1..m+1]) {
    arr[i] += { {xs[j+i-1], *ys} | set[int] ys <- arr[i-1] };
  }
  return arr[m];
}