DROP FUNCTION if EXISTS getSal;
DELIMITER $

CREATE FUNCTION getSal(id int)
returns int 
NOT DETERMINISTIC
READS SQL DATA
BEGIN

   DECLARE _sal int DEFAULT NULL;
   
   SELECT sal into _sal from emp where empno = id;
   
   RETURN _sal;


end $
DELIMITER ;

/*
SELECT getSal(6001); // ans - 1750
*/









/* Get EMP Salary Total by Cursor */
DROP FUNCTION IF EXISTS getSalByCursor;

DELIMITER $

CREATE FUNCTION getSalByCursor()
RETURNS INT
NOT DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE _sal INT;
    DECLARE totalSal INT DEFAULT 0;
    DECLARE done BOOLEAN DEFAULT FALSE;

    DECLARE cur CURSOR FOR
        SELECT sal FROM emp;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = TRUE;

    OPEN cur;

    myloop: LOOP

        FETCH cur INTO _sal;

        IF done = TRUE THEN
            LEAVE myloop;
        END IF;

        SET totalSal = totalSal + _sal;

    END LOOP myloop;

    CLOSE cur;

    RETURN totalSal;
END $

DELIMITER ;


/*
SELECT getSalByCursor();

*/