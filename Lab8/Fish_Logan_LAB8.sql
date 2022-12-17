


--Question A1
CREATE TABLE CUSTOMER_NEW AS SELECT * FROM CNIT372TA.CUSTOMER_NEW;
ALTER TABLE CUSTOMER_NEW ADD PRIMARY KEY (CustomerID);

--Question A2
CREATE VIEW CUSTOMER_NEW_VIEW AS
SELECT custname, companyname, address, city, state, postalcode, phone, emailaddr
from customer_new;
select * from CUSTOMER_NEW_VIEW;
--RESULTS
/*
CUSTNAME                            COMPANYNAME                              ADDRESS                                  CITY                 ST POSTALCODE PHONE        EMAILADDR                                         
----------------------------------- ---------------------------------------- ---------------------------------------- -------------------- -- ---------- ------------ --------------------------------------------------
Helly Smith                                                                  953 Eden Park Dr.                        Cincinnati           OH 45202      513-639-2995 information@cincyart.org                          
John Day                            Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-2560 johnday@purdue.edu                                
Shannon Jing                        Purdue University                        500 Oval Dr.                             Wset Lafayette       IN 47907      765-588-7610 jing@purdue.edu                                   
Julia Rayz                          Purdue University                        401 N. Grant St.                         West Lafayette       IN 47907      765-494-9525 jtaylor1@purdue.edu                               
Jack Anderson                       University of Chicago                    5801 S. Ellis Ave.                       Chicago              IL 60637      773-702-8650 infocenter@uchicago.edu                           
Kate Johnson                        Michigan University                      500 S. State St.                         Ann Arbor            MI 48109      734-764-1817 info@umich.edu                                    
Shannon Jing                                                                 500 Oval Dr.                             West Lafayette       IN 47907      765-588-7610 tarokingu@gmail.com                               
Jackson Williams                                                             3400 Vine St.                            Cincinnati           OH 45220                   jackwilliams@gmail.com                            
Zack Browns                                                                  1777 E. Broad St.                        Columnbus            OH 43203      614-715-0000 zbrowns@yahoo.com                                 
Kate Sun                                                                     405 Sagamore Pkwy S.                     Lafayette            IN 47904                   katesun@gmail.com                                 

10 rows selected. 
*/

--Question A3
INSERT INTO CUSTOMER_NEW_VIEW (custname, address, city, state, postalcode)
VALUES ('John Doe','401 N. Grant St.,', 'West Lafayette','IN','47907');
--No you cannot insert/add this customer because it doesn't have a primary key.


--Question A4
CREATE VIEW customer_all (customerid, custname, companyname, address, postalcode, city, STATE, phone, emailaddr)
AS
SELECT customerid, custfirstname || ' ' || custlastname AS custname,
companyname, address, postalcode, city, STATE, phone, emailaddr
FROM customer
UNION
SELECT customerid, custname, companyname, address, postalcode, city, STATE, phone, emailaddr
FROM customer_new;

