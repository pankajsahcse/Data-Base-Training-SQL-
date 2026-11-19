

/* BEFORE INSERT TRIGGER */

CREATE TABLE employee (
    empid INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT
);



DROP TRIGGER IF EXISTS before_insert_emp;
DELIMITER $

CREATE TRIGGER before_insert_emp
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    SET NEW.salary = 10000;
END $

DELIMITER ;



INSERT INTO employee
VALUES (1, 'Rahul', 5000);


SELECT * FROM employee;








/* AFTER INSERT TRIGGER */


CREATE TABLE employee_log (
    empid INT,
    ename VARCHAR(50),
    salary INT
);


DROP TRIGGER IF EXISTS after_insert_emp;

DELIMITER $

CREATE TRIGGER after_insert_emp
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_log
    VALUES (NEW.empid, NEW.ename, NEW.salary);
END $

DELIMITER ;



/* Testing */
INSERT INTO employee
VALUES (2, 'Amit', 5000);

SELECT * FROM employee;
SELECT * FROM employee_log;