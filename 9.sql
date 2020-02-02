--The object of the game is to start with any actor or actress who has been in a movie and
--connect them to Kevin Bacon in the smallest number of links possible. Two people are
--linked if they’ve been in a movie together. We do not consider links through television
--shows, made-for-tv movies, writers, producers, directors, etc. For example, you might
--wonder how Alfred Hitchcock can be connected to Kevin Bacon. One answer is that:
--Alfred Hitchcock was in Show Business at War (1943) with Orson Welles, and
--Orson Welles was in A Safe Place (1971) with Jack Nicholson, and
--Jack Nicholson was in A Few Good Men (1992) with Kevin Bacon!
--Then we can count how many links were necessary and assign the actor or actress a Bacon number.
--Finds all actors and actresses with a maximum bacon number of two





WITH RecursiveKB(actorid, movieid, Bacon_number) AS (
      SELECT m.actorid, m.movieid,  0 as Bacon_number
      FROM   movies2actors m, actors A
      WHERE  m.actorid = A.actorid AND A.name = 'Bacon, Kevin (I)'

      UNION  ALL
         SELECT m1.actorid, m2.movieid, R.Bacon_number + 1
         FROM   RecursiveKB R,  movies2actors m1,  movies2actors m2
         WHERE  m1.movieid = R.movieid
         AND    m2.actorid = m1.actorid
         AND    R.Bacon_number<2
      )
SELECT distinct(KB1.actorid),actors.name, KB1.Bacon_number 
FROM  RecursiveKB KB1, actors, (
   SELECT actorid, min(Bacon_number) minlevel
   FROM RecursiveKB
   GROUP BY actorid) KB2
WHERE  KB1.actorid = KB2.actorid
AND    KB1.Bacon_number=KB2.minlevel
AND    KB1.actorid=actors.actorid
AND    KB1.Bacon_number<>0
ORDER BY Bacon_number;
