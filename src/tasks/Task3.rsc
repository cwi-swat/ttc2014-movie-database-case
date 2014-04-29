module tasks::Task3

import tasks::Task2;
import MovieMM;
import Set;
import IO;
import Map;
import analysis::statistics::Descriptive;
import util::Math;

MovieMM computeAverageRatings(m:mm(movies, persons, groups, pim)) =
	mm(movies, persons, computeRatings(groups), pim);
	
set[Group] computeRatings(set[Group] groups) =
	{couple(toReal(mean(ratings)), p1, p2, movies)  | couple(_, p1, p2, movies) <- groups,
											  		  ratings := [rtg | movie(_, _, rtg, _) <- movies]};

