

/* Checking Result as Passing Divisin Using Nested */

DROP PROCEDURE if EXISTS checkResult;
DELIMITER $

CREATE PROCEDURE checkResult(IN marks INT)
BEGIN

    IF marks >= 0 AND marks <= 100 THEN

        IF marks >= 60 THEN
            SELECT 'First Division' AS Result;

        ELSEIF marks >= 45 THEN
            SELECT 'Second Division' AS Result;

        ELSEIF marks >= 33 THEN
            SELECT 'Third Division' AS Result;

        ELSE
            SELECT 'Fail' AS Result;

        END IF;

    ELSE
        SELECT 'Invalid Marks' AS Result;

    END IF;

END $

DELIMITER ;


/*
CALL checkResult(75);
CALL checkResult(50);
CALL checkResult(30);
CALL checkResult(120);
*/