--Note: I did this as a query to validate customer_all... 
--I chose specific items to query to prevent a massive results section.
--This below proves that both tables have merged to make the view. 
select custname, companyname 
from customer_all 
where companyname is not null;
--results
/*

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Gregory Abbott                       Baker and Company                       
Tommy McFerren                       Cole Sales and Associates               
Cecil Scheetz                        Tippe Inn                               
Frank Aamodt                         Franklin Trinkets                       
Kathleen Plyman                      Needle Center                           
George Purcell                       BMA Advertising Design                  
Eugene Gasper                        Regency Hospital                        
Jared Meers                          South Street Rehabilitation             
Tracy Cicholski                      Dixon Pharmacy                          
Bruce Fogarty                        Photography Niche                       
Susan Strong                         Family Medical Center                   

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Ginger Xiao                          Bryant Accounting                       
Karen Burns                          Recreation Supply                       
Cathy Bending                        R and R Air                             
Evelyn Cassens                       Vets Inc.                               
Angie Hoover                         Goodwork Corporation                    
Jim Sokeland                         Powerful Employment                     
Hugo Gillespie                       Wadake Critters                         
Wade Jacobs                          Conner National                         
Brittany Cottingham                  Cottingham Plastics                     
David Tarter                         Realty Specialties                      
Heather Wallpe                       Reflexions Manufacturing                

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Robert Dalury                        TAS                                     
Jim Lichty                           Bankruptcy Help                         
Dusty Jones                          Railroad Express                        
Larry Osmanova                       City Bus Transport                      
Richard Strehle                      Vacation Car Rentals                    
Brenda Kitchel                       Cheesman Corporation                    
Don Torres                           Down Deep Drilling Inc.                 
Richard Kluth                        Main St. Bar and Grill                  
Allen Robles                         Copy Center                             
Archie Doremski                      Greenpart Steet Metal                   
Daniel Ezra                          Pools For You                           

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Dean Katpally                        Phone Corporation                       
Randall Neely                        Store It Here                           
Mike Condie                          Kids Recreation Inc.                    
Tim Leffert                          Trailor Rentals                         
Carl Dallas                          Water Analysts                          
Dennis Sammons                       Gards Auto Repair                       
Mildred Jones                        Computer Consultants                    
Paul Kaakeh                          Laser Graphics Associates               
Kevin Zubarev                        Signs Signs Signs                       
Mary Uhl                             Flowers by Mickey                       
Jennifer Kmec                        Kelly Dance Studio                      

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Marjorie Vandermay                   National Art Museum                     
Stephanie Yeinick                    Tuckers Jewels                          
Cathy Harvey                         The Employment Agency                   
Geo Schofield                        Cleaning Supply                         
Kara Orze                            Appliances Inc.                         
Jeff Kowaiski                        Quality Equipment Corp.                 
Sharon Rouls                         Sharons Shamrock                        
Sherry Garling                       Manufactured Homes Corp.                
Mary Deets                           Camping Supplies                        
Dennis Drazer                        Financial Planning Consul               
Robert Lister                        Fire Alarm Systems                      

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Heather Waters                       Happytime Escort Service                
Anita Pastron                        Industrail Contracting Co               
Amy Heide                            Outlets                                 
Charlene Franks                      Rydell High School                      
Doug Blizzard                        Collectibles Inc.                       
Richard Scott                        Karate Made Easy                        
Scott Gray                           Security Installation                   
Randy Talauage                       Ceramic Supply                          
Daniel Hundnall                      Bobs Repair Service                     
Sally Valle                          Investment Specialties                  
Noemi Elston                         North Street Church                     

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Kelly Jordan                         Supplying Crafts                        
Steve Fulkerson                      Cellular Services                       
Orville Gilliland                    Easy Internet Access                    
Bridgette Kyger                      Sampson Home Mortgages                  
Norman Fields                        The Cable Company                       
Jessica Nakamura                     Automart                                
Jack Barrick                         First National Bank                     
Aricka Bross                         Apartment Referrals                     
John Day                             Purdue University                       
Shannon Jing                         Purdue University                       
Julia Rayz                           Purdue University                       

CUSTNAME                             COMPANYNAME                             
------------------------------------ ----------------------------------------
Jack Anderson                        University of Chicago                   
Kate Johnson                         Michigan University                     

79 rows selected. 


*/

--Question A5
INSERT INTO customer_all(customerid, custname, address, city, STATE, postalcode)
VALUES('C-001', 'John Doe', '401 N. Grant St.,', 'West Lafayette', 'IN', '47906');
--I am not able to add this customer Because customer_all is a view made from multiple tables. 

--Question A6
CREATE VIEW INDIANA_CUSTOMER
AS
SELECT * FROM CUSTOMER_NEW
WHERE STATE = 'IN';



--Question A7
INSERT INTO INDIANA_CUSTOMER(customerid, custname, address, city, STATE, postalcode)
VALUES('C-001', 'John Doe', '401 N. Grant St.,', 'West Lafayette', 'IN', '47906');
COMMIT;

SELECT * FROM INDIANA_CUSTOMER;
--I am able to add this customer because it is a single table view and because it has a unique primary key. 

--Question A8
DELETE FROM INDIANA_CUSTOMER
WHERE customerid = 'C-001';

