-- For each genre, calculate the relative market share in terms of the films that own the genre

WITH TOTAL AS (SELECT count(*) AS tot FROM genres WHERE genre <>'')
SELECT LIST.GENRE, LIST.MOVIES_PER_GENRE, CAST(LIST.MOVIES_PER_GENRE AS DECIMAL)/Total.tot *100 AS MARKET_SHARE
FROM 
(SELECT genre AS GENRE, count(*) AS MOVIES_PER_GENRE FROM genres WHERE  genre <>'' GROUP BY genres.genre) LIST, TOTAL;
