DELIMITER $
CREATE FUNCTION addNum(a int, b int)
returns int
DETERMINISTIC 
BEGIN 

RETURN a + b;


END $
DELIMITER ;

/*
select addNum(10,20) as Result;
*/


DELIMITER $

CREATE FUNCTION checkNum(n INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    IF n > 0 THEN
        RETURN 'Positive';
    ELSEIF n < 0 THEN
        RETURN 'Negative';
    ELSE
        RETURN 'Zero';
    END IF;
END $

DELIMITER ;


/*
select checkNum(2) as Num;
*/
