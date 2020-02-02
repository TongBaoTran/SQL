-- Create a view dbpXXX.avgRatedMovies containing movies rated better than average.
-- The view should consist of 4 columns: MOVIEID, TITLE, YEAR and RANK.

CREATE VIEW dbp025.avgRatedMovies AS 
SELECT movies.movieid, movies.title, movies.year, ratings.rank
FROM movies, ratings
WHERE movies.movieid=ratings.movieid
AND   ratings.rank> (SELECT sum(ratings.rank*ratings.votes)/sum(ratings.votes) FROM ratings);