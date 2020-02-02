-- How many actors (actors) has a horror movie on average?

SELECT Count(movies2actors.actorid)/Count(distinct movies.movieid) AS AMOUNT
FROM movies2actors, movies, genres
WHERE movies.movieid=genres.movieid
AND   movies.movieid=movies2actors.movieid
AND   genres.genre='Horror';