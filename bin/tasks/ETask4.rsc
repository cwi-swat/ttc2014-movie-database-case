module tasks::ETask4

import tasks::ETask2;
import tasks::ETask3;
import MovieMM;
import Set;
import List;
import util::Math;

list[tuple[set[Person], real, int]] top15cliquesAvgRating(MovieMM m, int n) =
	top15cliques(computeAverageCliqueRatings(findCliques(m, n)),
		real(Group g){ 
			if (clique(rtg, _, _) := g) 
				return rtg;
			else 
				return 0.0;
		});
	
list[tuple[set[Person], real, int]] top15cliquesCommonMovies(MovieMM m, int n) =
	top15cliques(computeAverageCliqueRatings(findCliques(m, n)), 
		real(Group g){
			if (clique(_, _, ms) := g)
				return toReal(size(ms));
			else 
				return 0.0;
		});
	
bool(Group,Group) less(real(Group) indicator) =
	bool(c1:clique(_, s1, _), c2:clique(_, s2, _)){
		i1 = indicator(c1);
		i2 = indicator(c2);
		return (i1==i2)
				? false // this has to be resolved in an unambiguous way
				: i1 < i2;
	};
	
Person getPerson(int i, set[Person] ps) = getOneFrom({p | p <- ps, p.id == i });
	
list[tuple[set[Person], real, int]]  top15cliques(m:mm(_, persons, groups, _), real(Group) indicator) =
	take(15, reverse([<{getPerson(p, persons) | p<- s}, rtg, size(movies)> | clique(rtg, s, movies)  <- sort(groups, less(indicator))]));

