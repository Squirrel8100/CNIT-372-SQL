/*
Logan Fish
CNIT 372 Spring 2022
Lab 9 pt 2
4/17/22

*/
--Question 1a

CREATE TABLE LAB9_EMPLOYEE AS SELECT * FROM EMPLOYEE;

--Question 1b
CREATE OR REPLACE TRIGGER TBDS_LAB9_EMPLOYEE
    BEFORE DELETE ON LAB9_EMPLOYEE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired before deleting a row from LAB9_EMPLOYEE');
END;
--What is the database object upon which this trigger is defined? What is the timing of the trigger?
--Answer: the trigger is based upon the delete event, the object it is based upon is anything within the database being deleted. 
--The timing of the trigger is once it comes across the delete trigger and before it completes the deleting of rows.


--Question 1c
CREATE OR REPLACE TRIGGER TBDR_LAB9_EMPLOYEE
    BEFORE DELETE ON LAB9_EMPLOYEE
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired before deleting anything from LAB9_EMPLOYEE');
END;
--What is the database object upon which this trigger is defined? What is the timing of the trigger?
--Answer: The trigger is based upon the delete event affecting entire rows. 
--The timing of the trigger is once it comes across the delete trigger and before it completes the deleting of rows.

--Question 1d
CREATE OR REPLACE TRIGGER TADS_LAB9_EMPLOYEE
    AFTER DELETE ON LAB9_EMPLOYEE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired after deleting anything from LAB9_EMPLOYEE');
END;
-- What is the database object upon which this trigger is defined? What is the timing of the trigger?
--Answer: the trigger is based upon the delete event, the timing is based upon once the delete query comes and reports after it has been deleted. 

--Question 1e
CREATE OR REPLACE TRIGGER TADR_LAB9_EMPLOYEE
    AFTER DELETE ON LAB9_EMPLOYEE
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired after deleting a row from LAB9_EMPLOYEE');
END;
--What is the database object upon which this trigger is defined? What is the timing of the trigger?
--Answer: The trigger is based upon the delete event affecting entire rows. 
--The timing of the trigger is once it comes across the delete trigger and after it completes the deleting of rows.

--Question 1f
DELETE FROM LAB9_EMPLOYEE
WHERE EMPLOYEEID = '101135';
--RESULTS
/*
Trigger fired before deleting a row from LAB9_EMPLOYEE
Trigger fired before deleting anything from LAB9_EMPLOYEE
Trigger fired after deleting a row from LAB9_EMPLOYEE
Trigger fired after deleting anything from LAB9_EMPLOYEE
*/
--All of the Triggers fired. both before triggers fired, then both after triggers fired.


--Question 1g
select * from lab9_employee
where employeeid = '101135';
--no rows selected, --2nd run after rollback gives results. 
rollback;
--Rollback complete

--After the rollback the data is restored. The trigger execution does not implcitly perform a commit. 

--Question 1h
DELETE FROM LAB9_EMPLOYEE
WHERE JOBTITLE = 'Sales';
--3 rows deleted
/*
Trigger fired before deleting a row from LAB9_EMPLOYEE
Trigger fired before deleting anything from LAB9_EMPLOYEE
Trigger fired after deleting a row from LAB9_EMPLOYEE
Trigger fired before deleting anything from LAB9_EMPLOYEE
Trigger fired after deleting a row from LAB9_EMPLOYEE
Trigger fired before deleting anything from LAB9_EMPLOYEE
Trigger fired after deleting a row from LAB9_EMPLOYEE
Trigger fired after deleting anything from LAB9_EMPLOYEE

*/

--Question 1i
rollback;

SELECT * 
FROM LAB9_EMPLOYEE
WHERE JOBTITLE = 'Sales';
--RESULTS IS THE 3 ROWS OF DATA ARE BACK
--After the rollback the data is restored.
--This is to be expected as it is no difference than the previous delete. There is no commits currently. 

TRUNCATE TABLE LAB9_EMPLOYEE;
--Table LAB9_EMPLOYEE truncated.
--No Triggers were fired when the table was truncated. 
