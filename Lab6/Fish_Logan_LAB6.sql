/*
Logan Fish
CNIT 37200
Lab 6
*/
--Question 1
CREATE TABLE person_of_interest(
name varchar2(25),
company_name varchar2(30) ,
telephone varchar2(25),
email_address varchar2(30)
);

--Question 2
--Complete this using a union of three statements. 
select CustFirstName || ' ' || CustLastName as Name, Phone, EmailAddr, nvl(CompanyName, 'none on record')
from customer
union
select FirstName || ' ' || LastName as Name, HomePhone, EmailAddr,  'Eagle Electronics' as CompanyName
from employee
union
select ContactName, Phone, EmailAddr, nvl(CompanyName, 'none on record')
from supplier;


--Question 3
Insert into person_of_interest (name, telephone, email_address, company_name)
select CustFirstName || ' ' || CustLastName as Name, Phone, EmailAddr, nvl(CompanyName, 'none on record')
from customer
union
select FirstName || ' ' || LastName as Name, HomePhone, EmailAddr,  'Eagle Electronics' as CompanyName
from employee
union
select ContactName, Phone, EmailAddr, nvl(CompanyName, 'none on record')
from supplier;

--Question 4
update person_of_interest
set email_address = 'none on record'
where email_address is null;


--select * from person_of_interest; 

--Question 5
delete from person_of_interest
where company_name = 'none on record';
--select * from person_of_interest; 

--Question 6
truncate table person_of_interest;

--select * from person_of_interest;


--Question 7
CREATE TABLE COPY_CUSTOMER AS SELECT * FROM CUSTOMER; 

--Question 8
INSERT INTO COPY_CUSTOMER (CustomerID, CompanyName, CustFirstName, CustLastName, CustTitle, City, State)
VALUES ('Z-12345', 'Quick Stop', 'Randal', 'Graves', 'Mr.', 'Leonardo', 'NJ' );


--Question 9
UPDATE COPY_CUSTOMER
SET PostalCode = '07737'
WHERE CustomerID = 'Z-12345';

--Question 10
DELETE FROM COPY_CUSTOMER
WHERE STATE = 'OH';



--Question 11
DELETE FROM COPY_CUSTOMER
WHERE CustomerID = 'Z-12345';


--Question 12
UPDATE COPY_CUSTOMER
SET STATE = 'NJ', CITY = 'Leonardo'
WHERE STATE != 'NJ';


--Question 13
Create table EMPLOYEE_BOTTOM_25 (
EmployeeID		varchar2(10),
Employee_name   varchar2(40),
JobTitle		varchar2(35),
Salary  		number(9,2)
);

create table EMPLOYEE_TOP_10(
EmployeeID		varchar2(10),
Employee_name   varchar2(40),
JobTitle		varchar2(35),
Salary  		number(9,2)
);

create table EMPLOYEE_OTHERS(
EmployeeID		varchar2(10),
Employee_name   varchar2(40),
JobTitle		varchar2(35),
Salary  		number(9,2)
);

--Question 14 
--EMPLOYEE_BOTTOM_25
Insert into EMPLOYEE_BOTTOM_25(EmployeeID, Employee_name, JobTitle, Salary)
select EmployeeID, FirstName || ' '|| LastName as Employee_name, JobTitle, SalaryWage
from EMPLOYEE
WHERE salarywage < (SELECT avg(salarywage) * .25 from employee)
order by SalaryWage desc;

--EMPLOYEE_TOP_10 
Insert into EMPLOYEE_TOP_10(EmployeeID, Employee_name, JobTitle, Salary)
select EmployeeID, FirstName || ' '|| LastName as Employee_name, JobTitle, SalaryWage
from EMPLOYEE
WHERE salarywage > (SELECT avg(salarywage) * .10 from employee)
order by SalaryWage desc;

--EMPLOYEE_OTHERS
--Doesnt work currently. 
select EmployeeID, FirstName || ' '|| LastName as Employee_name, JobTitle, SalaryWage
from EMPLOYEE
WHERE EMPLOYEEID NOT IN (SELECT EMPLOYEEID FROM EMPLOYEE_TOP_10) AND EMPLOYEEID NOT IN (SELECT EMPLOYEEID FROM EMPLOYEE_BOTTOM_25);

--Question 15
delete from EMPLOYEE_BOTTOM_25;
delete from EMPLOYEE_TOP_10;
delete from EMPLOYEE_OTHERS;

--Question 16
Create table EMPLOYEE_TOP_2 (
EmployeeID		varchar2(10),
Employee_name   varchar2(40),
JobTitle		varchar2(35),
Salary  		number(9,2)
);

--Question 17
/*
With the conditional clauses to insert tables based on the where clause, the insert first clause will insert tables based on the first condition that is met. 
whereas the insert all clause will need every condition to be evaluated as true to insert the data into the table. 


*/
Insert into EMPLOYEE_TOP_2(EmployeeID, Employee_name, JobTitle, Salary)
select EmployeeID, FirstName || ' '|| LastName as Employee_name, JobTitle, SalaryWage
from EMPLOYEE
WHERE salarywage > (SELECT avg(salarywage) * .02 from employee)
order by SalaryWage desc;


--Question 18
UPDATE EMPLOYEE_TOP_2
SET Salary = ((Salary *.20) + Salary);


--Question 19
INSERT INTO EMPLOYEE_TOP_2 (EmployeeID, Employee_name, JobTitle, Salary)
VALUES ('101', 'Happy Owner', 'Big Boss', '1000000');




--Question 20
--Currently doesnt work. 
MERGE into EMPLOYEE_TOP_10
using (SELECT EmployeeID, Employee_name, JobTitle, Salary FROM EMPLOYEE_TOP_2)
ON (EMPLOYEE_TOP_10.EmployeeID = EMPLOYEE_TOP_2.EmployeeID);




--Question 21
DROP TABLE COPY_CUSTOMER CASCADE CONSTRAINTS;
DROP TABLE PERSON_OF_INTEREST CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_TOP_10 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_TOP_2 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_BOTTOM_25 CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE_OTHERS CASCADE CONSTRAINTS;