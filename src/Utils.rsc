module Utils

import MovieMM;

set[set[int]] comb(set[int] numbers, 1) = {{i}| i <- numbers};

set[set[int]] comb(set[int] numbers, n) =
	({} | it + {s + i} | i <- numbers, s <- comb(numbers, n-1), i notin s);
	
real getRating(couple(rtg, _, _, _)) = rtg;

real getRating(clique(rtg, _, _)) = rtg;

real getCommonMovies(couple(_, _, _, ms)) = toReal(size(ms));

real getCommonMovies(clique(_, _, ms)) = toTeal(size(ms));