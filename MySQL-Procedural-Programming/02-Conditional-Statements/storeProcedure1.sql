/*
1. FIRST OPEN YOUR MYSQL IN CMD 
2. USE DB;
3. RUN THE QUERY FOR PROCEDURE EXEXUTE 
   -> SOURCE [PATH] = SOURCE D:\CDAC\DBT\storeProcedure1.sql
   
4. NOW YOU CAN RUN OR EXECUTE YOUR PROCEDURE

*/ 


/* HOW TO CREATE LOCAL VARIABLE */

DROP PROCEDURE if EXISTS prod1;

DELIMITER $
CREATE PROCEDURE prod1()
BEGIN

    DECLARE a INT DEFAULT 10;
    DECLARE b INT DEFAULT 20;
    DECLARE c INT;

    SET c = a + b;
	
	SELECT c as Addition;

END $
DELIMITER ;

/* call prod1() */


DROP PROCEDURE if EXISTS checkNum;

DELIMITER $
CREATE PROCEDURE checkNum(in a int)
BEGIN

   If a > 0 THEN
       SELECT 'Positive Number' as NumberIS;
	ELSE
	   SELECT 'Negative Number' as NumberIS;
	   
   end if;	   

END $
DELIMITER ;

/* 

call checkNum(-3);
call checkNum(10);

 */
 
 


DROP PROCEDURE if EXISTS checkNum;
DELIMITER $

CREATE PROCEDURE checkNum(IN num INT, OUT result VARCHAR(20))
BEGIN
    IF num > 0 THEN
        SET result = 'Positive Number';

    ELSEIF num < 0 THEN
        SET result = 'Negative Number';

    ELSE
        SET result = 'Zero';
    END IF;
END $

DELIMITER ;

/* 

call checkNum(-3,@res);
SELECT @res;


 */


DROP PROCEDURE if EXISTS checkDay;
DELIMITER $

CREATE PROCEDURE checkDay(in day int)
BEGIN

    CASE day
	    WHEN 1 THEN 
		     SELECT 'Monday' as Day;
		WHEN 2 THEN 
		     SELECT 'Tuesday' as Day;	 
        WHEN 3 THEN 
		     SELECT 'Wednesday' as Day;
		WHEN 4 THEN 
		     SELECT 'Thrusday' as Day;
		WHEN 5 THEN 
		     SELECT 'Friday' as Day;
        WHEN 6 THEN 
		     SELECT 'Saturday' as Day;
        WHEN 7 THEN 
		     SELECT 'Sunday' as Day;			 
         
        ELSE 
            SELECT 'Invalide Day' as Day;		
	end CASE;	


END $
DELIMITER ;

/* 

call checkDay(-3);
call checkDay(4);


 */
 
 
 
drop PROCEDURE if EXISTS getStatus;
DELIMITER $

CREATE PROCEDURE getStatus(IN statusCode INT,OUT result VARCHAR(20))
BEGIN

    CASE statusCode
        WHEN 1 THEN
            SET result = 'Pending';
        WHEN 2 THEN
            SET result = 'Approved';
        WHEN 3 THEN
            SET result = 'Rejected';
        ELSE
            SET result = 'Unknown';
    END CASE;
	
END $

DELIMITER ;

/* 
CALL getStatus(2, @ans);

SELECT @ans;

 */
 
 
 
 /*  Swich as Expresstion */
 
 
drop PROCEDURE if EXISTS checkGrade; 
DELIMITER $

CREATE PROCEDURE checkGrade(IN marks INT)
BEGIN
    CASE
        WHEN marks >= 80 THEN
            SELECT 'Grade A' AS Result;
        WHEN marks >= 60 THEN
            SELECT 'Grade B' AS Result;
        WHEN marks >= 40 THEN
            SELECT 'Grade C' AS Result;
        ELSE
            SELECT 'Fail' AS Result;
    END CASE;
END $

DELIMITER ;


/*    CALL checkGrade(75);   */