--Creating table

CREATE TABLE hr.my_employee
(id         NUMBER(4) NOT NULL,
last_name   VARCHAR(25), 
first_name  VARCHAR(25), 
userid      VARCHAR(8),
salary      NUMBER(9,2)      
);
insert into my_employee values(1,'Patel','Ralph','rpatel',895);
insert into my_employee values(2,'Dancs','Betty','bdancs',860);
insert into my_employee values(3,'Biri','Ben','bbiri',1100);
insert into my_employee values(4,'Newman','Chad','cnewman',750);
insert into my_employee values(5,'Ropeburn','Audrey','aropeburn',1550);

--Insert with parameters
INSERT INTO my_employee
VALUES (&id,'&Last name','&first_name','&userid',&p_salary);

--Update
UPDATE my_employee
SET salary=1000
WHERE salary>900

--Database transactions
UPDATE departments 
SET department_name = 'Test124'
WHERE department_id = 350;

SAVEPOINT update_done;

ROLLBACK TO SAVEPOINT update_done;
COMMIT;