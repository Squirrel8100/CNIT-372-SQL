/*
Logan Fish
CNIT 372
Lab 2
1/30/2022
*/
-- Question 1: 
/*
For each part in the Accessories category (CategoryID is ‘ACCESS’) of the INVENTORYPART table, display its part number, part description, and the average quantity sold (OrderQuantity) of all orders placed for that part.
Round the average to 1 decimal place.
Sort the results by average quantity in descending order.
*/
SELECT PARTNUMBER, PARTDESCRIPTION, ROUND(AVG(ORDERQUANTITY),1) AS AVERAGE_QUANTITY_SOLD
FROM INVENTORYPART
NATURAL JOIN CUSTORDERLINE
WHERE CATEGORYID = 'ACCESS'
GROUP BY PARTNUMBER, PARTDESCRIPTION
ORDER BY AVG(ORDERQUANTITY) DESC;
/*
PARTNUMBER PARTDESCRIPTION                                    AVERAGE_QUANTITY_SOLD
---------- -------------------------------------------------- ---------------------
MOD-001    PCI DATA/FAX/VOICE MODEM                                             8.3
MOD-002    112K DUAL MODEM                                                      5.1
PRT-006    SINGLEHEAD THERMAL INKJET PRINTER                                    3.8
PRT-004    3-IN-1 COLOR INKJET PRINTER                                          3.6
SCN-002    SCANJET BUSINESS SERIES COLOR SCANNER                                3.5
PRT-003    LASER JET 2500SE                                                     3.4
MOD-005    V.90/K56 FLEX 56K FAX MODEM                                          3.1
PRT-001    LASER JET 1999SE                                                     2.9
MOD-003    PCI MODEM                                                            2.4
PRT-002    LASER JET 2000SE                                                     2.3
SCN-001    SCANJET CSE COLOR SCANNER                                            1.8

PARTNUMBER PARTDESCRIPTION                                    AVERAGE_QUANTITY_SOLD
---------- -------------------------------------------------- ---------------------
MOD-004    PCI V.90 DATA/FAX/VOICE MODEM                                        1.6

12 rows selected. 
*/



--Question 2a:
/*
For each month in which part ‘DVD-001’ was ordered, display its order month, order year, and the average quantity (OrderQuantity) sold during that month.
Round the quantity to 1 decimal place.
Sort the results first by year, then month.
*/
SELECT DISTINCT TO_CHAR(ORDERDATE, 'fmMonth') AS MONTH, TO_CHAR(ORDERDATE, 'fmYYYY') AS YEAR, ROUND(AVG(ORDERQUANTITY),1) AS AVERAGE_QUANTITY
FROM CUSTORDERLINE
NATURAL JOIN CUSTORDER
WHERE PARTNUMBER = 'DVD-001'
GROUP BY ORDERDATE
ORDER BY TO_CHAR(ORDERDATE, 'fmYYYY'), TO_CHAR(ORDERDATE, 'fmMonth');
--RESULTS 
/* 
MONTH     YEAR AVERAGE_QUANTITY
--------- ---- ----------------
December  2010                1
July      2010                1
July      2010                2
November  2010                1
November  2010                3
October   2010                1
September 2010                1
September 2010               10
February  2011                1
February  2011               15
January   2011                1

MONTH     YEAR AVERAGE_QUANTITY
--------- ---- ----------------
March     2011                1

12 rows selected. 
*/
--Question 2b
/*
Based on the results of question 2a above, briefly explain how the average OrderQuantity changed over the months.

Answer: The average order quantity started out as a single quantity 
The typical month has about an average of round 1 to 4, the months of september in 2010 has about 11 and february in 2011 had 16.
*/
--Question 3a:
/*
For each month in which part ‘DVD-001’ was ordered, 
display its order month and year (as one column, in the format of ‘01-2022’), 
and the total quantity (OrderQuantity) sold during that month. 
Round the quantity to 1 decimal place.
*/

SELECT TO_CHAR(custorder.orderdate, 'fmMm-YYYY') AS ORDER_DATE,  ROUND(SUM(custorderline.orderquantity),1) AS TOTAL_QUANTITY
FROM CUSTORDERLINE INNER JOIN CUSTORDER
ON CUSTORDER.ORDERID = CUSTORDERLINE.ORDERID
WHERE PARTNUMBER = 'DVD-001'
GROUP BY custorder.orderdate;

