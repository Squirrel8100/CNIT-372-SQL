/*
Logan Fish
CNIT 372
Lab 1 Checkoff Questions 2,3,4,5,13,15,19
1/18/2022
*/
--Question 1: ORDER OF EXECUTION FOR THE QUERY BELOW
/*
1. SELECT NAME, COUNT(*), AVG(RATING)
2. FROM BOOKSHELF
3. WHERE RATING>1
4. GROUP BY CATEGORY_NAME
5. HAVING CATEGORY_NAME LIKE �A%�
6. ORDER BY COUNT(*);
*/
--ANSWER:
-- THE ORDER OF EXECUTION GOES (2. 3. 4. 5. 1. 6. ) (FROM, WHERE, GROUP BY, HAVING, SELECT, ORDER BY)
-- REFERENCE: https://www.sisense.com/blog/sql-query-order-of-operations/


--Question 2: Identify distinctly all telephone area codes (e.g., the first 3 digits of the phone number) of Colorado (state is �CO�) customers.
SELECT DISTINCT SUBSTR(PHONE,1,3), STATE
FROM CUSTOMER
WHERE STATE = 'CO';

/* Result of Q2
SUB ST
--- --
970 CO
719 CO
720 CO
644 CO
728 CO
*/

--QUESTION 3:Identify all telephone area codes of Colorado customers, as well as the number of
--customers in each area. Sort the results by the number of customers in descending order.
SELECT DISTINCT(SUBSTR(PHONE, 1, 3)) AS AREA, COUNT(SUBSTR(PHONE, 1, 3)) AS COUNT
FROM CUSTOMER
WHERE STATE = 'CO'
GROUP BY SUBSTR(PHONE, 1, 3)
ORDER BY COUNT DESC;
--RESULTS
/*
ARE      COUNT
--- ----------
719          4
970          2
644          1
720          1
728          1
*/

--QUESTION 4: Identify the specific telephone area code containing the largest number of Colorado customers. 
--Display the area code only. (DO NOT hardcode the area code)
SELECT DISTINCT(SUBSTR(PHONE,1,3)) AS AREA_CODE, COUNT(SUBSTR(PHONE,3,1)) AS COUNTER
FROM CUSTOMER
WHERE STATE = 'CO'
HAVING COUNT(SUBSTR(PHONE,3,1)) > (SELECT MIN(COUNT((SUBSTR(PHONE,3,1)))) from CUSTOMER GROUP BY SUBSTR(PHONE,1,3))
GROUP BY SUBSTR(PHONE,1,3)
FETCH FIRST ROW ONLY;


--RESULTS
/*
ARE    COUNTER
--- ----------
719          4

*/

--QUESTION 5: Identify all customers living in the most popular Colorado area code.
--Display their name in last name, (comma) first name format (e.g. Simpson, Lisa),
--the city and state in which they live, and their telephone number.
--(Hint: the code from the previous question is a good starting point for this question)
SELECT CUSTLASTNAME || ', ' || CUSTFIRSTNAME AS CUSTOMERNAME, CITY, STATE, PHONE
FROM CUSTOMER
WHERE STATE = 'CO' AND SUBSTR(PHONE, 1,3) = 719;
--RESULTS
/*
CUSTOMERNAME                          CITY                 ST PHONE       
------------------------------------- -------------------- -- ------------
Rodkey, Daniel                        Lamar                CO 719-748-3205
Kaakeh, Paul                          Gunnison             CO 719-750-4539
Smith, Matt                           Montrose             CO 719-822-8828
Rice, Paul                            Craig                CO 719-541-1837
*/




--Question 6:Briefly explain why might we want to know the results of question 4? 
--What business implications does it have?

/* Answer: A person would want to know what their most popular selling area is,
Knowing where a product is more often bought means if it is expanded or marketed more in the
area it will create more sales. 
*/


