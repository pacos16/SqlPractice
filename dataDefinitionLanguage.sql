--SET Operators
--UNION ALL (duplicates) UNION no dplicates

--INTERSECT
SELECT employee_id
FROM employees
WHERE job_id ='PU_CLERK'
INTERSECT
SELECT employee_id
FROM employees
WHERE department_id =30;

--MINUS
SELECT department_id 
FROM departments
MINUS
SELECT department_id
FROM employees;

--Marching SELECT statements

SELECT location_id, department_name "Department",
    TO_CHAR(NULL) "Warehouse location"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "Department",state_province
FROM locations;

--Order by (first query columns, alias or number)
SELECT employee_id, job_id ,salary
FROM employees
MINUS
SELECT employee_id,job_id, 0
FROM employees
WHERE job_id IN (1,2,4,6)
ORDER BY 2;
--Exercices
--1 
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees
WHERE JOB_ID ='ST_CLERK';
--2
SELECT country_name
FROM countries
MINUS
SELECT TO_CHAR(NULL)
FROM locations
WHERE location_id IN (SELECT location_id 
                    FROM departments);

--Data Definition Language

--Default
CREATE TABLE hire_dates
(id NUMBER(8),
hire_date DATE DEFAULT SYSDATE)
--Consraints FK
CONSTRAINT loc_id_fk_arc FOREIGN KEY (location_id)
REFERENCES locations(location_id);
--Check
salary NUMBER(7,2) CONSTRAINT emp_sal_min (sal>0)
--As
CREATE TABLE tabl 
AS (subquery)
--ALTER TABLE (new column, modify column, define default valu, drop column, rename column, change to read only)
ALTER TABLE tabl
ADD
MODIFY 
DROP 
SET UNUSED(column)
DROP UNUSED COLUMNS 
READ ONLY 
READ WRITE 
--DROP TABLE
DROP TABLE tabl PURGE
FLASHBACK TABLE tabl
--EXERCICES

CREATE TABLE emp(
    id NUMBER(7),
    last_name VARCHAR2(25),
    first_name VARCHAR2(25),
    dept_id NUMBER(7));

ALTER TABLE emp
MODIFY last_name VARCHAR2(40);

ALTER TABLE emp
SET UNUSED(dept_id);

ALTER TABLE emp
DROP UNUSED COLUMNS;

