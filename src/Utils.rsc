module Utils

import MovieMM;

set[set[int]] combinations(set[int] numbers, int n) {
  if (n == 1) {
    return {{i}| i <- numbers};
  }
  return { s + {i} | i <- numbers, s <- combinations(numbers, n-1), i notin s };
}

	
real getRating(couple(rtg, _, _, _)) = rtg;

real getRating(clique(rtg, _, _)) = rtg;

real getCommonMovies(couple(_, _, _, ms)) = toReal(size(ms));

real getCommonMovies(clique(_, _, ms)) = toTeal(size(ms));