/*
ORDER_D TOTAL_QUANTITY
------- --------------
9-2010              10
10-2010              1
11-2010              1
1-2011               1
2-2011              15
9-2010               1
12-2010              1
3-2011               1
7-2010               2
9-2010               1
12-2010              1

ORDER_D TOTAL_QUANTITY
------- --------------
11-2010              3
12-2010              1
2-2011               1
7-2010               1

15 rows selected. 
*/

--Question 3B:
/*
Do the same as 3a, in addition, sort the results by chronological order. (e.g., …11-2010, 12-2010, 01-2011…)
*/
SELECT  TO_CHAR(custorder.orderdate, 'fmMm-YYYY') AS ORDER_DATE, ROUND(SUM(custorderline.orderquantity),1) AS TOTAL_QUANTITY
FROM CUSTORDERLINE INNER JOIN CUSTORDER
ON CUSTORDER.ORDERID = CUSTORDERLINE.ORDERID
WHERE PARTNUMBER = 'DVD-001'
GROUP BY custorder.orderdate
ORDER BY custorder.orderdate ASC ;
--RESULTS (MIGHT NEED CLEANED UP) 
/*
ORDER_D TOTAL_QUANTITY
------- --------------
7-2010               2
7-2010               1
9-2010              10
9-2010               1
9-2010               1
10-2010              1
11-2010              1
11-2010              3
12-2010              1
12-2010              1
12-2010              1

ORDER_D TOTAL_QUANTITY
------- --------------
1-2011               1
2-2011               1
2-2011              15
3-2011               1

15 rows selected. 
*/
--Question 3c
/*
Based on the results of question 3b above, 
briefly explain how you would plan the procurement of part ‘DVD-001’ 
for the rest months of 2011?

Answer: For the months of 2011 I would base the need of the part 'DVD-001' on the previous years purchase sales. 
This part seems to sell in larger quantities every couple of months, so having a minimum of stock available for the lower 
amount purchases would be fine, and whenever there is a need to for a customer to purchase more than a couple the item can be specially ordered
in a higher amount or predicted when purchases are higher and stocked up before a large purchase. 
*/

--Question 4
/*
For each month in which part ‘DVD-001’ was ordered, display its order month, order year, and the number of orders placed during that month.
Sort the results first by year, then month.
*/
SELECT DISTINCT TO_CHAR(ORDERDATE, 'fmMonth') AS MONTH,  TO_CHAR(ORDERDATE, 'fmYYYY') AS YEAR, COUNT(*) AS ORDERS
FROM CUSTORDERLINE
NATURAL JOIN CUSTORDER
WHERE PARTNUMBER = 'DVD-001'
GROUP BY TO_CHAR(ORDERDATE, 'fmMonth'), TO_CHAR(ORDERDATE, 'fmYYYY')
ORDER BY TO_CHAR(ORDERDATE, 'fmYYYY'), TO_CHAR(ORDERDATE, 'fmMonth');
/*
MONTH     YEAR     ORDERS
--------- ---- ----------
December  2010          3
July      2010          2
November  2010          2
October   2010          1
September 2010          3
February  2011          2
January   2011          1
March     2011          1

8 rows selected. 
*/
--Question 5a
/*
Explain the relationship between questions 2, 3, 4. 
What is the shared, underlying question that each is attempting, at least in part, to answer?

Answer: The realtionship between question 2,3 and 4 is that we are looking at how often and by how much an item is ordered per month. 
In question 2 The average amount of orders for a specific Item is being calculated to see what is normal for that month. 
Then in  question 3 the amount of that specific item being ordered per month is found, and in question 4 the amount of orders per month that contain this specific item. 
Knowing the average sell of an item per month, how much of it is being sold per month, and the amount of orders per month that contain this item can allow the seller
to understand how frequently an item is selling, the amount of orders, and the normal values. 
*/
--Question 5b
/*
Based on the answers to questions 2, 3, 4, what can we determine about the sales of part ‘DVD-001’?

Answer: The results show that certain months are lacking any orders at all containing the dvd-001 part. Within the months that do have orders these orders tend to 
have either a single need for the dvd-001 part or they have a need for a multitude. Question 2 showing the averages of the quantities per month demonstrates the fluctuating need for 
a large amount or a small amount by month. 
*/
--Question 5a:
/*
Do the answers to question 2, 3, 4 support or conflict with each other? Does this
increase or decrease our confidence in the results?

Answer: The answers to question 2,3, and 4 supports the idea and does not really conflict with it. There are a couple
of sales that contradict the theory that majority of the sales being either large orders or single unit purchases, being orders
with a couple of the same dvd but not an obsessive amount. However, These are less compared to the single item orders and the bulk orders. 
*/

