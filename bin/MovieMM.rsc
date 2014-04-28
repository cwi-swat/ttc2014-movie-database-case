module MovieMM

import Relation;

data Movie = movie(int id, str title, real rating, int year);

alias PersonsInMovies = rel[int movieId, int personId];

set[Person] getPersons(movie(movieId, _,_), mm(_, persons, _, pim)) = 
	{p | p <- persons, p.id in pim[movieId]};
	
set[Movie] getMovies(Person person, mm(_, persons, _, pim)) = 
	{m | m <- movies, m.id in mip[person.id]}
	when mip := invert(pim);
	
set[Movie] getPersons(set[int] ids, mm(_, persons, _, _)) =
	{p | id <-ids, actor(id, _) <- persons} + {p | id <-ids, actress(id, _) <- persons};	
	
set[Movie] getMovies(set[int] ids, mm(movies, _, _, _)) =
	{m | id <-ids, m:movie(id, _, _, _) <- movies};

data Person =  actor(int id, str name) | actress(int id, str name);

data Group 
	= couple(real avgRating, int p1, int p2, set[Movie] commonMovies)
	| clique(real avgRating, set[int] persons, set[Movie] commonMovies);
	
data MovieMM = mm(set[Movie] movies, set[Person] persons, set[Group] groups, PersonsInMovies pim);

MovieMM addMM(mm(movies1, persons1, groups1, pim1), mm(movies2, persons2, groups2, pim2)) =
	mm(movies1 + movies2, persons1 + persons2, groups1 + groups2, pim1 + pim2);
