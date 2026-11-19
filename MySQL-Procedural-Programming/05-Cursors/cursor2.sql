DROP PROCEDURE IF EXISTS cursorDemo;

DELIMITER $

CREATE PROCEDURE cursorDemo1(IN p_deptno INT)
BEGIN

    DECLARE _deptno INT;
    DECLARE _dname, _loc, _pwd, _startedon VARCHAR(20);
    DECLARE done INT DEFAULT 0;

    DECLARE c1 CURSOR FOR
        SELECT *
        FROM dept
        WHERE deptno > p_deptno
        ORDER BY deptno;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;

    OPEN c1;

    myloop: LOOP

        FETCH c1 INTO
            _deptno, _dname, _loc, _pwd, _startedon;

        IF done = 1 THEN
            LEAVE myloop;
        END IF;

        SELECT _deptno, _dname, _loc, _pwd, _startedon;

    END LOOP myloop;

    CLOSE c1;

END $

DELIMITER ;

/*
CALL cursorDemo3(20);
*/