--Question 6a:
/*
For order ID ‘2000000007’, display the order ID, shipment ID(s), package numbers, and
shipped date. Also include the name of the person (ShipName) and the shipping
address (ShipAddress) to which each shipment has been sent.
*/
SELECT ORDERID, SHIPMENTID, PACKAGENUMBER, SHIPPEDDATE, SHIPNAME, SHIPADDRESS
FROM PACKINGSLIP
NATURAL JOIN SHIPMENT
WHERE ORDERID = '2000000007';
--RESULTS
/*
ORDERID    SHIPMENTID PACKAGENUMBER SHIPPEDDA SHIPNAME             SHIPADDRESS                             
---------- ---------- ------------- --------- -------------------- ----------------------------------------
2000000007 H003                   1 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   2 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       
2000000007 H003                   3 05-JUL-10 Evelyn Cassens       6094 Pearson Ave.                       

*/
--Question 6b:Explain the results of question 6a. 
/*
Answer:There are three packages that are part of the order with the orderid of '2000000007'. 
This order was split into three different packages all to the same place and shipped on the same date. 
*/

--Question 7a:
/*
Find the residential customers (whose company name is null) from Pennsylvania (state
is ‘PA’) and all orders they have placed. 
Display their names in last name, (comma) first name format (e.g. Simpson, Lisa), customer ID, and order ID. 
Using a left outer join for this question.
NOTE: Your results should include all Pennsylvania residential customers even if they
have not placed an order.
*/

SELECT CUST.CUSTLASTNAME || ', ' || CUST.CUSTFIRSTNAME AS CUSTOMER_NAME, CUST.CUSTOMERID, CUSTORD.ORDERID
FROM CUSTOMER CUST LEFT JOIN CUSTORDER CUSTORD
ON CUST.CUSTOMERID = CUSTORD.CUSTOMERID
WHERE STATE = 'PA' AND COMPANYNAME IS NULL;
--RESULTS
/*
CUSTOMER_NAME                         CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Kaleta, Don                           I-300028             
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000751
Wolfe, Thomas                         I-300149   2001000768
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000736

6 rows selected. */