--Checking removal
SELECT * FROM INDIANA_CUSTOMER;
/*

CUSTOMERID CUSTNAME                            COMPANYNAME                              CUSTT ADDRESS                                  CITY                 ST POSTALCODE FAX          PHONE        EMAILADDR                                         
---------- ----------------------------------- ---------------------------------------- ----- ---------------------------------------- -------------------- -- ---------- ------------ ------------ --------------------------------------------------
C-301      John Day                            Purdue University                        Mr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-2560 johnday@purdue.edu                                
C-302      Shannon Jing                        Purdue University                        Ms.   500 Oval Dr.                             Wset Lafayette       IN 47907                   765-588-7610 jing@purdue.edu                                   
C-303      Julia Rayz                          Purdue University                        Dr.   401 N. Grant St.                         West Lafayette       IN 47907                   765-494-9525 jtaylor1@purdue.edu                               
I-301      Shannon Jing                                                                 Ms.   500 Oval Dr.                             West Lafayette       IN 47907                   765-588-7610 tarokingu@gmail.com                               
I-304      Kate Sun                                                                     Ms.   405 Sagamore Pkwy S.                     Lafayette            IN 47904                                katesun@gmail.com                                 
*/
SELECT * FROM CUSTOMER_NEW WHERE CUSTOMERID = 'C-001';
/*
no rows selected
*/
--The customer does not exsist once deleted in my copy of the table. 
COMMIT;


--Question A9
DELETE FROM CUSTOMER_NEW;

select * from customer_new;
--There are no rows selected. 

ROLLBACK;
select * from customer_new;
--10 rows selected. 

--Explain the results:
/*Anything done to the database since the last commit can be reverted with a rollback. 
As seen here with deleting everything from customer_new then rolling back. */

--Question A10
TRUNCATE TABLE CUSTOMER_NEW;
SELECT * FROM Customer_New;
--no rows selected
ROLLBACK;
SELECT * FROM Customer_New;
--NO ROWS...Unlike deleting from a table and rollingback, you cannot rollback from a truncate. 


--Question A11
GRANT READ ON CUSTOMER_ALL TO CNIT372TA;
--Grant succeeded.

--Question A12
REVOKE READ ON CUSTOMER_ALL FROM CNIT372TA;
--Revoke succeeded.


--Question A13
Grant Select, Insert, Delete On Customer_All To CNIT372TA;



--Question A14
REVOKE SELECT, INSERT, DELETE ON CUSTOMER_ALL FROM CNIT372TA;



--Question A15
revoke read on customer_all from FISHL;
/*
revoke read on customer_all from FISHL
Error report -
ORA-01749: you may not GRANT/REVOKE privileges to/from yourself
01749. 00000 -  "you may not GRANT/REVOKE privileges to/from yourself"
*Cause:    
*Action:
*/

--Question A16
DROP TABLE CUSTOMER_NEW;
DROP VIEW CUSTOMER_NEW_VIEW;
DROP VIEW CUSTOMER_ALL;
DROP VIEW INDIANA_CUSTOMER;


--Question A17

CREATE OR REPLACE PROCEDURE HELLO_WORLD
AS
    V_OUTPUT VARCHAR2(35) := 'Hello World';
BEGIN
    DBMS_OUTPUT.PUT_LINE (V_OUTPUT);
END HELLO_WORLD;

/*
--
Priveledges that are required for another ser to execute the hello world procedure would
be an execute priveledge specifcially for that procedure. 
--
https://docs.oracle.com/database/121/TTSQL/privileges.htm#TTSQL343 
*/

--Question A18
GRANT EXECUTE ON HELLO_WORLD TO CNIT372TA;


--Question A19
REVOKE EXECUTE ON HELLO_WORLD FROM CNIT372TA;


--Question A20
DROP PROCEDURE HELLO_WORLD;

SELECT * FROM USER_TAB_PRIVS;
--The CNIT372A user does not retin execution permissions on Hello_World


--Question A21
GRANT EXECUTE ON NUMBER_OF_EMPLOYEES TO CNIT372TA;


--Question A22
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES 
RETURN NUMBER 
AS
    v_number_of_employees NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_number_of_employees
    FROM
        employee;

    RETURN v_number_of_employees;
END NUMBER_OF_EMPLOYEES;

SELECT * FROM USER_TAB_PRIVS;
--Yes the privledges are retained for number of employees. 

--Question A23
--Recreating or replacing a procedure does not remove permissions tied to it. 
--Permissions need to be handled if something is going to be changed.