--Question 7: Identify the customer ID and number of orders placed by each customer 
--during August 2010 (OrderDate is August 2010).
--Sort the results by the number of orders in descending order.
SELECT CUSTOMERID, COUNT(ORDERID) AS ORDERS
FROM CUSTORDER
WHERE TO_CHAR(ORDERDATE, 'fmMonth YYYY') = 'August 2010'
GROUP BY CUSTOMERID
ORDER BY COUNT(ORDERID) DESC;
--RESULTS CUSTOMERS AND ORDER COUNT FOR AUGUST 2010. 
/*
CUSTOMERID     ORDERS
---------- ----------
C-300006            3
I-300016            2
C-300041            2
C-300031            2
I-300015            2
C-300055            2
I-300010            2
C-300005            2
C-300027            2
I-300014            2
I-300070            1

CUSTOMERID     ORDERS
---------- ----------
C-300017            1
I-300031            1
I-300126            1
C-300001            1
I-300091            1
I-300020            1
C-300011            1
I-300069            1
C-300033            1
I-300024            1
I-300117            1

CUSTOMERID     ORDERS
---------- ----------
C-300002            1
I-300132            1
I-300005            1
C-300010            1
I-300122            1
C-300013            1
C-300053            1
I-300068            1
C-300020            1
I-300096            1
I-300120            1

CUSTOMERID     ORDERS
---------- ----------
I-300112            1
I-300115            1
I-300076            1
C-300035            1
I-300012            1
I-300095            1
I-300017            1
I-300026            1
I-300042            1
I-300097            1
I-300093            1

CUSTOMERID     ORDERS
---------- ----------
I-300102            1
I-300007            1
I-300138            1
I-300043            1
I-300108            1
I-300044            1
I-300110            1
C-300051            1
I-300009            1
C-300004            1
C-300026            1

CUSTOMERID     ORDERS
---------- ----------
C-300003            1
I-300004            1
I-300025            1
I-300129            1
I-300002            1
I-300011            1
I-300081            1
I-300088            1
I-300013            1
I-300061            1
I-300018            1

66 rows selected. 
*/
--Question 8:Identify the maximum number of orders placed by a customer during August 2010.
--Display only the maximum number of orders.
SELECT CUSTOMERID, COUNT(ORDERID) AS ORDERS
FROM CUSTORDER
WHERE TO_CHAR(ORDERDATE, 'fmMonth YYYY') = 'August 2010'
GROUP BY CUSTOMERID
HAVING COUNT(ORDERID) > (SELECT MIN(COUNT(ORDERID)) from CUSTORDER GROUP BY CUSTOMERID)
ORDER BY COUNT(ORDERID) DESC;
--RESULTS
/*
CUSTOMERID     ORDERS
---------- ----------
C-300006            3
I-300016            2
C-300041            2
C-300031            2
I-300015            2
C-300055            2
I-300010            2
C-300005            2
C-300027            2
I-300014            2

10 rows selected. 
*/

--Question 9:Identify the customer ID of the customer who placed the largest number of orders
--during August 2010, as well as the number of orders placed.
--(Hint: the code from the previous questions is a good starting point for this question)
SELECT CUSTOMERID, COUNT(ORDERID) AS ORDERS
FROM CUSTORDER
WHERE TO_CHAR(ORDERDATE, 'fmMonth YYYY') = 'August 2010'
GROUP BY CUSTOMERID
HAVING COUNT(ORDERID) > (SELECT MIN(COUNT(ORDERID)) from CUSTORDER GROUP BY CUSTOMERID)
ORDER BY COUNT(ORDERID) DESC
FETCH FIRST ROW ONLY;
--RESULT
/*
CUSTOMERID     ORDERS
---------- ----------
C-300006            3
*/
--Question 10: Identify all customers who placed greater than the average number of orders 
--during August 2010.
--Display the customer ID and the number of orders each of these customers placed.
--Sort the results by number of orders in descending order.
SELECT CUSTOMERID, COUNT(ORDERID) AS ORDERS
FROM CUSTORDER 
WHERE TO_CHAR(ORDERDATE, 'fmMonth YYYY') = 'August 2010'
GROUP BY CUSTOMERID
HAVING COUNT(ORDERID) > (SELECT AVG(COUNT(ORDERID)) FROM CUSTORDER GROUP BY CUSTOMERID)
ORDER BY COUNT(ORDERID) DESC;
/*
NO ROWS SELECTED
*/
--IDK IF THATS CORRECT OR NOT, BUT IT SHOULD BE TAKING THE COUNT THAT IS GREATER THAN THE AVERAGE AND DISPLAYING IT.
-- TRIED TO MANY THINGS WITHOUT ANY GOOD RESULT. 