--Question 7b:
/*
Find the residential customers (whose company name is null) from Pennsylvania (state
is ‘PA’) and all orders they have placed. Display their names in last name, (comma) first
name format (e.g. Simpson, Lisa), customer ID, and order ID. Using a right outer join
for this question.
NOTE: Your results should include all Pennsylvania residential customers even if they
have not placed an order.
*/
SELECT CUST.CUSTLASTNAME || ', ' || CUST.CUSTFIRSTNAME AS CUSTOMER_NAME, CUST.CUSTOMERID, CUSTORD.ORDERID
FROM CUSTOMER CUST RIGHT JOIN CUSTORDER CUSTORD
ON CUST.CUSTOMERID = CUSTORD.CUSTOMERID
WHERE STATE = 'PA' AND COMPANYNAME IS NULL;
--RESULTS
/*
CUSTOMER_NAME                         CUSTOMERID ORDERID   
------------------------------------- ---------- ----------
Wolfe, Thomas                         I-300149   2001000768
Wolfe, Thomas                         I-300149   2000000497
Wolfe, Thomas                         I-300149   2001000670
Wolfe, Thomas                         I-300149   2001000736
Wolfe, Thomas                         I-300149   2001000751

*/
--Question 8:
/*
Display the part number and category name for all parts and all categories in the
INVENTORYPART and CATEGORY tables regardless of any missing information.
*/
SELECT PARTNUMBER, CATEGORYNAME
FROM INVENTORYPART
NATURAL JOIN CATEGORY;
--RESULTS
/*

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
KEY-007    Basics                        
KEY-008    Basics                        
KEY-009    Basics                        
MEM-001    Storage                       
MEM-002    Storage                       
MEM-003    Storage                       
MEM-004    Storage                       
MEM-005    Storage                       
MEM-006    Storage                       
MEM-007    Storage                       
MEM-008    Storage                       

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
MEM-009    Storage                       
MEM-010    Storage                       
MEM-011    Storage                       
MEM-012    Storage                       
MIC-001    Basics                        
MIC-002    Basics                        
MIC-003    Basics                        
MIC-004    Basics                        
MIC-005    Basics                        
MIC-006    Basics                        
MIC-007    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
MIC-008    Basics                        
MIC-009    Basics                        
MIC-010    Basics                        
MIC-011    Basics                        
MIC-012    Basics                        
MOD-001    Accessories                   
MOD-002    Accessories                   
MOD-003    Accessories                   
MOD-004    Accessories                   
MOD-005    Accessories                   
MOM-001    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
MOM-002    Basics                        
MOM-003    Basics                        
MOM-004    Basics                        
MON-001    Basics                        
MON-002    Basics                        
MON-003    Basics                        
MON-004    Basics                        
MON-005    Basics                        
MON-006    Basics                        
MON-007    Basics                        
MON-008    Basics                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
P-001      Processors                    
P-002      Processors                    
P-003      Processors                    
P-004      Processors                    
P-005      Processors                    
P-006      Processors                    
P-007      Processors                    
P-008      Processors                    
P-009      Processors                    
P-010      Processors                    
POW-001    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
POW-002    Cables                        
POW-003    Cables                        
PRT-001    Accessories                   
PRT-002    Accessories                   
PRT-003    Accessories                   
PRT-004    Accessories                   
PRT-005    Accessories                   
PRT-006    Accessories                   
PS-001     Power                         
PS-002     Power                         
PS-003     Power                         

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
PS-004     Power                         
SCN-001    Accessories                   
SCN-002    Accessories                   
SCN-003    Accessories                   
SFT-001    Software                      
SFT-002    Software                      
SFT-003    Software                      
SFT-004    Software                      
SFT-005    Software                      
SFT-006    Software                      
SFT-007    Software                      

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
SFT-008    Software                      
SFT-009    Software                      
SP-001     Basics                        
SP-002     Basics                        
SP-003     Basics                        
ADT-001    Storage                       
ADT-002    Cables                        
ADT-003    Cables                        
ADT-004    Cables                        
ADT-005    Cables                        
ADT-006    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
ADT-007    Cables                        
BB-001     Basics                        
BB-002     Basics                        
BB-003     Basics                        
BB-004     Basics                        
BB-005     Basics                        
BRK-001    Cables                        
BRK-002    Cables                        
BRK-003    Cables                        
BRK-004    Cables                        
BRK-005    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
BRK-006    Cables                        
BRK-007    Cables                        
BRK-008    Cables                        
BRK-009    Cables                        
BRK-010    Cables                        
BRK-011    Cables                        
C-001      Basics                        
C-002      Basics                        
C-003      Basics                        
CAB-001    Cables                        
CAB-002    Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CAB-003    Cables                        
CAB-004    Cables                        
CAB-005    Cables                        
CAB-006    Cables                        
CAB-007    Cables                        
CAB-008    Cables                        
CD-001     Storage                       
CD-002     Storage                       
CD-003     Storage                       
CD-004     Storage                       
CF-001     Processors                    

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CF-002     Processors                    
CF-003     Processors                    
CF-004     Processors                    
CF-005     Processors                    
CF-006     Processors                    
CF-007     Processors                    
CF-008     Processors                    
CF-009     Processors                    
CTR-001    Computers                     
CTR-002    Computers                     
CTR-003    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-004    Computers                     
CTR-005    Computers                     
CTR-006    Computers                     
CTR-007    Computers                     
CTR-008    Computers                     
CTR-009    Computers                     
CTR-010    Computers                     
CTR-011    Computers                     
CTR-012    Computers                     
CTR-013    Computers                     
CTR-014    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-015    Computers                     
CTR-016    Computers                     
CTR-017    Computers                     
CTR-018    Computers                     
CTR-019    Computers                     
CTR-020    Computers                     
CTR-021    Computers                     
CTR-022    Computers                     
CTR-023    Computers                     
CTR-024    Computers                     
CTR-025    Computers                     

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
CTR-026    Computers                     
CTR-027    Computers                     
CTR-028    Computers                     
CTR-029    Computers                     
DVD-001    Storage                       
DVD-002    Storage                       
ICAB-001   Cables                        
ICAB-002   Cables                        
ICAB-003   Cables                        
ICAB-004   Cables                        
ICAB-005   Cables                        

PARTNUMBER CATEGORYNAME                  
---------- ------------------------------
ICAB-006   Cables                        
ICAB-007   Cables                        
ICAB-008   Cables                        
KEY-001    Basics                        
KEY-002    Basics                        
KEY-003    Basics                        
KEY-004    Basics                        
KEY-005    Basics                        
KEY-006    Basics                        

174 rows selected. 


*/
--QUESTION 9A:
/*
For order ID ‘2001000807’, display the customer name in first name (space) last name
format (e.g. Lisa Simpson), customer ID, and the order date. Regardless of whether the
order has been shipped, display all shipment ID(s), package numbers assigned, the
name to which each package is to be (or has been) sent (shipname), and the date on
which it was sent (shippeddate).
*/
SELECT customer.custfirstname  || ' ' || customer.custlastname  AS CUSTOMER_NAME, customer.customerid , custorder.orderdate, shipment.shipmentid, packingslip.packagenumber ,shipment.shipname, packingslip.shippeddate
FROM CUSTOMER
LEFT JOIN CUSTORDER ON custorder.customerid = customer.customerid
LEFT JOIN SHIPMENT ON shipment.orderid = custorder.orderid
LEFT JOIN PACKINGSLIP ON shipment.shipmentid = packingslip.shipmentid 
WHERE SHIPPEDDATE IS NULL AND custorder.orderid = '2001000807';
--RESULTS : 
/*
CUSTOMER_NAME                        CUSTOMERID ORDERDATE SHIPMENTID PACKAGENUMBER SHIPNAME             SHIPPEDDA
------------------------------------ ---------- --------- ---------- ------------- -------------------- ---------
Cecil Scheetz                        C-300003   31-MAR-11 H384                     Cecil Scheetz                 

*/


