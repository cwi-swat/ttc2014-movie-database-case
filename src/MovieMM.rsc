module MovieMM

import Relation;
import util::Math;
import Set;


alias Id = int;

data MovieMM = mm(map[Id, Movie] movies, map[Id, Person] persons, set[Group] groups, PersonsInMovies pim);

data Movie = movie(str title, real rating, int year);

data Person 
  = actor(str name) 
  | actress(str name);

data Group 
  = couple(real avgRating, Id p1, Id p2, set[Id] movies)
  | clique(real avgRating, set[Id] persons, set[Id] movies);
    
alias PersonsInMovies = rel[Id movie, Id person];


real getRating(Group g) = g.avgRating;
real getNumOfMovies(Group g) = toReal(size(g.movies));


MovieMM addMM(mm(movies1, persons1, groups1, pim1), mm(movies2, persons2, groups2, pim2)) =
	mm(movies1 + movies2, persons1 + persons2, groups1 + groups2, pim1 + pim2);
