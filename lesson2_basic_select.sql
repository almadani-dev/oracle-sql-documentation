/***************************************************/
/****************** Basic Select *******************/
/***************************************************/

--1 to select all the column/rows in a table use:

SELECT *
FROM departments;

--2 to select specific column
SELECT department_id
FROM departments;

SELECT department_id,
       department_name
FROM departments;


--3 using arithmethic expressions ( + , - , * , /)

SELECT employee_id,
       first_name,
       salary,
       salary + 100,
       salary + ( salary * 0.10 )
FROM employees;



--4 to know null values 
-- null is a value that is unvallable,unassigned, unknown
-- null is not the same as zero or a blank space

SELECT last_name,
       job_id,
       salary,
       commission_pct
FROM employees;


--5 articmethic expression containing a null value evaluate to null
SELECT last_name,
       commission_pct + 10
FROM employees;


--6 Defining a colum alias 
SELECT last_name,
       last_name AS name,
       last_name lname
FROM employees;

--7 concatenation Operator  

SELECT first_name
       || ' '
       || last_name AS fullname
FROM employees;

SELECT first_name
       || q'[ Don't work on a ]'
       || department_id
FROM employees;


--8 using distient (remove the duplicate)

SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT department_id,
                job_id
FROM employees;


--9 Descript the structure of a table
desc employees;