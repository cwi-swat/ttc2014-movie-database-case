module tasks::Task3

import tasks::Task2;
import MovieMM;
import Set;
import IO;
import Map;
import analysis::statistics::Descriptive;
import util::Math;

MovieMM addGroupRatings(MovieMM m) = m[groups=gs]
  when gs :=
	{ g[avgRating = toReal(mean(ratings))] 
	   | g <- m.groups, ratings := [ m.movies[x].rating | x <- g.movies ]};

