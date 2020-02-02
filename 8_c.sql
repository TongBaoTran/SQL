-- Which movie has the most actors? 

SELECT movies.title, count(movies.movieid) as AMOUNT
FROM movies , movies2actors
WHERE movies.movieid = movies2actors.movieid
GROUP BY movies.movieid, movies.title
HAVING count(movies.movieid)>= ALL (select count(movies.movieid) FROM movies , movies2actors WHERE movies.movieid = movies2actors.movieid GROUP BY movies.movieid);