--QUESTION 9B:
/*
For all orders that haven’t been shipped (without shippeddate), display the customer
name in first name (space) last name format (e.g. Lisa Simpson), customer ID, and the
order date, shipment ID(s), and the name to which each package is to be (or has been)
sent (shipname).
*/
SELECT customer.custfirstname  || ' ' || customer.custlastname  AS CUSTOMER_NAME, customer.customerid , custorder.orderdate, shipment.shipmentid, shipment.shipname
FROM CUSTOMER
LEFT JOIN CUSTORDER ON custorder.customerid = customer.customerid
LEFT JOIN SHIPMENT ON shipment.orderid = custorder.orderid
LEFT JOIN PACKINGSLIP ON shipment.shipmentid = packingslip.shipmentid 
WHERE SHIPPEDDATE IS NULL;
--RESULTS
/*
CUSTOMER_NAME                        CUSTOMERID ORDERDATE SHIPMENTID SHIPNAME            
------------------------------------ ---------- --------- ---------- --------------------
Mary Jo Wales                        I-300125   30-MAR-11 L261       Mary Jo Wales       
Orville Gilliland                    C-300069   30-MAR-11 H381       Orville Gilliland   
Verna McGrew                         I-300069   27-MAR-11 L257       Verna McGrew        
Shirley Osborne                      I-300013   30-MAR-11 M161       Shirley Osborne     
Zack Hill                            I-300120   23-FEB-11 M129       Zack Hill           
Archie Doremski                      C-300032   29-MAR-11 H380       Archie Doremski     
Louise Cool                          I-300044   13-MAR-11 M147       Louise Cool         
Daniel Rodkey                        I-300141   31-MAR-11 L262       Daniel Rodkey       
Larry Osmanova                       C-300026   30-MAR-11 H382       Larry Osmanova      
Rachel Davis                         I-300107                                            
Bob Weldy                            I-300136                                            

CUSTOMER_NAME                        CUSTOMERID ORDERDATE SHIPMENTID SHIPNAME            
------------------------------------ ---------- --------- ---------- --------------------
Don Kaleta                           I-300028                                            
Tonya Owens                          I-300057                                            
Christina Wilson                     I-300079                                            
Randolph Darling                     I-300113                                            
Andy Huegel                          I-300151   31-MAR-11 M162       Andy Huegel         
Marjorie Vandermay                   C-300045   31-MAR-11 H383       Marjorie Vandermay  
Steven Yaun                          I-300147   27-MAR-11 L258       Michelle Oakley     
Cecil Scheetz                        C-300003   31-MAR-11 H384       Cecil Scheetz       
Joan Hedden                          I-300024   01-MAR-11 M137       Joan Hedden         
Phil Reece                           I-300154   29-MAR-11 M159       Phil Reece          
Karen Mangus                         I-300015   29-MAR-11 M160       Karen Mangus        

CUSTOMER_NAME                        CUSTOMERID ORDERDATE SHIPMENTID SHIPNAME            
------------------------------------ ---------- --------- ---------- --------------------
Tom Baker                            I-300134   29-MAR-11 L259       Tom Baker           
Charles Jones                        I-300087   30-MAR-11 L260       Charles Jones       

24 rows selected. 

*/
--Question 10a
/*
Use an INTERSECT statement, display distinctly the customer ID of any Pennsylvania
(state is ‘PA’) customer who has placed an order.
*/
SELECT CUSTOMERID
FROM CUSTOMER
WHERE STATE = 'PA'
INTERSECT 
SELECT CUSTOMERID
FROM CUSTORDER;
--RESULTS
/*
CUSTOMERID
----------
C-300006
C-300040
C-300062
I-300149
*/

