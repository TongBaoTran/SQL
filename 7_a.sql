-- Output the highest rated films for each year


SELECT avgmovies.year, avgmovies.title, avgmovies.rank
FROM dbp025.avgRatedMovies avgmovies
INNER JOIN
(SELECT year, max(rank) AS maxrate FROM   dbp025.avgRatedMovies GROUP BY year) maxset
ON avgmovies.year=maxset.year
AND avgmovies.rank=maxset.maxrate;