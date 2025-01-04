/***************************************************/
/***************** Where & order  ******************/
/***************************************************/

--1 to select all the rows and columns in table 
SELECT *
FROM employees;


--2 to limiting the rows that are selected, we use (where)
SELECT *
FROM employees
WHERE department_id = 90;


/*
    3- these you should know when using the where
    character strings and date values are enclosed with single quotation marks
    Character values are case-sensitive and date values are fomat-sensitive
    the default date display format is DD/MO/RR
    
    
    Comparison Operators
    (=)       => (Equal to)
    (>)       => (Greater than)
    (>=)      => (Greater than or equal to )
    (<)       => (Less than)
    (<=)      => (Less than or equal)
    (<>)      => (Not equal to )
    (!=)      => (Not equal to)
    (between 
    and )     => (Betwen two values)
    (in(set)) => (match any of a list of values)
    (like)    => (match a character pattern)
    (is null) => (Is a null value)

*/


SELECT employee_id,
       first_name,
       last_name
FROM employees
WHERE first_name = 'Steven';

--4 using where in date column
SELECT *
FROM employees
WHERE hire_date = '21/09/15';

--5 using the comparison operators
SELECT *
FROM employees
WHERE salary >= 10000;

--6 using between
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--7 using the in operator
SELECT *
FROM employees
WHERE salary IN ( 10000, 25000, 17000 );


--8 using the like operator and it come usually with _ and %

SELECT *
FROM employees
WHERE first_name LIKE 'S%'; -- which start with S

SELECT *
FROM employees
WHERE first_name LIKE '%s'; -- Which end with S

SELECT *
FROM employees
WHERE first_name LIKE '%am%'; -- name include am

SELECT *
FROM employees
WHERE first_name LIKE '_d%'; -- has d in second letter

SELECT *
FROM employees
WHERE first_name LIKE '__s%'; -- has d in third letter


SELECT job_id
FROM jobs
WHERE job_id LIKE 'SA/_%' ESCAPE '/';


--9 using null
SELECT *
FROM employees
WHERE commission_pct IS NULL;


--10 using not

SELECT *
FROM employees
WHERE employee_id NOT IN ( 100, 101 );

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT *
FROM employees
WHERE first_name NOT LIKE 'S%'; -- has d in third letter


--11 Defining coditions using the logical operators (and - or)

-- And
SELECT employee_id,
       last_name,
       job_id,
       salary,
       department_id
FROM employees
WHERE salary >= 1000
      AND department_id = 90;


-- OR
SELECT employee_id,
       last_name,
       job_id,
       salary,
       department_id
FROM employees
WHERE salary >= 1000
      OR department_id = 90;


/*
    here you should know the pr    iorities
    look to manual hint 
    in this select there are 2 conditions
    first condition job_id = 'AD_PRES' AND salary > 10000
    second condition job_id = 'SA_REP'
    
    Note : (oracle do the and first then or if no => () )
*/

SELECT last_name,
       job_id,
       salary
FROM employees
WHERE job_id = 'SA_REP'
      OR  job_id = 'AD_PRES'
           AND salary > 10000 ;
      

--when you use the parantheses () , then you can override and/or priorities

SELECT last_name,
       job_id,
       salary
FROM employees
WHERE ( job_id = 'SA_REP'
        OR job_id = 'AD_PRES' )
      AND salary > 15000;
      

--12 order by
SELECT *
FROM employees
ORDER BY hire_date; -- the default order always (ASC) Ascending

SELECT *
FROM employees
ORDER BY hire_date ASC;-- the Default


SELECT *
FROM employees
ORDER BY hire_date DESC;-- the Default


SELECT *
FROM employees
WHERE department_id = 90
ORDER BY employee_id;

SELECT first_name n
FROM employees
ORDER BY n;


--13 you can sort by column not in the select even

SELECT employee_id,
       salary
FROM employees
ORDER BY department_id;


--14 you can sort by more than one column

SELECT department_id,
       first_name,
       salary
FROM employees
ORDER BY department_id,
         first_name;

SELECT department_id,
       first_name,
       salary
FROM employees
ORDER BY department_id DESC,
         first_name ASC;

SELECT *
FROM employees
ORDER BY employee_id
FETCH FIRST 10 ROWS ONLY;

SELECT *
FROM employees
ORDER BY employee_id
FETCH FIRST 10 PERCENT ROWS ONLY;

--Skip 5 then get 5
SELECT *
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT *
FROM employees
ORDER BY employee_id
OFFSET 5 ROWS FETCH NEXT 50 PERCENT ROWS ONLY;

SELECT *
FROM employees
ORDER BY salary DESC
FETCH FIRST 2 ROWS WITH TIES; -- IF TWO IN THE SAME SALARY GIVE ME ALSO