--Question 11: Identify all customers who placed fewer than the average number of orders 
--during August 2010.
--Display the customer ID and the number of orders each of these customers placed.
--Sort the results by number of orders in ascending order.
SELECT CUSTOMERID, COUNT(ORDERID) AS ORDERS
FROM CUSTORDER
WHERE TO_CHAR(ORDERDATE, 'fmMonth YYYY') = 'August 2010'
GROUP BY CUSTOMERID
HAVING COUNT(ORDERID) < (SELECT AVG(COUNT(ORDERID)) from CUSTORDER group by customerid)
ORDER BY COUNT(ORDERID) ASC;
--RESULTS
/*
CUSTOMERID     ORDERS
---------- ----------
I-300070            1
C-300017            1
I-300031            1
I-300126            1
C-300001            1
I-300091            1
I-300020            1
C-300011            1
I-300069            1
C-300033            1
I-300024            1

CUSTOMERID     ORDERS
---------- ----------
I-300117            1
C-300002            1
I-300132            1
I-300005            1
C-300010            1
I-300122            1
C-300013            1
C-300053            1
I-300068            1
C-300020            1
I-300096            1

CUSTOMERID     ORDERS
---------- ----------
I-300120            1
I-300112            1
I-300115            1
I-300076            1
C-300035            1
I-300012            1
I-300095            1
I-300017            1
I-300026            1
I-300042            1
I-300097            1

CUSTOMERID     ORDERS
---------- ----------
I-300093            1
I-300102            1
I-300007            1
I-300138            1
I-300043            1
I-300108            1
I-300044            1
I-300110            1
C-300051            1
I-300009            1
C-300004            1

CUSTOMERID     ORDERS
---------- ----------
C-300026            1
C-300003            1
I-300004            1
I-300025            1
I-300129            1
I-300002            1
I-300011            1
I-300081            1
I-300088            1
I-300013            1
I-300061            1

CUSTOMERID     ORDERS
---------- ----------
I-300018            1
C-300055            2
I-300016            2
C-300041            2
C-300031            2
C-300027            2
I-300014            2
I-300010            2
C-300005            2
I-300015            2
C-300006            3

66 rows selected. 
*/


--Question 12:Briefly explain why a business might want to know the results of questions 10 & 11?
--Please include the answer using SQL comments in your submission.
/*
--A buisness would want to know the results of questions 10 and 11 because Knowing the customers who buy more frequently
--than the average customer will show that these people are loyal and frequent customers.
--One would also want to know the results of 11 where knowing the results of those who are less then frequent buyers to the buisness.
--Knowing these customers the buisness could actively seek to introduce targeted fliers or discounts to these people to bring them back
-- and potentially create frequent consumers out of them. 
*/

--QUESTION 13: Display the customer ID, company name, contact name in last name, (comma) first
-- name format, (e.g. Simpson, Lisa), and order date in 
--MM.DD.YYYY format (e.g. 12.30.2010) for all Indiana customers who placed orders in 2010.
--Sort the results by order date from the oldest to the most recent.
SELECT CUST.CUSTOMERID, CUST.COMPANYNAME, CUST.CUSTLASTNAME || ', ' || CUST.CUSTFIRSTNAME AS CONTACTNAME, TO_CHAR(CUSTORD.ORDERDATE, 'MM.DD.YYYY') AS ORDERDATE 
FROM CUSTOMER CUST INNER JOIN CUSTORDER CUSTORD
ON CUST.CUSTOMERID = CUSTORD.CUSTOMERID
WHERE TO_CHAR(CUSTORD.ORDERDATE, 'fmYYYY') = '2010' AND STATE = 'IN';

