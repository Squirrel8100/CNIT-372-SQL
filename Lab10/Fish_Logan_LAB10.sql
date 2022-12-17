/*
Logan Fish
CNIT 372 Spring 2022
Lab 9 pt 2
4/24/22

*/

--Question 2a

--Once Before data
CREATE OR REPLACE TRIGGER TBIS_LAB9_EMPLOYEE
    BEFORE INSERT ON LAB9_EMPLOYEE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired before Inserting Data Into LAB9_EMPLOYEE');
END;

CREATE OR REPLACE TRIGGER TBIR_LAB9_EMPLOYEE
    BEFORE INSERT ON LAB9_EMPLOYEE
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE');
END;

CREATE OR REPLACE TRIGGER TAIS_LAB9_EMPLOYEE
    AFTER INSERT ON LAB9_EMPLOYEE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired after Inserting data into LAB9_EMPLOYEE');
END;

CREATE OR REPLACE TRIGGER TAIR_LAB9_EMPLOYEE
    AFTER INSERT ON LAB9_EMPLOYEE
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger fired after Inserting Data Row into LAB9_EMPLOYEE');
END;

--Question 2b
--I expect the Before and After row to fire once and the Before and After Trigger to fire for each encounter of insert. 


--Question 2c
Insert into LAB9_EMPLOYEE values ('101168', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
/*
Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE
*/

--My hypothesis was right that it would fire once for the before and after rows and once again for Inserting Before and After. 

--Question 2d
--I expect for each Row Inserted it will come with 2 Before and after DMBS row outputs and two Inserting before and after dbms outputs. 
-- for 40 rows inserted i Expect 10 total output messages. 

--Question 2e
Insert into LAB9_EMPLOYEE values ('101180', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101181', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101182', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101183', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101184', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101185', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101186', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101187', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101188', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101189', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	

Insert into LAB9_EMPLOYEE values ('101190', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101191', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101192', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101193', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101194', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101195', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101196', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101197', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101198', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101199', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	

Insert into LAB9_EMPLOYEE values ('101200', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101201', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101202', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101203', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101204', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101205', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101206', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101207', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101208', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101209', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	

Insert into LAB9_EMPLOYEE values ('101210', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101211', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101212', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101213', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101214', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101215', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101216', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101217', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101218', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	
Insert into LAB9_EMPLOYEE values ('101219', 'Reece', 'Phil', 'Assembly', '1204 N. Nebraska Ave', 'Fort Sutton', 'FL', '33603', '919-486-0649', null, '15-MAR-2010', null, 'Temporary', 'Work For U', '287', '13-MAY-1978', '111', '100209', null, 10.5);	

--Results
/*
Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

Trigger fired before Inserting Data Into LAB9_EMPLOYEE
Trigger fired before Inserting Data Row Into LAB9_EMPLOYEE
Trigger fired after Inserting Data Row into LAB9_EMPLOYEE
Trigger fired after Inserting data into LAB9_EMPLOYEE

*/
--The Test did indeed support my hypothesis. 



--Question 3
CREATE OR REPLACE TRIGGER RESTRICT_UPDATE
    BEFORE UPDATE ON LAB9_EMPLOYEE 
    FOR EACH ROW WHEN (NEW.EMAILADDR NOT LIKE '%.com')
BEGIN
    RAISE_APPLICATION_ERROR(-20000, 'Can not update, not a valid email address. ');
END;


UPDATE LAB9_EMPLOYEE
SET EMAILADDR = 'testing1Email@Email.com'
where EmployeeID = '100001';

UPDATE LAB9_EMPLOYEE
SET EMAILADDR = 'testing1Email@Email.fake'
where EmployeeID = '100001';
/*
Error report -
ORA-20000: Can not update, not a valid email address.
ORA-06512: at "FISHL.RESTRICT_UPDATE", line 2
ORA-04088: error during execution of trigger 'FISHL.RESTRICT_UPDATE'
*/

--Question 4
DROP TABLE LAB9_EMPLOYEE CASCADE CONSTRAINTS;



/*DDL Questions*/

--Question 1. 
CREATE TABLE AIRDB_ALL_INFO AS SELECT * FROM CNIT372TA.AIRDB_ALL_INFO;


--Question 2a
ALTER TABLE AIRDB_ALL_INFO MODIFY (ORIGIN_CITY_NAME NOT NULL);
ALTER TABLE AIRDB_ALL_INFO MODIFY (DEST_CITY_NAME NOT NULL);
--Question 2b
ALTER TABLE AIRDB_ALL_INFO MODIFY (ORIGIN_STATE_NM NOT NULL);
ALTER TABLE AIRDB_ALL_INFO MODIFY (DEST_STATE_NM NOT NULL);
--Question 2c
ALTER TABLE AIRDB_ALL_INFO ADD CONSTRAINT UNIQUE_CONSTRAINT UNIQUE (ORIGIN_AIRPORT_ID, DEST_AIRPORT_ID, FL_NUM, CARRIER, FL_DATE);

--Question 3
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'AIRDB_ALL_INFO';
/*
OWNER                                                                                                                            CONSTRAINT_NAME                                                                                                                  C TABLE_NAME                                                                                                                       SEARCH_CONDITION                                                                 SEARCH_CONDITION_VC                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              R_OWNER                                                                                                                          R_CONSTRAINT_NAME                                                                                                                DELETE_RU STATUS   DEFERRABLE     DEFERRED  VALIDATED     GENERATED      BAD RELY LAST_CHAN INDEX_OWNER                                                                                                                      INDEX_NAME                                                                                                                       INVALID VIEW_RELATED   ORIGIN_CON_ID
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- - -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------- -------- -------------- --------- ------------- -------------- --- ---- --------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ------- -------------- -------------
FISHL                                                                                                                            SYS_C00394484                                                                                                                    C AIRDB_ALL_INFO                                                                                                                   "ORIGIN_CITY_NAME" IS NOT NULL                                                   "ORIGIN_CITY_NAME" IS NOT NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          21-APR-22                                                                                                                                                                                                                                                                                                      0
FISHL                                                                                                                            SYS_C00394485                                                                                                                    C AIRDB_ALL_INFO                                                                                                                   "DEST_CITY_NAME" IS NOT NULL                                                     "DEST_CITY_NAME" IS NOT NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          21-APR-22                                                                                                                                                                                                                                                                                                      0
FISHL                                                                                                                            SYS_C00394486                                                                                                                    C AIRDB_ALL_INFO                                                                                                                   "ORIGIN_STATE_NM" IS NOT NULL                                                    "ORIGIN_STATE_NM" IS NOT NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          21-APR-22                                                                                                                                                                                                                                                                                                      0
FISHL                                                                                                                            SYS_C00394487                                                                                                                    C AIRDB_ALL_INFO                                                                                                                   "DEST_STATE_NM" IS NOT NULL                                                      "DEST_STATE_NM" IS NOT NULL                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     GENERATED NAME          21-APR-22                                                                                                                                                                                                                                                                                                      0
FISHL                                                                                                                            UNIQUE_CONSTRAINT                                                                                                                U AIRDB_ALL_INFO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               21-APR-22 FISHL                                                                                                                            UNIQUE_CONSTRAINT                                                                                                                                                   0
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                            ENABLED  NOT DEFERRABLE IMMEDIATE VALIDATED     USER NAME               21-APR-22 FISHL                                                                                                                            UNIQUE_CONSTRAINT                                                                                                                                                   0


*/

--Question 4
CREATE TABLE AIRDB_CLONE AS SELECT * FROM AIRDB_ALL_INFO;

--Question 5
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'AIRDB_CLONE';
--The unique Constraint made earlier for the all info table is missing from the airdb clone table. 

--Question 6
ALTER TABLE AIRDB_CLONE ADD CONSTRAINT CLONE_UNIQUE_CONSTRAINT UNIQUE (ORIGIN_AIRPORT_ID, DEST_AIRPORT_ID, FL_NUM, CARRIER, FL_DATE);

--Question 7

CREATE TABLE AIRDB_AIRPORTS
(
AIRPORT_ID NUMBER PRIMARY KEY,
CITY_MARKET_ID NUMBER,
AIRPORT_CODE VARCHAR2(3),
CITY_NAME VARCHAR2(30) NOT NULL,
STATE_ABR VARCHAR2(2),
STATE_FIPS NUMBER,
STATE_NAME VARCHAR2(20) NOT NULL
);

--Question 8
--PART A with a Union All
/*
Error report -
ORA-00001: unique constraint (FISHL.SYS_C00394463) violated
*/
--PART B
INSERT INTO AIRDB_AIRPORTS
SELECT ORIGIN_AIRPORT_ID, ORIGIN_CITY_MARKET_ID, ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_STATE_FIPS, ORIGIN_STATE_NM
FROM AIRDB_ALL_INFO
UNION
SELECT DEST_AIRPORT_ID, DEST_CITY_MARKET_ID, DEST, DEST_CITY_NAME, DEST_STATE_ABR, DEST_STATE_FIPS, DEST_STATE_NM
FROM AIRDB_ALL_INFO;
-- The union All join takes all duplicates and non unique data, this is problematic and clashes with the unique constraints that we set up earlier. 

/*
294 rows inserted.
*/

--Question 9
ALTER TABLE AIRDB_CLONE ADD CONSTRAINT AIRPORT_ID_FKORG FOREIGN KEY
(ORIGIN_AIRPORT_ID) REFERENCES AIRDB_AIRPORTS(AIRPORT_ID);

ALTER TABLE AIRDB_CLONE ADD CONSTRAINT AIRPORT_ID_FKDEST FOREIGN KEY
(DEST_AIRPORT_ID) REFERENCES AIRDB_AIRPORTS(AIRPORT_ID);



--Question 10
ALTER TABLE AIRDB_CLONE DROP (ORIGIN_CITY_MARKET_ID, ORIGIN_STATE_FIPS,
DEST_CITY_MARKET_ID, DEST_STATE_FIPS);


--Question 11
ALTER TABLE AIRDB_AIRPORTS ADD CHECK
(STATE_ABR IN ('AK', 'AL', 'AR', 'AZ', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL',
'GA', 'GU', 'HI ', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME',
'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV',
'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT'));
/*
Error report -
ORA-02293: cannot validate (FISHL.) - check constraint violated
02293. 00000 - "cannot validate (%s.%s) - check constraint violated"
*Cause:    an alter table operation tried to validate a check constraint to
           populated table that had nocomplying values.
*Action:   Obvious
*/
--The error that occurs is because some of the tables values do not comply.
--I tried this with a check statement using all the states abbreviations and it ran, using most of but not all doesnt work because theres are abbreviations outside of the ones listed. 

--Question 12
ALTER TABLE AIRDB_AIRPORTS ADD CHECK
(STATE_ABR IN ('AK', 'AL', 'AR', 'AZ', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL',
'GA', 'GU', 'HI ', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME',
'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV',
'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT'))
DISABLE;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'AIRDB_AIRPORTS';

--Question 13

ALTER TABLE AIRDB_AIRPORTS ADD CHECK
(STATE_ABR IN ('AK', 'AL', 'AR', 'AZ', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL',
'GA', 'GU', 'HI ', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME',
'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV',
'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT'));
DELETE FROM AIRDB_AIRPORTS WHERE STATE_ABR LIKE ('VI') OR STATE_ABR LIKE ('MP');
-- The records would cause issues if removed as dependancy issues. 

--Question 14 -- Destination FK on delete cascade
ALTER TABLE AIRDB_CLONE DROP CONSTRAINT AIRPORT_ID_FKDEST;
ALTER TABLE AIRDB_CLONE ADD CONSTRAINT AIRPORT_ID_FKDEST FOREIGN KEY
(DEST_AIRPORT_ID) REFERENCES AIRDB_AIRPORTS(AIRPORT_ID) ON DELETE SET NULL;

--Question 15 -- Origin FK on delete cascade
ALTER TABLE AIRDB_CLONE DROP CONSTRAINT AIRPORT_ID_FKORG;
ALTER TABLE AIRDB_CLONE ADD CONSTRAINT AIRPORT_ID_FKORG FOREIGN KEY
(ORIGIN_AIRPORT_ID) REFERENCES AIRDB_AIRPORTS(AIRPORT_ID) ON DELETE CASCADE;


--Question 16
DELETE FROM AIRDB_AIRPORTS WHERE STATE_ABR LIKE ('VI') OR STATE_ABR LIKE ('MP');
-- It works now because the two tables now have non conflicting constraints and delete cascade deleted child rows when parent rows are deleted. 

--Question 17
ALTER TABLE AIRDB_AIRPORTS ADD CHECK
(STATE_ABR IN ('AK', 'AL', 'AR', 'AZ', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL',
'GA', 'GU', 'HI ', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME',
'MI', 'MN', 'MO', 'MP', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV',
'NY', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UM', 'UT'));
-- The check constraint works now because of the delete cascade constraint added alonside the referenceing. 


--Question 18
SELECT COUNT(DEST_AIRPORT_ID)
FROM AIRDB_CLONE
WHERE DEST_AIRPORT_ID IS NULL;

SELECT COUNT(ORIGIN_AIRPORT_ID)
FROM AIRDB_CLONE
WHERE ORIGIN_AIRPORT_ID IS NULL;

SELECT COUNT(DEST_AIRPORT_ID)
FROM AIRDB_ALL_INFO
WHERE DEST_AIRPORT_ID IS NULL;

SELECT COUNT(ORIGIN_AIRPORT_ID)
FROM AIRDB_ALL_INFO
WHERE ORIGIN_AIRPORT_ID IS NULL;

-- I would use the delete cascade constraint as it keeps the records between parent and child paired. If on records is deleted from the child it will also delete from the parent preventing issues. 


--Question 19
ALTER TABLE AIRDB_AIRPORTS ADD CONSTRAINT UNIQUE_AIRPORT UNIQUE(AIRPORT_CODE);
ALTER TABLE AIRDB_AIRPORTS MODIFY (AIRPORT_CODE NOT NULL);


--Question 20
ALTER TABLE AIRDB_AIRPORTS ADD CONSTRAINT UNIQUE_CITY UNQIUE(CITY_NAME);
-- It fails because of repeat data, cities are not unique in name.


--Question 21
DROP TABLE AIRDB_ALL_INFO CASCADE CONSTRAINTS;
DROP TABLE AIRDB_CLONE CASCADE CONSTRAINTS;
DROP TABLE AIRDB_AIRPORTS CASCADE CONSTRAINTS;
