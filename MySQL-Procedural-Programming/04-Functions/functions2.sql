DROP FUNCTION IF EXISTS maxNum;

DELIMITER $

CREATE FUNCTION maxNum(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    IF a > b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END $

DELIMITER ;


SELECT maxNum(10, 20) AS Maximum;










DROP FUNCTION IF EXISTS reverseNum;

DELIMITER $

CREATE FUNCTION reverseNum(n INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE rev BIGINT DEFAULT 0;
    DECLARE rem INT;

    WHILE n > 0 DO
        SET rem = n % 10;
        SET rev = rev * 10 + rem;
        SET n = FLOOR(n / 10);
    END WHILE;

    RETURN CAST(rev AS CHAR);
END $

DELIMITER ;


SELECT reverseNum(1234) AS Result;