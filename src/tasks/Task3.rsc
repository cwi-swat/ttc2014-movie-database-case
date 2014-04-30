module tasks::Task3

import tasks::Task2;
import MovieMM;
import Set;
import IO;
import Map;
import analysis::statistics::Descriptive;
import util::Math;

MovieMM computeAverageRatings(MovieMM m) = m[groups=gs]
  when gs :=
	{couple(toReal(mean(ratings)), p1, p2, movies) 
	   | couple(_, p1, p2, movies) <- m.groups
	   , ratings := [ m.movies[x].rating | x <- movies ]};

