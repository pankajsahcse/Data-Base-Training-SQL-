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