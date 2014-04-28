module ParseXML

import lang::xml::DOM;
import IO;

Node parseXMLDOM(loc src) = parseXMLDOMTrim(readFile(src));

public loc example = |project://ttc2014-movie-database-case/input/imdb-0005000-49930.movies|;