--Question 10b:
/*
Use a MINUS statement, display distinctly the customer ID of any Pennsylvania (state is
‘PA’) customer who has never placed an order.
*/
SELECT CUSTOMERID
FROM CUSTOMER
WHERE STATE = 'PA'
MINUS 
SELECT CUSTOMERID
FROM CUSTORDER;
--RESULTS
/*
CUSTOMERID
----------
I-300028

*/

--Question 10c:
/*
Use an INTERSECT statement, display distinctly the customer ID of any Pennsylvania
(state is ‘PA’) customer who placed an order in 2011.
*/
SELECT CUSTOMERID
FROM CUSTOMER
WHERE STATE = 'PA'
MINUS 
SELECT CUSTOMERID
FROM CUSTORDER
WHERE TO_CHAR(ORDERDATE, 'fmYYYY') = '2011';
--RESULTS
/*

CUSTOMERID
----------
C-300062
I-300028

*/

--Question 10d:(RETURN TO THIS)?????????????????????????????????????????????????????????
/*
Use a MINUS statement, display distinctly the customer ID of any Pennsylvania (state is
‘PA’) customer who did NOT place an order in 2011.
(Hint: the number of rows returned by Q8a, Q8b, Q8c, Q8d should match in the
following way: Q8a + Q8b = Q8c + Q8d)
*/
SELECT CUSTOMERID
FROM CUSTOMER
WHERE STATE = 'PA'
MINUS 
SELECT CUSTOMERID
FROM CUSTORDER
WHERE TO_CHAR(ORDERDATE, 'fmYYYY') NOT IN '2011';

--Question 11a:
/*
Display distinct part number of any cable part (CategoryID is ‘CAB’) which has been
ordered at least once.
Use CUSTORDERLINE table to determine if a part has been ordered or not.
*/
SELECT DISTINCT PARTNUMBER
FROM INVENTORYPART
NATURAL JOIN CATEGORY
WHERE CATEGORYID = 'CAB'
MINUS
SELECT DISTINCT PARTNUMBER
FROM CUSTORDERLINE
WHERE ORDERID IS NULL;
/*
PARTNUMBER
----------
ADT-002
ADT-003
ADT-004
ADT-005
ADT-006
ADT-007
BRK-001
BRK-002
BRK-003
BRK-004
BRK-005

PARTNUMBER
----------
BRK-006
BRK-007
BRK-008
BRK-009
BRK-010
BRK-011
CAB-001
CAB-002
CAB-003
CAB-004
CAB-005

PARTNUMBER
----------
CAB-006
CAB-007
CAB-008
ICAB-001
ICAB-002
ICAB-003
ICAB-004
ICAB-005
ICAB-006
ICAB-007
ICAB-008

PARTNUMBER
----------
POW-001
POW-002
POW-003

36 rows selected. 
*/
--QUESTION 11B:
/*
Display distinct part number of any cable part (CategoryID is ‘CAB’) which has never
been ordered.
*/
SELECT DISTINCT PARTNUMBER
FROM INVENTORYPART
NATURAL JOIN CATEGORY
WHERE CATEGORYID = 'CAB'
MINUS
SELECT DISTINCT PARTNUMBER
FROM CUSTORDERLINE
WHERE ORDERID IS NOT NULL;
--RESULTS
/*
PARTNUMBER
----------
ADT-002
BRK-006
CAB-002
CAB-004
POW-001
*/
--QUESTION 11C:
/*
Display distinct part number of any cable part (CategoryID is ‘CAB’) which was ordered
at least once since 2010.
*/