--RESULTS
/*
CUSTOMERID COMPANYNAME                              CONTACTNAME                           ORDERDATE 
---------- ---------------------------------------- ------------------------------------- ----------
C-300001   Baker and Company                        Abbott, Gregory                       07.08.2010
C-300001   Baker and Company                        Abbott, Gregory                       07.14.2010
C-300001   Baker and Company                        Abbott, Gregory                       08.13.2010
I-300030                                            Quintero, Eric                        09.15.2010
C-300014   R and R Air                              Bending, Cathy                        10.04.2010
C-300001   Baker and Company                        Abbott, Gregory                       12.02.2010
I-300147                                            Yaun, Steven                          12.07.2010

7 rows selected. 
*/

--Question 14: Display the company name, 
--contact name in title first Initial (dot) last name format e.g. Ms. L. Simpson), 
--order date, and required date for all orders placed by customer with ID C-300001.
--Sort the results by order date from the oldest to the most recent.
SELECT CUST.COMPANYNAME, CUST.CUSTTITLE || ' ' || SUBSTR(CUST.CUSTLASTNAME,1,1) || '. ' || CUST.CUSTFIRSTNAME AS CONTACTNAME, CUSTORD.ORDERDATE
FROM CUSTOMER CUST INNER JOIN CUSTORDER CUSTORD
ON CUST.CUSTOMERID = CUSTORD.CUSTOMERID
WHERE CUST.CUSTOMERID = 'C-300001'
ORDER BY CUSTORD.ORDERDATE ASC;
/*
COMPANYNAME                              CONTACTNAME              ORDERDATE
---------------------------------------- ------------------------ ---------
Baker and Company                        Mr. A. Gregory           08-JUL-10
Baker and Company                        Mr. A. Gregory           14-JUL-10
Baker and Company                        Mr. A. Gregory           13-AUG-10
Baker and Company                        Mr. A. Gregory           02-DEC-10
Baker and Company                        Mr. A. Gregory           27-JAN-11
Baker and Company                        Mr. A. Gregory           24-FEB-11
Baker and Company                        Mr. A. Gregory           10-MAR-11

7 rows selected. 
*/


--QUESTION 15: For all orders containing �BOARD GAMES� software, display the order ID, part number,
--part description, unit price, order quantity, and category name.
--Sort the results by order quantity in descending order.
--JOIN SHIPPEDITEM, CUSTORDERLINE, INVENTORYPART
--SHIPPEDITEM(ORDERID,PARTNUMBER)CUSTORDERLINE(UNITPRICE, ORDERQUANTITY)INVENTORYPART(PARTDESCRIPTION) CATEGORY(CATEGORYNAME)
SELECT SHIPITEM.ORDERID,SHIPITEM.PARTNUMBER, INVENPART.PARTDESCRIPTION, CUSTOLINE.UNITPRICE, SHIPITEM.QUANTITYSHIPPED, CAT.CATEGORYNAME 
FROM SHIPPEDITEM SHIPITEM INNER JOIN CUSTORDERLINE CUSTOLINE
ON SHIPITEM.ORDERID = CUSTOLINE.ORDERID
AND SHIPITEM.PARTNUMBER = CUSTOLINE.PARTNUMBER
INNER JOIN INVENTORYPART INVENPART
ON CUSTOLINE.PARTNUMBER = INVENPART.PARTNUMBER
INNER JOIN CATEGORY CAT
ON CAT.CATEGORYID = INVENPART.CATEGORYID
WHERE INVENPART.PARTDESCRIPTION = 'BOARD GAMES'
ORDER BY SHIPITEM.QUANTITYSHIPPED DESC;
--RESULTS
/*
ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE QUANTITYSHIPPED CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- --------------- ------------------------------
2001000536 SFT-005    BOARD GAMES                                              9.99              15 Software                      
2000000050 SFT-005    BOARD GAMES                                              9.99              14 Software                      
2000000279 SFT-005    BOARD GAMES                                              9.99              10 Software                      
2000000426 SFT-005    BOARD GAMES                                              9.99              10 Software                      
2000000348 SFT-005    BOARD GAMES                                              9.99               2 Software                      
2000000139 SFT-005    BOARD GAMES                                              9.99               2 Software                      
2001000722 SFT-005    BOARD GAMES                                              9.99               1 Software                      
2000000011 SFT-005    BOARD GAMES                                              9.99               1 Software                      
2001000600 SFT-005    BOARD GAMES                                              9.99               1 Software                      
2000000436 SFT-005    BOARD GAMES                                              9.99               1 Software                      
2000000040 SFT-005    BOARD GAMES                                              9.99               1 Software                      

ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE QUANTITYSHIPPED CATEGORYNAME                  
---------- ---------- -------------------------------------------------- ---------- --------------- ------------------------------
2000000206 SFT-005    BOARD GAMES                                              9.99               1 Software                      
2000000005 SFT-005    BOARD GAMES                                              9.99               1 Software                      
2000000362 SFT-005    BOARD GAMES                                              9.99               1 Software                      

14 rows selected. 
*/

