/*
1. FIRST OPEN YOUR MYSQL IN CMD 
2. USE DB;
3. RUN THE QUERY FOR PROCEDURE EXEXUTE 
   -> SOURCE [PATH] = SOURCE D:\CDAC\DBT\proceduralLanguage.sql
   
4. NOW YOU CAN RUN OR EXECUTE YOUR PROCEDURE

*/ 


DROP PROCEDURE if EXISTS prod;
delimiter $
CREATE PROCEDURE prod()
BEGIN

SELECT "Hello EndUser" as C1;

END $
delimiter ;

/* ////////// CALL -> CALL PROD(); //////////////// */


DROP PROCEDURE if EXISTS prod1;
delimiter $ 
CREATE PROCEDURE prod1(a int , b int)
BEGIN

SELECT a + b as addition;

END $
delimiter ;

/* /////////////CALL -> CALL PROD1(10,20); /////////////// */


DROP PROCEDURE if EXISTS prod3;
delimiter $
CREATE PROCEDURE prod3()
BEGIN

SELECT "Hello Pankaj" as myName;


END $ 
delimiter ;

/* ////////////// CALL -> CALL PROD3(); ////////////////////// */


DROP PROCEDURE if EXISTS prod4;
delimiter $
CREATE PROCEDURE prod4(in a int, in b int)
BEGIN

SELECT (a+b) as Result;

END $
delimiter ;

/* ///////////// CALL -> CALL PROD4(10,20); //////////////// */

DROP PROCEDURE if EXISTS prod5;
delimiter $
CREATE PROCEDURE prod5(in a int, in b int, out c int)
BEGIN

set c := (a+b);

END $
delimiter ;

/* ///////////// 

CALL PROD5(10,20,@RES);
SELECT @RES; 

////////////// */

DROP PROCEDURE if exists prod6;
delimiter $
CREATE PROCEDURE prod6(inout res int)
BEGIN 

set res := res + 10;


end $
delimiter ;

/* ///////////////

SET @RES = 10;
CALL PROD6(@RES);
SELECT @RES;

//////////// */
