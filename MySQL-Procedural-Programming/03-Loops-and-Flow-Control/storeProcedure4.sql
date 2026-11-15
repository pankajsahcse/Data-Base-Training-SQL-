
DROP PROCEDURE if EXISTS printNumbers;
DELIMITER $

CREATE PROCEDURE printNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
       myloop : LOOP
	   
	        if i > 6 THEN
		       leave myloop;
			end if;
		
        SELECT i;
        set i = i + 1;
        
        end LOOP myloop;		
			
			   
END $

DELIMITER ;

/*
CALL printNumbers();
*/






DROP PROCEDURE if EXISTS printNumbers1;
DELIMITER $

CREATE PROCEDURE printNumbers1()
BEGIN
    DECLARE i INT DEFAULT 1;
       myloop : LOOP
	   
	        if i < 6 THEN
		       SELECT i;
			   set i = i + 1;
			else 
               leave myloop;			
			   
			end if;
		        
        end LOOP myloop;		
			
			   
END $

DELIMITER ;

/*
CALL printNumbers1();
*/



/* Leave the Loop with Condition */

DROP PROCEDURE if EXISTS leaveDemo;
DELIMITER $

CREATE PROCEDURE leaveDemo()
BEGIN
    DECLARE i INT DEFAULT 1;

    myloop: LOOP

        IF i = 4 THEN
            LEAVE myloop;
        END IF;

        SELECT i;
        SET i = i + 1;

    END LOOP myloop;
END $

DELIMITER ;


/*
CALL leaveDemo();
*/






/* Loop with the ITERATE AND LEAVE */

DROP PROCEDURE if EXISTS iterateDemo;
DELIMITER $

CREATE PROCEDURE iterateDemo()
BEGIN
    DECLARE i INT DEFAULT 0;

    myloop: LOOP

        SET i = i + 1;

        IF i > 5 THEN
            LEAVE myloop;
        END IF;

        IF i = 3 THEN
            ITERATE myloop;
        END IF;

        SELECT i;

    END LOOP myloop;
END $

DELIMITER ;

/*
CALL iterateDemo();
*/







/* lOOP WITH THE IN OUT PARAMETER */


DROP PROCEDURE IF EXISTS findSum;
DELIMITER $

CREATE PROCEDURE findSum(
    IN n INT,
    OUT result INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE total INT DEFAULT 0;

    myloop: LOOP

        IF i > n THEN
            LEAVE myloop;
        END IF;

        SET total = total + i;
        SET i = i + 1;

    END LOOP myloop;

    SET result = total;
END $

DELIMITER ;

/*
CALL findSum(5, @ans);
SELECT @ans;
*/





