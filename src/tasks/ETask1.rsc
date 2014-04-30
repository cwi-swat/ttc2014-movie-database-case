module tasks::ETask1

import tasks::Task3;
import MovieMM;
import Set;
import List;
import util::Math;
import Utils;

alias Ranking = list[tuple[Person, Person, real, int]]; 

Ranking top15couplesAvgRating(MovieMM m) =
	top15couples(m, getRating);
	
Ranking top15couplesCommonMovies(MovieMM m) =
	top15couples(m, getNumOfMovies);
	
bool(Group, Group) less(real(Group) sel) =
	bool(c1:couple(_, p1, p2, _), c2:couple(_, p3, p4, _)){
		i1 = sel(c1);
		i2 = sel(c2);
		return (i1==i2) ? (p1==p3 ? p2<p4 : p1<p3) : i1 < i2;
	};
	
Ranking  top15couples(MovieMM m, real(Group) sel) =
	take(15, reverse([<m.persons[g.p1], m.persons[g.p2], g.avgRating, size(g.movies)> | Group g <- sort(m.groups, less(sel))]));