--Question 16
--For all items ordered by customer ID C-300001 on July 14t, 2010, display the orderID, 
--part number, part description, unit price, and order quantity.
--Sort the results by order quantity from largest to smallest.

SELECT CUSTO.ORDERID, CUSTORDLINE.PARTNUMBER, INVENPART.PARTDESCRIPTION, CUSTORDLINE.UNITPRICE, CUSTORDLINE.ORDERQUANTITY
FROM CUSTOMER CUST INNER JOIN CUSTORDER CUSTO
ON CUST.CUSTOMERID = CUSTO.CUSTOMERID
INNER JOIN CUSTORDERLINE CUSTORDLINE
ON CUSTO.ORDERID = CUSTORDLINE.ORDERID
INNER JOIN INVENTORYPART INVENPART
ON INVENPART.PARTNUMBER = CUSTORDLINE.PARTNUMBER
WHERE CUST.CUSTOMERID = 'C-300001' AND TO_CHAR(CUSTO.ORDERDATE, 'fmMonth DD YYYY') = 'July 14 2010'
ORDER BY CUSTORDLINE.ORDERQUANTITY DESC;
--results
/*
ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY
---------- ---------- -------------------------------------------------- ---------- -------------
2000000032 BRK-011    2ND PARALLEL PORT                                        5.99            20
2000000032 CTR-019    FLY XPST                                              1717.99             9
2000000032 ADT-003    EXTERNAL SCSI-3 MALE TERMINATOR                         39.99             8
2000000032 CAB-027    2FT 3/1 SCSI CABLE                                      44.99             6
2000000032 SCN-002    SCANJET BUSINESS SERIES COLOR SCANNER                     249             4

*/


