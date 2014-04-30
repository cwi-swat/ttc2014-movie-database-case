module tasks::ETask3

extend tasks::Task3;
extend tasks::ETask2; // for clique 

// The same as computeAverageRatings in tasks::Task3 (it's polymorph).  
IMDB computeCliqueAverageRatings(IMDB m) = computeAverageRatings(m);