SELECT DISTINCT PARTNUMBER
FROM INVENTORYPART
NATURAL JOIN CATEGORY
NATURAL JOIN CUSTORDER
WHERE CATEGORYID = 'CAB' AND TO_CHAR(ORDERDATE, 'fmYYYY') >= '2010';
--RESULTS
/*
PARTNUMBER
----------
BRK-009
BRK-011
CAB-006
ICAB-008
POW-002
ADT-005
BRK-002
CAB-003
CAB-007
CAB-008
ICAB-007

PARTNUMBER
----------
POW-001
BRK-001
BRK-008
CAB-005
ICAB-005
ICAB-006
ADT-002
ADT-003
ADT-004
BRK-004
BRK-006

PARTNUMBER
----------
BRK-007
BRK-010
ICAB-001
ICAB-002
BRK-005
CAB-002
CAB-004
BRK-003
CAB-001
ICAB-003
ICAB-004

PARTNUMBER
----------
ADT-007
POW-003
ADT-006

36 rows selected. 
*/
--QUESTION 11D
/*
Display distinct part number of any cable part (CategoryID is ‘CAB’) which was never
ordered since 2010. (Hint: the number of rows returned by Q9a, Q9b, Q9c, Q9d should
match in the following way: Q9a + Q9b = Q9c + Q9d)
*/
SELECT DISTINCT PARTNUMBER
FROM INVENTORYPART
NATURAL JOIN CATEGORY
WHERE CATEGORYID = 'CAB'
MINUS
SELECT DISTINCT PARTNUMBER
FROM CUSTORDERLINE
NATURAL JOIN CUSTORDER
WHERE ORDERID IS NOT NULL AND TO_CHAR(ORDERDATE, 'fmYYYY') <= '2010';
/*
PARTNUMBER
----------
ADT-002
BRK-001
BRK-006
CAB-002
CAB-004
POW-001

6 rows selected. 
*/
--QUESTION 12A
/*
Display the first name and last name for any Florida customer (state is ‘FL’) in
CUSTOMER table as well as the first name and last name for all Eagle employees in
EMPLOYEE table. The results should include only distinct records.
Sort the results by first name, then last name in ascending order.
*/
SELECT DISTINCT CUSTFIRSTNAME || ' ' ||CUSTLASTNAME AS NAME
FROM CUSTOMER
WHERE STATE = 'FL'
UNION
SELECT DISTINCT FIRSTNAME || ' ' ||LASTNAME AS NAME
FROM EMPLOYEE
WHERE STATE = 'FL';
--RESULTS
/*

CUSTOMER_NAME                       
------------------------------------
Allison Roland
Austin Ortman
Beth Zobitz
Calie Zollman
Charles Jones
David Deppe
David Keck
Edna Lilley
Gabrielle Stevenson
Gary German
Gregory Hettinger

CUSTOMER_NAME                       
------------------------------------
Jack Barrick
Jack Brose
Jamie Osman
Jason Krasner
Jason Wendling
Jim Manaugh
Joanne Rosner
Joseph Platt
Karen Mangus
Kathleen Xolo
Kathryn Deagen

CUSTOMER_NAME                       
------------------------------------
Kathy Gunderson
Kelly Jordan
Kristen Gustavel
Kristey Moore
Kristy Moore
Laura Rodgers
Marla Reeder
Meghan Tyrie
Melissa Alvarez
Michael Abbott
Michael Emore

CUSTOMER_NAME                       
------------------------------------
Michelle Nairn
Nicholas Albregts
Patricha Underwood
Paul Eckelman
Phil Reece
Rita Bush
Ronald Day
Ryan Stahley
Sherman Cheswick
Steve Cochran
Steve Hess

CUSTOMER_NAME                       
------------------------------------
Steven Hickman
Tina Yates
Todd Vigus

47 rows selected. 
*/



--QUESTION 12B:
/*
Display the first name and last name for any Florida customer (state is ‘FL’) in
CUSTOMER table as well as the first name and last name for all Eagle employees in
EMPLOYEE table. The results should also include the repeating records.
Sort the results by first name, then last name in ascending order.
*/
SELECT DISTINCT CUSTFIRSTNAME || ' ' ||CUSTLASTNAME AS NAME
FROM CUSTOMER
WHERE STATE = 'FL'
UNION ALL
SELECT DISTINCT FIRSTNAME || ' ' ||LASTNAME AS NAME
FROM EMPLOYEE
WHERE STATE = 'FL';
--RESULTS
/*

NAME                                
------------------------------------
Kathy Gunderson
Jack Barrick
Michael Emore
Phil Reece
Marla Reeder
Kelly Jordan
Karen Mangus
Ryan Stahley
Allison Roland
Jim Manaugh
Charles Jones

NAME                                
------------------------------------
Kristy Moore
Paul Eckelman
Meghan Tyrie
Austin Ortman
Rita Bush
Todd Vigus
Patricha Underwood
Michael Abbott
Steven Hickman
Calie Zollman
Melissa Alvarez

NAME                                
------------------------------------
Phil Reece
Kathleen Xolo
Sherman Cheswick
Kristey Moore
Jack Brose
David Deppe
Michelle Nairn
Gary German
Ryan Stahley
Jason Krasner
Steve Cochran

NAME                                
------------------------------------
Jim Manaugh
Beth Zobitz
Allison Roland
Gregory Hettinger
Joanne Rosner
Gabrielle Stevenson
Steve Hess
Jamie Osman
Edna Lilley
Jason Wendling
David Keck

NAME                                
------------------------------------
Tina Yates
Kristen Gustavel
Ronald Day
Charles Jones
Joseph Platt
Nicholas Albregts
Kathryn Deagen
Laura Rodgers

52 rows selected. 
*/



