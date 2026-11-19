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