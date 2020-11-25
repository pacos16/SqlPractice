--Multiple column subquery
SELECT employee_id,department_id,salary
FROM employees
WHERE (salary,department_id) IN (SELECT MAX(salary), department_id
                                FROM employees
                                GROUP BY department_id)
ORDER BY department_id;  

--Exercice, multiple querys
--1 Natural join
SELECT location_id, street_address,city,state_province,country_name
FROM departments  
NATURAL JOIN locations 
NATURAL JOIN countries;
--2 3
SELECT e.last_name||'  '||e.employee_id "Emp#",m.last_name||'  '||m.employee_id "Mgr#"
FROM employees e LEFT JOIN employees m
ON e.manager_id = m.employee_id;

--Subquery exercice
SELECT employee_id, last_name,salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
ORDER BY salary ASC;      

--2    
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT department_id
                    FROM employees
                    WHERE last_name like '%u%' OR last_name like '%U%');
--3
SELECT last_name
FROM employees
WHERE salary > ANY(SELECT salary
                FROM employees
                WHERE department_id=60)