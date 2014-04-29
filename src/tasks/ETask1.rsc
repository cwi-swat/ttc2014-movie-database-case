module tasks::ETask1

import tasks::Task3;
import MovieMM;
import Set;
import List;
import util::Math;
import Utils;

list[tuple[Person, Person, real, int]] top15couplesAvgRating(MovieMM m) =
	top15couples(m, Utils::getRating);
	
list[tuple[Person, Person, real, int]] top15couplesCommonMovies(MovieMM m) =
	top15couples(m, Utils::getCommonMovies);
	
bool(Group,Group) less(real(Group) indicator) =
	bool(c1:couple(_, p1, p2, _), c2:couple(_, p3, p4, _)){
		i1 = indicator(c1);
		i2 = indicator(c2);
		return (i1==i2)
				? (p1==p3 ? p2<p4 : p1<p3)
				: i1 < i2;
	};
	
Person getPerson(int i, set[Person] ps) = getOneFrom({p | p <- ps, p.id == i});
	
list[tuple[Person, Person, real, int]]  top15couples(m:mm(_, persons, groups, _), real(Group) indicator) =
	take(15, reverse([<getPerson(p1, persons), getPerson(p2, persons), rtg, size(movies)> | couple(rtg, p1, p2, movies)  <- sort(groups, less(indicator))]));

