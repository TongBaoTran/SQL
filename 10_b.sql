--Trigger 2: As soon as a rating for a film is deleted and this film has fewer than 100 ratings, the film should be removed from the table dbpXXX.frequentRatedMovies.





CREATE TRIGGER dbp025.trigger2
AFTER UPDATE OF votes ON ratings
REFERENCING NEW AS neu
FOR EACH ROW MODE DB2SQL
BEGIN ATOMIC
        DECLARE FilmID INT;
        SET FilmID = (select movies.movieID  from movies where movies.movieID = neu.movieID);
	IF  neu.votes<100 THEN
		DELETE FROM dbp025.frequentRatedMovies
                WHERE dbp025.frequentRatedMovies.movieID=FilmID;
	END IF;
END@