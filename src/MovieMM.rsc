module MovieMM

import Relation;


alias Id = int;

data MovieMM = mm(map[Id, Movie] movies, map[Id, Person] persons, set[Group] groups, PersonsInMovies pim);

data Movie = movie(str title, real rating, int year);

data Person 
  = actor(str name) 
  | actress(str name);

data Group 
  = couple(real avgRating, Id p1, Id p2, set[Movie] commonMovies)
  | clique(real avgRating, set[Id] persons, set[Movie] commonMovies);
    
alias PersonsInMovies = rel[Id movie, Id person];

//set[Person] getPersons(movie(movieId, _,_), mm(_, persons, _, pim)) = 
//	{p | p <- persons, p.id in pim[movieId]};
//	
//set[Movie] getMovies(Person person, mm(movies, persons, _, pim)) = 
//	{m | <mid, pid> <- pim, pid == person.id, m:movie(mid, _, _, _) <- movies };
//	
//set[Movie] getPersons(set[int] ids, mm(_, persons, _, _)) =
//	{p | id <-ids, actor(id, _) <- persons} + {p | id <-ids, actress(id, _) <- persons};	
//	
//set[Movie] getMovies(set[int] ids, mm(movies, _, _, _)) =
//	{m | id <-ids, m:movie(id, _, _, _) <- movies};

MovieMM addMM(mm(movies1, persons1, groups1, pim1), mm(movies2, persons2, groups2, pim2)) =
	mm(movies1 + movies2, persons1 + persons2, groups1 + groups2, pim1 + pim2);
