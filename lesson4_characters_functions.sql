/*
    Character Function
    A function is a subprogram that return a value
    there are 2 types of character functions 
    1- case conversion function 
    2- character manipulation


    1- case conversion functions (upper,lower,initcap)
*/

SELECT employee_id,
       first_name,
       upper(first_name),
       lower(first_name),
       initcap(first_name)
FROM employees;
/*
    You can use it in where and order by
*/
SELECT employee_id,
       first_name,
       upper(first_name),
       lower(first_name),
       initcap(first_name)
FROM employees
WHERE upper(first_name) = upper('PATRICK');

SELECT employee_id,
       first_name,
       upper(first_name),
       lower(first_name),
       initcap(first_name)
FROM employees
ORDER BY upper(first_name);


--2 character manipulation functions

--concat function
SELECT employee_id,
       first_name,
       last_name,
       concat(first_name, last_name)
FROM employees;

--substr function
--substr(column| expression, m,n)
--m is the starting position, n the character long


SELECT employee_id,
       first_name,
       substr(first_name, 1, 3),
       substr(first_name, 2, 4),
       substr(first_name, 2),
       substr(first_name, - 4)
FROM employees;

--length function
SELECT first_name,
       length(first_name)
FROM employees;

--instr function
--instr(column|expression, m, n)
--m is the start searching position, n the occurrence

SELECT first_name,
       instr(first_name, 'e'),
       instr(first_name, 'e', 2),
       instr(first_name, 'e', 5),
       instr(first_name, 'e', 1, 2)
FROM employees
WHERE first_name = 'Nanette';


--lpad and rpad
SELECT employee_id,
       first_name,
       salary,
       lpad(salary, 10, '#'),
       rpad(salary, 10, '*')
FROM employees;


--replace function

SELECT employee_id,
       first_name,
       replace(first_name, 'a', '*'),
       replace(first_name, 'en', '#')
FROM employees;

-- dual table

select * from dual;

select 1+2+3 from dual;


-- trim function

select trim(' ' from ' mohammed almadani ') from dual;
select trim(leading ' ' from ' mohammed almadani ') from dual;
select trim(TRAILING ' ' from ' mohammed almadani ') from dual;
select trim(both ' ' from ' mohammed almadani ') from dual;
