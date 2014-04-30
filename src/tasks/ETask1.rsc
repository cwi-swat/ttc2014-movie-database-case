module tasks::ETask1

import tasks::Task3;
import MovieMM;
import Set;
import List;
import util::Math;
import Utils;

alias Ranking = lrel[Person, Person, real, int]; 

// Assumes couples are already in the model + computed average ratings.

Ranking top15couplesAvgRating(MovieMM m) = rank(15, m, greaterThan(getRating));
	
Ranking top15couplesCommonMovies(MovieMM m) = rank(15, m, greaterThan(getNumOfMovies));
		
Ranking  rank(int n, MovieMM m, bool(Group, Group) gt) =
	take(n, [<m.persons[g.p1], m.persons[g.p2], g.avgRating, size(g.movies)> | Group g <- sort(m.groups, gt)]);

private bool(Group, Group) greaterThan(real(Group) sel) =
    bool(Group g1, Group g2){
        i1 = sel(g1);
        i2 = sel(g2);
        return (i1==i2) ? g1 > g2 : i1 > i2;
    };