--QUESTION 13A:
/*
Find all customers (including both residential and commercial customers) from
Pennsylvania (state is ‘PA’) and all orders they have placed.
Display their names (for residential customers, display customer names in the format
“John Doe, residential”; for commercial customers, display customer names and the
company name in the format “John Doe, Google”), customer ID, order ID, and order
date.
Sort the results by customer ID first, then by order ID.
Note: Your results should include all Pennsylvania customers even if they have not
placed an order.
Please use the UNION clause.
*/
SELECT CONCAT(CUSTFIRSTNAME || ' ' ||CUSTLASTNAME, ', Residential') AS NAME, CUSTOMERID, ORDERID, ORDERDATE
FROM CUSTOMER
NATURAL JOIN CUSTORDER
WHERE STATE = 'PA' AND COMPANYNAME IS NULL
UNION ALL
SELECT CONCAT(CONCAT(CUSTFIRSTNAME || ' ' ||CUSTLASTNAME, ', '), COMPANYNAME) AS NAME, CUSTOMERID, ORDERID, ORDERDATE
FROM CUSTOMER
NATURAL JOIN CUSTORDER
WHERE STATE = 'PA' AND COMPANYNAME IS NOT NULL
ORDER BY CUSTOMERID, ORDERID;
/*

NAME                                                                           CUSTOMERID ORDERID    ORDERDATE
------------------------------------------------------------------------------ ---------- ---------- ---------
George Purcell, BMA Advertising Design                                         C-300006   2000000050 26-JUL-10
George Purcell, BMA Advertising Design                                         C-300006   2000000083 10-AUG-10
George Purcell, BMA Advertising Design                                         C-300006   2000000110 20-AUG-10
George Purcell, BMA Advertising Design                                         C-300006   2000000130 27-AUG-10
George Purcell, BMA Advertising Design                                         C-300006   2000000355 01-DEC-10
George Purcell, BMA Advertising Design                                         C-300006   2001000643 17-FEB-11
George Purcell, BMA Advertising Design                                         C-300006   2001000729 07-MAR-11
Mildred Jones, Computer Consultants                                            C-300040   2000000012 06-JUL-10
Mildred Jones, Computer Consultants                                            C-300040   2000000284 02-NOV-10
Mildred Jones, Computer Consultants                                            C-300040   2001000721 03-MAR-11
Mildred Jones, Computer Consultants                                            C-300040   2001000782 23-MAR-11

NAME                                                                           CUSTOMERID ORDERID    ORDERDATE
------------------------------------------------------------------------------ ---------- ---------- ---------
Scott Gray, Security Installation                                              C-300062   2000000361 01-DEC-10
Scott Gray, Security Installation                                              C-300062   2000000421 10-DEC-10
Scott Gray, Security Installation                                              C-300062   2000000440 14-DEC-10
Scott Gray, Security Installation                                              C-300062   2000000496 17-DEC-10
Thomas Wolfe, Residential                                                      I-300149   2000000497 17-DEC-10
Thomas Wolfe, Residential                                                      I-300149   2001000670 23-FEB-11
Thomas Wolfe, Residential                                                      I-300149   2001000736 08-MAR-11
Thomas Wolfe, Residential                                                      I-300149   2001000751 13-MAR-11
Thomas Wolfe, Residential                                                      I-300149   2001000768 20-MAR-11

20 rows selected. 
*/


--QUESTION 13B:
/*
Please retrieve the same information as 13a without using the UNION clause.
*/
--Notes:s I looking into trying multiple things and could not figure out how to join two specific SQL clauses together without a union. 


