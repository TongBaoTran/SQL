-- Average profit (gross) per movie for each director

SELECT directors.name,directors.gross/count(directors.directorid) as MEAN_GROSS
FROM directors , movies2directors
WHERE directors.directorid = movies2directors.directorid
GROUP BY directors.directorid, directors.gross, directors.name
ORDER BY MEAN_GROSS DESC;
