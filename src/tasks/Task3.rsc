module tasks::Task3

import tasks::Task2;
import IMDB;
import Set;
import IO;
import Map;
import analysis::statistics::Descriptive;
import util::Math;

IMDB addGroupRatings(IMDB m) = m[groups=gs]
  when gs :=
	{ g[avgRating = toReal(mean(ratings))] 
	   | g <- m.groups, ratings := [ m.movies[x].rating | x <- g.movies ]};

