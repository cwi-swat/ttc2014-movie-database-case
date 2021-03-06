module XML2IMDB

import lang::xml::DOM;
import IMDB;
import String;
import List;

IMDB xml2imdb(document(root)){
	movies = ();
	persons = ();
	pim = {};
	for (i <- [1..size(root.children)]) { // skip namespace attrib
	    switch (root.children[i]) {
		case element(_, "Movie", as): {
		    movies[i] = makeMovie(as);
		    if (attribute(_, "persons", ps) <- as) {
              pim += { <i, toInt(substring(s,1)) + 1> | s <- split(" ",ps) };
            }   
		}
		case element(_, "Actor",[_*, attribute(_, "name", name), _*]): 
			persons[i] = actor(name);
		case element(_, "Actress", [_*, attribute(_, "name", name), _*]):
			persons[i] = actress(name);
		default:
		  throw "Unhandled case during loading movie: <root.children[i]>";
	  }
	}
	return imdb(movies, persons, {}, pim);
}

Movie makeMovie(list[Node] as) {
  m = movie("", 0.0, -1);
  for (a <- as) {
    switch (a) {
      case attribute(_, "rating", rating): m.rating = toReal(rating);
      case attribute(_, "year", year) : m.year = toInt(year);
      case attribute(_, "title", title) : m.title = title;
    }
  }
  return m;
}
