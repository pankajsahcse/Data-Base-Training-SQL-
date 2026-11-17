



/* Method 1 For Deleting the Employee by PROCEDURE */

DROP PROCEDURE if EXISTS deleteEmp;
DELIMITER $

CREATE PROCEDURE deleteEmp(IN p_empid INT)
BEGIN
    IF EXISTS (SELECT 1 FROM emp WHERE empid = p_empid) THEN

        DELETE FROM emp WHERE empid = p_empid;
        SELECT 'Employee Deleted Successfully' AS message;

    ELSE

        SELECT 'Employee Not Found' AS message;

    END IF;
END $

DELIMITER ;


CALL deleteEmp(101);











DELIMITER //

CREATE PROCEDURE delete_emp(IN p_empid INT)
BEGIN
    DELETE FROM emp WHERE empid = p_empid;

    IF ROW_COUNT() > 0 THEN
        SELECT 'Employee Deleted Successfully' AS message;
    ELSE
        SELECT 'Employee Not Found' AS message;
    END IF;

END //

DELIMITER ;