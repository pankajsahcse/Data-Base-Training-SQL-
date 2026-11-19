DROP PROCEDURE IF EXISTS printNum;

DELIMITER $

CREATE PROCEDURE printNum()
BEGIN

    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO

        SELECT i AS Number;

        SET i = i + 1;

    END WHILE;

END $

DELIMITER ;


/*
CALL printNum();
*/













/* Print 1  to n using REPEAT */

DROP PROCEDURE IF EXISTS repeatNum;

DELIMITER $

CREATE PROCEDURE repeatNum()
BEGIN

    DECLARE i INT DEFAULT 1;

    REPEAT

        SELECT i AS Number;

        SET i = i + 1;

    UNTIL i > 10

    END REPEAT;

END $

DELIMITER ;

/*
CALL repeatNum();
*/