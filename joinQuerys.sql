--Natural Join
SELECT department_id, department_name, location_id,city
FROM departments NATURAL JOIN locations
WHERE departments_id IN (20,50)

--Using (equijoin)
SELECT employee_id, last_name,department_name
FROM employees
JOIN departments
USING (department_id);
    
SELECT first_name, last_name, job_id, job_title
FROM employees
JOIN jobs
USING (job_id)
WHERE department_id IN (10,20,30,40);

--Table alias with USING clause

SELECT l.city, d.department_name
FROM locations l
JOIN departments d
USING (location_id)
WHERE location_id =1400;

--The ON clause

SELECT c.country_name, l.country_id,c.country_id,l.location_id, l.street_address, l.city
FROM locations l
JOIN countries c
ON l.country_id=c.country_id
ORDER BY c.country_name, l.city; 

--Aditional conditions to a join (AND, WHERE)
SELECT d.department_name, l.location_id,l.city
FROM departments d 
JOIN locations l
ON d.location_id = l.location_id
WHERE l.location_id=1700;

--Self-join

SELECT worker.last_name emp, manager.last_name mgr
FROM employees worker JOIN employees manager
ON worker.manager_id=manager.employee_id
WHERE manager.employee_id = 103
ORDER BY worker.last_name; 

--Non Equijoin
SELECT e.last_name, e.hire_date,davies.hire_date, davies.last_name
FROM employees e JOIN employees davies
ON (davies.last_name = 'Davies')
WHERE davies.hire_date < e.hire_date
ORDER BY e.hire_date;


--Outer joins

SELECT e.employee_id, e.last_name, e.department_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.last_name like 'G%'
ORDER BY e.last_name;

--SAME FOR RIGHT


--CARTESIAN PRODUCT = CROSS JOIN

