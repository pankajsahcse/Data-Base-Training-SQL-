/* Find the Highest Salary */ 

SELECT MAX(sal) from emp;

SELECT sal from emp ORDER BY sal DESC limit 1;

WITH cte AS ( SELECT sal, DENSE_RANK() OVER(ORDER BY sal DESC) AS rnk FROM emp)
SELECT sal FROM cte WHERE rnk = 1;

WITH cte as (SELECT sal from emp) SELECT sal from cte ORDER by sal desc limit 1;




/* Find the SECOND Highest Salary */ 


/* Using sub query */ 
SELECT MAX(sal) from emp WHERE sal < (SELECT MAX(sal) from emp);

SELECT DISTINCT sal from emp ORDER BY sal DESC limit 1,1;  /* 1 skip then 1 RETURN */
SELECT DISTINCT sal from emp ORDER BY sal DESC limit 1 offset 1;  /* 1 return 1 chor ke */

/* 
   LIMIT 2 OFFSET 3; 
     First value (2) → 2 rows return karo.
     Second value (3) → 3 rows skip karo.
	
   LIMIT 3, 2;
     First value (3) → 3 rows skip karo.
     Second value (2) → 2 rows return karo.
	
	 */
	 
	 
WITH cte AS (SELECT sal, DENSE_RANK() OVER (ORDER BY sal DESC) AS rnk FROM emp)
SELECT sal FROM cte WHERE rnk = 2;	 

/* CO related Sub Query */
SELECT DISTINCT e1.sal
FROM emp e1
WHERE 1 = (
    SELECT COUNT(DISTINCT e2.sal)
    FROM emp e2
    WHERE e2.sal > e1.sal
);



/* Find the third Highest Salary */ 

WITH cte AS ( SELECT sal, DENSE_RANK() OVER(ORDER BY sal DESC) AS rnk FROM emp)
SELECT sal FROM cte WHERE rnk = 3;


/* Find the Fifth Highest Salary */ 

WITH cte AS ( SELECT sal, DENSE_RANK() OVER(ORDER BY sal DESC) AS rnk FROM emp)
SELECT sal FROM cte WHERE rnk = 5;