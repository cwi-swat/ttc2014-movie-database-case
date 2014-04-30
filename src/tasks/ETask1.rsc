module tasks::ETask1

import tasks::Task3;
import IMDB;
import Set;
import List;
import util::Math;
import Utils;

alias Ranking = lrel[set[Person], real, int]; 

// Assumes couples are already in the model + computed average ratings.

Ranking top15avgRating(IMDB m) = rank(15, m, greaterThan(getRating));
	
Ranking top15commonMovies(IMDB m) = rank(15, m, greaterThan(getNumOfMovies));
		
Ranking rank(int n, IMDB m, bool(Group, Group) gt) =
	take(n, 
	   [<{m.persons[x] | x <- getPersons(g)}, g.avgRating, size(g.movies)> 
	        | Group g <- sort(m.groups, gt)]);

private bool(Group, Group) greaterThan(real(Group) sel) =
    bool(Group g1, Group g2){
        i1 = sel(g1);
        i2 = sel(g2);
        return (i1==i2) ? g1 > g2 : i1 > i2;
    };

real getRating(Group g) = g.avgRating;
real getNumOfMovies(Group g) = toReal(size(g.movies));

set[Id] getPersons(couple(_, p1, p2, _)) = {p1, p2}; 
    