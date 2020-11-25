-- Sum, min max and round
select round(avg(salary),2)"Average salary", max(salary), manager_id,
        min(salary),sum(salary) "TOTAL_salary"
from employees
group by manager_id
order by manager_id;

--Min and max Characters
SELECT MIN(last_name), MAX(last_name)
FROM employees;

--Count * count(expr) count distinct

SELECT COUNT(job_id) FROM employees where job_id= 'IT_PROG';

SELECT COUNT(DISTINCT manager_id) from employees;

--Group functions and null values (ignored by default, us nvl)

SELECT AVG(NVL(comission_ptc,0)) FROM employees;

--Group by

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT manager_id, COUNT(salary), MIN(salary)
FROM employees
GROUP BY manager_id
ORDER BY MIN(salary);

--Group by multiple columns
 SELECT manager_id, job_id, SUM(salary)
FROM employees
GROUP BY manager_id,job_id
ORDER BY manager_id;

--Illegal querys (Do not use aggregate functions in a where clausule)
SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary)>8000
GROUP BY department_id;

--Restrict group results (where for all, having for aggregates)

SELECT MIN(salary),manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING AVG(salary)>6000
ORDER BY MIN(salary);

--Nesting group functions (max 2 agregated functions, obviusly, only one row.)

SELECT ROUND(MAX(AVG(salary)),2)
FROM employees
GROUP BY department_id;

--Exercices, Using funcions and conditional expressions.
--Exercice 1
SELECT last_name, TO_CHAR(hire_date, 'fmDAY, "the" Ddspth "of" Month, YYYY'),
        TO_CHAR((ADD_MONTHS(hire_date,6)), 'fmDD, "the" Ddspth "of" Month, YYYY')
FROM employees;
--Exercice 2
SELECT last_name,NVL(TO_CHAR(commission_pct), 'No Commision') comm
FROM employees;
--Exercice 3
SELECT last_name,
    (CASE job_id
    WHEN 'AD_PRES' THEN 'A'
    WHEN 'ST_MAN' THEN 'B'
    WHEN 'IT_PROG' THEN 'C'
    WHEN 'SA_REP' THEN 'D'
    WHEN 'ST_CLERK' THEN 'E'
    ELSE 'O'
    END)
FROM employees;

--Group by exercices
--Exercice 1
SELECT job_id, COUNT(job_id)
FROM employees
GROUP BY job_id;
--Exercice 2  (Use & to create a variable)
SELECT job_id, COUNT(job_id)
FROM employees
WHERE job_id='&job_title'
GROUP BY job_id;
--Exercice 3
SELECT manager_id , MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary)>6000
ORDER BY MIN(salary) DESC;



