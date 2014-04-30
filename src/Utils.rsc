module Utils

import MovieMM;

set[set[int]] combinations(set[int] numbers, int n) {
  if (n == 1) {
    return {{i}| i <- numbers};
  }
  return { s + {i} | i <- numbers, s <- combinations(numbers, n-1), i notin s };
}

	


