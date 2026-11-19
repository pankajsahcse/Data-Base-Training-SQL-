



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

/*
CALL deleteEmp(101);
*/







/* Method 2 For Deleting the Employee by PROCEDURE */
DROP PROCEDURE if EXISTS delete_emp;

DELIMITER $

CREATE PROCEDURE delete_emp(IN p_empid INT)
BEGIN
    DELETE FROM emp WHERE empid = p_empid;

    IF ROW_COUNT() > 0 THEN
        SELECT 'Employee Deleted Successfully' AS message;
    ELSE
        SELECT 'Employee Not Found' AS message;
    END IF;

END $

DELIMITER ;

/*
CALL deleteEmp(101);
*/













/* Update Salary using PROCEDURE */

DROP PROCEDURE IF EXISTS updateEmpSalary;

DELIMITER $

CREATE PROCEDURE updateEmpSalary(
    IN p_empid INT,
    IN p_salary INT
)
BEGIN

    UPDATE emp
    SET salary = p_salary
    WHERE empid = p_empid;

    IF ROW_COUNT() > 0 THEN

        SELECT 'Salary Updated Successfully' AS message;

    ELSE

        SELECT 'Employee Not Found or Salary Unchanged' AS message;

    END IF;

END $

DELIMITER ;

/*
CALL updateEmpSalary(101, 25000);
*/



