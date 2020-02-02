--Trigger1: As soon as a film receives its 100th rating, it should be included in the table dbpXXX.frequentRatedMovies with the specified attributes.





CREATE TRIGGER dbp025.trigger1
AFTER UPDATE OF votes ON ratings
REFERENCING NEW AS neu
FOR EACH ROW MODE DB2SQL
BEGIN ATOMIC
	DECLARE FilmID INT;
        DECLARE Movie_title VARCHAR(400);
        DECLARE Movie_year VARCHAR(100);
        SET FilmID = (select movies.movieID  from movies where movies.movieID = neu.movieID);
        SET Movie_title = (select movies.title from movies where movies.movieID = neu.movieID);
        SET Movie_year = (select movies.year from movies where movies.movieID = neu.movieID);
	IF  neu.votes>=100 THEN
		INSERT INTO dbp025.frequentRatedMovies(movieID, title, year ) VALUES (FilmID, Movie_title, Movie_year);
	END IF;
END@