--Question 17 For all items ordered by Bankruptcy Help (company name) during 2011, 
--display the order date in MM.DD.YYYY format (e.g. 12.30.2010), order ID, part number, part description, unit price, and order quantity.
--Sort the results first by order date, with the most recent displayed first. Then within a given date, sort by quantity, with the greatest displayed first.
SELECT TO_CHAR(CUSTO.ORDERDATE, 'fmMM.DD.YYYY'), CUSTO.ORDERID, CUSTORDLINE.PARTNUMBER, INVENPART.PARTDESCRIPTION, CUSTORDLINE.UNITPRICE, CUSTORDLINE.ORDERQUANTITY
FROM CUSTOMER CUST INNER JOIN CUSTORDER CUSTO
ON CUST.CUSTOMERID = CUSTO.CUSTOMERID
INNER JOIN CUSTORDERLINE CUSTORDLINE
ON CUSTO.ORDERID = CUSTORDLINE.ORDERID
INNER JOIN INVENTORYPART INVENPART
ON INVENPART.PARTNUMBER = CUSTORDLINE.PARTNUMBER
WHERE CUST.COMPANYNAME = 'Bankruptcy Help' AND TO_CHAR(CUSTO.ORDERDATE, 'fmYYYY') = '2011'
ORDER BY CUSTO.ORDERDATE DESC, CUSTORDLINE.ORDERQUANTITY DESC ;
/*
TO_CHAR(CU ORDERID    PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY
---------- ---------- ---------- -------------------------------------------------- ---------- -------------
3.22.2011  2001000778 BRK-002    1X4 USB CABLE AND BRACKET                                9.99            20
3.22.2011  2001000778 MEM-004    30.7GB HARD DRIVE                                      269.99            10
3.22.2011  2001000778 P-006      600 PENTIUM III PROCESSOR                              339.99             6
2.28.2011  2001000699 MOD-002    112K DUAL MODEM                                         89.99            16
2.28.2011  2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                259.95            12
2.28.2011  2001000699 PRT-003    LASER JET 2500SE                                          699             3
2.24.2011  2001000676 MIC-009    WHEEL MOUSE                                              29.5            27
2.14.2011  2001000622 BB-004     SOCKET MINI BAREBONE                                   199.99             6
2.14.2011  2001000622 P-005      700 PENTIUM III PROCESSOR                              399.99             4

9 rows selected. 
*/
--Question 18
--For all items ordered by Bankruptcy Help (company name) during 2011, display the order date in MM.DD.YYYY format (e.g. 12.30.2010), order ID, part number, and part description. 
--In addition, calculate and display the line item total for each item. To calculate the line item total, multiply the unit price by the number of units ordered.
--Sort the results first by order date, with the most recent displayed first. Then within a given date, sort by quantity, with the greatest displayed first.
--(Hint: modify your code from question 17)
SELECT TO_CHAR(CUSTO.ORDERDATE, 'fmMM.DD.YYYY'), CUSTO.ORDERID, CUSTORDLINE.PARTNUMBER, INVENPART.PARTDESCRIPTION, 
(CUSTORDLINE.UNITPRICE * CUSTORDLINE.ORDERQUANTITY) AS LINE_ITEM_TOTAL
FROM CUSTOMER CUST INNER JOIN CUSTORDER CUSTO
ON CUST.CUSTOMERID = CUSTO.CUSTOMERID
INNER JOIN CUSTORDERLINE CUSTORDLINE
ON CUSTO.ORDERID = CUSTORDLINE.ORDERID
INNER JOIN INVENTORYPART INVENPART
ON INVENPART.PARTNUMBER = CUSTORDLINE.PARTNUMBER
WHERE CUST.COMPANYNAME = 'Bankruptcy Help' AND TO_CHAR(CUSTO.ORDERDATE, 'fmYYYY') = '2011'
ORDER BY CUSTO.ORDERDATE DESC, CUSTORDLINE.ORDERQUANTITY DESC ;
--RESULTS
/*
TO_CHAR(CU ORDERID    PARTNUMBER PARTDESCRIPTION                                    LINE_ITEM_TOTAL
---------- ---------- ---------- -------------------------------------------------- ---------------
3.22.2011  2001000778 BRK-002    1X4 USB CABLE AND BRACKET                                    199.8
3.22.2011  2001000778 MEM-004    30.7GB HARD DRIVE                                           2699.9
3.22.2011  2001000778 P-006      600 PENTIUM III PROCESSOR                                  2039.94
2.28.2011  2001000699 MOD-002    112K DUAL MODEM                                            1439.84
2.28.2011  2001000699 MEM-001    2MB FLASH BUFFER MEMORY                                     3119.4
2.28.2011  2001000699 PRT-003    LASER JET 2500SE                                              2097
2.24.2011  2001000676 MIC-009    WHEEL MOUSE                                                  796.5
2.14.2011  2001000622 BB-004     SOCKET MINI BAREBONE                                       1199.94
2.14.2011  2001000622 P-005      700 PENTIUM III PROCESSOR                                  1599.96

9 rows selected. 
*/




