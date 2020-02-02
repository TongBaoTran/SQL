-- Output movies that do not have more than 2 genres.


SELECT waltdn.title, count(waltdn.genre) AS AMOUNT
FROM dbp025.waltDisneyMovies  waltdn
GROUP BY waltdn.movieid, waltdn.title
HAVING count(waltdn.genre)<=2;