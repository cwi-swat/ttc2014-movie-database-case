module IMDB

alias Id = int;

data IMDB = mm(map[Id, Movie] movies,
                  map[Id, Person] persons, 
                  set[Group] groups, 
                  rel[Id movie, Id person] pim);

data Movie = movie(str title, real rating, int year);

data Person 
  = actor(str name) 
  | actress(str name);

data Group = couple(real avgRating, Id p1, Id p2, set[Id] movies);
    