--QUESTION 19:Display the customer ID, company name, 
--contact name in last name, (comma) firstname format (e.g. Simpson, Lisa), and number of orders placed (NOT order quantity) for
--all Indiana customers who placed orders in January of 2011.
--Sort the results by numbers of orders placed in ascending order.
SELECT CUST.CUSTOMERID, CUST.COMPANYNAME, CUST.CUSTLASTNAME || ', ' || CUST.CUSTFIRSTNAME AS CONTACTNAME, COUNT(CUST.CUSTOMERID) AS ORDERCOUNT
FROM CUSTOMER CUST INNER JOIN CUSTORDER CUSTORD
ON CUST.CUSTOMERID = CUSTORD.CUSTOMERID
WHERE TO_CHAR(CUSTORD.ORDERDATE, 'fmYYYY') = '2011' AND CUST.STATE = 'IN'
GROUP BY CUST.CUSTOMERID, CUST.COMPANYNAME, CUST.CUSTLASTNAME || ', ' || CUST.CUSTFIRSTNAME
ORDER BY COUNT(CUST.CUSTOMERID) ASC;
--RESULTS
/*
CUSTOMERID COMPANYNAME                              CONTACTNAME                           ORDERCOUNT
---------- ---------------------------------------- ------------------------------------- ----------
I-300030                                            Quintero, Eric                                 2
I-300147                                            Yaun, Steven                                   3
C-300014   R and R Air                              Bending, Cathy                                 3
C-300001   Baker and Company                        Abbott, Gregory                                3
*/



--Question 20 Display the category name and the average stock level of each category. 
--Display up to 2 decimal places for the average stock level.
--Sort the results by average stock level in ascending order.
SELECT categoryid, ROUND(AVG(stocklevel),2) AS AVERAGE_STOCK_LEVEL
FROM CATEGORY
NATURAL JOIN INVENTORYPART
GROUP BY CATEGORYID
ORDER BY AVG(STOCKLEVEL) ASC;
/*
CATEGORYID AVERAGE_STOCK_LEVEL
---------- -------------------
COMP                      2.45
ACCESS                    9.21
POW                       10.5
STOR                     20.47
BASE                      20.5
PROC                     23.74
SOFT                     33.89
CAB                      35.86

8 rows selected. 
*/




--Question 21 Display the category detail and the number of part types in each category (NOT stock level).
--A category detail consists of category name and category description, and it is formatted as category name: (colon) description (e.g. Software: Games, maps).
--Sort the results by number of part types in ascending order.
SELECT CATEGORYNAME || ', ' || DESCRIPTION AS CATEGORY_DETAIL, COUNT(PARTNUMBER) AS COUNT_OF_PART_TYPES
FROM CATEGORY
NATURAL JOIN INVENTORYPART
GROUP BY CATEGORYNAME || ', ' || DESCRIPTION
ORDER BY COUNT(PARTNUMBER) ASC;
/*
CATEGORY_DETAIL                                                                                                                      COUNT_OF_PART_TYPES
------------------------------------------------------------------------------------------------------------------------------------ -------------------
Power, Power Supplies                                                                                                                                  4
Software, Games, maps                                                                                                                                  9
Accessories, Scanners, Printers, Modems                                                                                                               14
Processors, Athlon, Celeron, Pentium, Fans                                                                                                            19
Storage, CD-ROM, DVD, Hard Drives, Memory                                                                                                             19
Computers, Assembled Computers                                                                                                                        29
Cables, Printer, Keyboard, Internal, SCSI, Connectors, Brackets                                                                                       36
Basics, Casing, Barebone, Monitors, Keyboards, Mice                                                                                                   44

8 rows selected. 
*/


--Question 22 Display the weight of the heaviest part in the Software category (CategoryName is �Software�).
SELECT MAX(WEIGHT) AS HEAVIEST_PART
FROM INVENTORYPART
NATURAL JOIN CATEGORY
WHERE CATEGORYNAME = 'Software';
--RESULTS
/*
HEAVIEST_PART
-------------
         .438
*/


