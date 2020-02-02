-- Create a view dbpXXX.waltDisneyMovies
-- The view should consist of 3 columns: MOVIEID, TITLE, and GENRE.


CREATE VIEW dbp025.waltDisneyMovies AS 
SELECT movies.movieid,  movies.title, genres.genre
FROM  movies, genres, movies2producers, producers
WHERE movies.movieid=genres.movieid
AND   movies.movieid=movies2producers.movieid
AND   movies2producers.producerid=producers.producerid
AND   producers.name='Disney, Walt';