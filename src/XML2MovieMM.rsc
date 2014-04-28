module XML2MovieMM

import lang::xml::DOM;
import MovieMM;
import String;

anno int Node @ nodeId;

MovieMM moviem(document(root)){
	movies = {};
	persons = {};
	groups = {};
	pim = {};
	count = 0;
	newRoot = top-down visit(root){
		case element(x, "Movie", children) => {count += 1; element(x, "Movie", children)[@nodeId = count];}
		case element(x, "Actor", children) => {count += 1; element(x, "Actor", children)[@nodeId = count];}
	};
	top-down visit(newRoot){
		case e:element(_,"Movie",
					 [attribute(_, "rating", rating),
					  attribute(_, "year", year),
					  attribute(_, "title", title),
					  attribute(_, "persons", personsStr)]):{
			movies += movie(e@nodeId, title, toReal(rating), toInt(year));
			people = [toInt(substring(s,1)) | s <- split(" ",personsStr)];
			for (p <- people) { pim += <e@nodeId, p>; };
		}
		case e:element(id, _,"Actor",
					 [attribute(_, "movies", moviesStr),
					  attribute(_, "name", name)]):{
			persons += actor(e@nodeId, name);
		}
		case e:element(id, _,"Actress",
					 [attribute(_, "movies", moviesStr),
					  attribute(_, "name", name)]):{
			persons += actress(e@nodeId, name);
		}
	}
	return mm(movies, persons, groups, pim);
}