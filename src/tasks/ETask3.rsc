module tasks::ETask3

import MovieMM;
import Set;
import IO;
import Map;
import analysis::statistics::Descriptive;
import util::Math;

public MovieMM computeAverageCliqueRatings(m:mm(movies, persons, groups, pim)) =
	mm(movies, persons, computeCliqueRatings(groups), pim);
	
set[Group] computeCliqueRatings(set[Group] groups) =
	{clique(toReal(mean(ratings)), s, movies)  | clique(_, s, movies) <- groups,
											  ratings := [rtg | movie(_, _, rtg, _) <- movies]};