--Question 23 For each of the Power, Software, and Storage category, display the category name and the weight of the heaviest part in the category.
--Sort the results by category name in ascending order.
--(Hint: the code from the previous question is a good starting point for this question)
SELECT CATEGORYNAME, MAX(WEIGHT) AS HEAVIEST_PART
FROM INVENTORYPART
NATURAL JOIN CATEGORY
WHERE CATEGORYNAME = 'Power' OR CATEGORYNAME = 'Software' OR CATEGORYNAME = 'Storage'
GROUP BY CATEGORYNAME
ORDER BY CATEGORYNAME ASC;
--RESULT
/*
CATEGORYNAME                   HEAVIEST_PART
------------------------------ -------------
Power                                      3
Software                                .438
Storage                                    4
*/





--Question 24 For each of the Power, Software, and Storage category, display the category name, the weight of the heaviest part in the category, and the corresponding part description(s) of the heaviest part(s).
--Sort the results by category name in ascending order.
--(Hint: the code from the previous question is a good starting point for this question)
SELECT CATEGORYNAME, MAX(WEIGHT) AS HEAVIEST_PART, PARTDESCRIPTION
FROM INVENTORYPART
NATURAL JOIN CATEGORY
WHERE CATEGORYNAME = 'Power' OR CATEGORYNAME = 'Software' OR CATEGORYNAME = 'Storage'
GROUP BY CATEGORYNAME, PARTDESCRIPTION
ORDER BY CATEGORYNAME ASC;
/*
CATEGORYNAME                   HEAVIEST_PART PARTDESCRIPTION                                   
------------------------------ ------------- --------------------------------------------------
Power                                      3 250 WATT POWER SUPPLY                             
Power                                      2 250 WATT PS/2 POWER SUPPLY                        
Power                                      3 300 WATT POWER SUPPLY                             
Power                                      2 300 WATT PS/2 POWER SUPPLY                        
Software                                 .25 1000 BEST GAMES                                   
Software                                .438 BOARD GAMES                                       
Software                                .313 CARD GAMES                                        
Software                                 .25 CLIPART AND FONTS DELUXE                          
Software                                .438 DESKTOP PUBLISHER                                 
Software                                .313 HOME AND GARDEN                                   
Software                                .375 SCREEN SAVER                                      

CATEGORYNAME                   HEAVIEST_PART PARTDESCRIPTION                                   
------------------------------ ------------- --------------------------------------------------
Software                                .188 STREET MAPS USA                                   
Software                                .375 TRAVEL MAPS USA                                   
Storage                                    2 10.2GB HARD DRIVE                                 
Storage                                  1.5 10X DVD DRIVE                                     
Storage                                  2.5 13GB HARD DRIVE                                   
Storage                                 2.75 20GB HARD DRIVE                                   
Storage                                   .5 2MB FLASH BUFFER MEMORY                           
Storage                                  1.5 2TB EXTERNAL DRIVE                                
Storage                                    3 30.7GB HARD DRIVE                                 
Storage                                  1.5 32 MB MEMORY                                      
Storage                                 1.75 4.3GB HARD DRIVE                                  

CATEGORYNAME                   HEAVIEST_PART PARTDESCRIPTION                                   
------------------------------ ------------- --------------------------------------------------
Storage                                    1 48X CD-ROM IDE                                    
Storage                                    1 48XCD-ROM DRIVE                                   
Storage                                    1 4GB MICROSD CARD                                  
Storage                                    1 4X36-60 72 PIM MEMORY                             
Storage                                    1 4X4X24 CDRW                                       
Storage                                  1.5 6X DVD-ROM KIT                                    
Storage                                 1.75 8.4GB HARD DRIVE                                  
Storage                                 1.25 8GB MICROSD CARD                                  
Storage                                  1.5 8X4X32 CDRW                                       
Storage                                    4 ETHERNET FIBER OPTIC MINI-TRANSCEIVER             

32 rows selected. 
*/


--Question 25 Is there anything that can be changed to make it run faster? If no, why? If yes, how?
--Please include the answer using SQL comments in your submission.
--(This is an optional question worthy of 0.5 bonus point.)
--Answer: The best way to make a query to run faster would be to reduce the amount of processing that needs to take place
--by reducing the amount of columns being pulled, reducing the amount of tables needing used, and simplifying the query to
--only perform specific and less complicated joins, and performing aggregations using only specificlly needed rows. 




