-- Which authors (writers) have published films between 1920 and 1929?


SELECT writers.name AS WRITER_NAME
FROM   writers, movies2writers, movies
WHERE  writers.writerid=movies2writers.writerid
AND    movies2writers.movieid=movies.movieid
AND    movies.year <= '1929' AND movies.year >= '1920';