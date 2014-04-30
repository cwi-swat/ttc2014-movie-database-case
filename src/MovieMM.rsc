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

