module tasks::ETask4

extend tasks::ETask1;
extend tasks::ETask2; // for clique

// extend accessor for persons
set[Id] getPersons(clique(_, set[Id] ps, _)) = ps; 

// Same as ETask1 because it's polymorph.
Ranking top15cliqueAvgRating(MovieMM m) = top15AvgRating(m);
    
Ranking top15cliqueCommonMovies(MovieMM m) = top15commonMovies(m);

