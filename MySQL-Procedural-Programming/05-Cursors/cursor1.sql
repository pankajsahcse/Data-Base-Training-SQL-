/* Only by this PROCEDURE we get error - No data Zero data FETCH */

DROP PROCEDURE IF EXISTS cursorDemo;
DELIMITER $

CREATE PROCEDURE cursorDemo()
BEGIN

     DECLARE _deptno int;
	 DECLARE _dname, _loc, _pwd,_startedon VARCHAR(20);
	 
	 DECLARE c1 CURSOR for 
	         SELECT * FROM dept ORDER by deptno;
			 
		OPEN c1;
        
		  myloop : LOOP
                FETCH c1 into _deptno,_dname, _loc, _pwd, _startedon;
				SELECT _deptno,_dname,_loc,  _pwd,_startedon;
				
		  end LOOP myloop;
        CLOSE c1;		  

end $
DELIMITER ;

/*
call cursorDemo();
*/









/* TO overcome this issue or this error we have to Handle this */
/* Method 1 */

DROP PROCEDURE IF EXISTS cursorDemo1;
DELIMITER $

CREATE PROCEDURE cursorDemo1()
BEGIN

     DECLARE _deptno int;
	 DECLARE _dname, _loc, _pwd,_startedon VARCHAR(20);
	 
	 DECLARE c1 CURSOR for 
	         SELECT * FROM dept ORDER by deptno;
			 		 
		OPEN c1;
		
		nested: BEGIN 
		
		declare  exit handler for 1329 select "EOF";	
		
		    myloop : LOOP
                FETCH c1 into _deptno,_dname, _loc, _pwd, _startedon;
				SELECT _deptno,_dname,_loc,  _pwd,_startedon;
				
		    end LOOP myloop;
		   
		end nested;
		 	  
        CLOSE c1;		  

end $
DELIMITER ;

/*
call cursorDemo1();
*/






/* TO overcome this issue or this error we have to Handle this */
/* Method 2 */


DROP PROCEDURE IF EXISTS cursorDemo2;

DELIMITER $

CREATE PROCEDURE cursorDemo2()
BEGIN
    DECLARE _deptno INT;
    DECLARE _dname, _loc, _pwd, _startedon VARCHAR(20);
    DECLARE done INT DEFAULT 0;

    DECLARE c1 CURSOR FOR
        SELECT * FROM dept ORDER BY deptno;

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
CALL cursorDemo2();
*/