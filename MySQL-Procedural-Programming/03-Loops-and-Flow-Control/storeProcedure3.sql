
DROP PROCEDURE if EXISTS printNumbers;
DELIMITER $

CREATE PROCEDURE printNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;

    REPEAT
        SELECT i;
        SET i = i + 1;
    UNTIL i > 5
    END REPEAT;
END $

DELIMITER ;

/*

CALL printNumbers();

*/






/* Repeat loop with lavel*/

DROP PROCEDURE repeatDemo;
DELIMITER $

CREATE PROCEDURE repeatDemo()
BEGIN
    DECLARE i INT DEFAULT 1;

    myloop: REPEAT
        SELECT i;
        SET i = i + 1;
    UNTIL i > 3
    END REPEAT myloop;
END $

DELIMITER ;


/*

CALL repeatDemo();

*/







/*  repeat loop  with leave*/

DELIMITER $

CREATE PROCEDURE leaveRepeat()
BEGIN
    DECLARE i INT DEFAULT 1;

    myloop: REPEAT

        IF i = 4 THEN
            LEAVE myloop;
        END IF;

        SELECT i;
        SET i = i + 1;

    UNTIL i > 10
    END REPEAT myloop;
END $

DELIMITER ;

/*
CALL leaveRepeat();
*/





/* Reapeat with in and out parameter */

DROP PROCEDURE if EXISTS findSum;
DELIMITER $

CREATE PROCEDURE findSum(
    IN n INT,
    OUT result INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE total INT DEFAULT 0;

    REPEAT
        SET total = total + i;
        SET i = i + 1;
    UNTIL i > n
    END REPEAT;

    SET result = total;
END $

DELIMITER ;

/*
CALL findSum(5, @ans);
SELECT @ans;
*/


