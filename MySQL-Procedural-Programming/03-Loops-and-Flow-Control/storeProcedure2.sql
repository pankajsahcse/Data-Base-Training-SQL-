DROP PROCEDURE if EXISTS printNumber;

DELIMITER $
CREATE PROCEDURE printNumber()
BEGIN

    DECLARE i int DEFAULT 1;
	
	WHILE i <= 10 do 
	     SELECT i ;
		 set i = i + 1;
		 
    end while;		 


end $
DELIMITER ;


/* 
call printNumber()

 */





/* while with label */


DROP PROCEDURE if EXISTS printNum;
DELIMITER $

CREATE PROCEDURE printNum()
BEGIN
    DECLARE i INT DEFAULT 1;

    myloop: WHILE i <= 5 DO
        SELECT i;
        SET i = i + 1;
    END WHILE myloop;
END $

DELIMITER ;

/* 
call printNum()

 */





/* while with IN and Out Parameter */



DROP PROCEDURE if EXISTS findSum;

DELIMITER $
CREATE PROCEDURE findSum(in n int, out res int)
BEGIN

    DECLARE i int DEFAULT 1;
	DECLARE total int DEFAULT 0;
	
	WHILE i <= n do 
	
	     set total = total + i;
		 set i = i + 1;
		 	 
		 
    end while;		
    
    set res = total;	
end $
DELIMITER ;

/* 
call findSum(10,@ans)
SELECT ans;

 */






/* while with Leave */


DROP PROCEDURE if EXISTS leaveDemo;
DELIMITER $

CREATE PROCEDURE leaveDemo()
BEGIN
    DECLARE i INT DEFAULT 1;

    myloop: while i <= 10 do 
	   
	       if i = 5 then 
		       Leave myloop;
		    end if;
     
        SELECT i;
        set i = i + 1;
	
    end while myloop;

  
END $

DELIMITER ;

/* 
call leaveDemo()

 */







/* while with ITERATE */

DROP PROCEDURE if EXISTS iterateDemo;
DELIMITER $

CREATE PROCEDURE iterateDemo()
BEGIN
    DECLARE i INT DEFAULT 0;

    myloop: WHILE i < 5 DO
        SET i = i + 1;

        IF i = 3 THEN
            ITERATE myloop;
        END IF;

        SELECT i;
    END WHILE myloop;
END $

DELIMITER ;


/* 
call iterateDemo()

 */








