/*
Logan Fish
CNIT 372
Lab 3
2/6/2022
*/
--Question 1
begin
        DBMS_OUTPUT.PUT_LINE ('Hello World');
end;
--Output: Hello World


--Question 2
SET SERVEROUTPUT ON;


--Question 3
--Output: Hello World
/*The Script Output also displays Hello world with the output on. 
Does SQL Developer " remember your preference?
When i closed SQL developer and then reopened and reran the code from Question 1 it did not remember. 
*/
--Question 4: define SERVEROUTPUT attribute
--The SERVEROUTPUT setting controls the printed output generated by the DBMS_OUTPUT package from PL/SQL procedures
--Resource: https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re85.html

--Question 5:
begin
    DBMS_OUTPUT.PUT_LINE ('The Ubiquitous Hello World');
end;
--Output: The Ubiquitous Hello World

--Question 6:
begin
  DBMS_OUTPUT.PUT('The');
  DBMS_OUTPUT.PUT(' ');
  DBMS_OUTPUT.PUT('Ubiquitous');
  DBMS_OUTPUT.PUT(' ');
  DBMS_OUTPUT.PUT('Hello');
  DBMS_OUTPUT.PUT(' ');
  DBMS_OUTPUT.PUT('World');
end;
--output The Ubiquitous Hello World

--Question 7:
/*
Based on questions 5 and 6 I believe that the difference between .put and .put_line
is that .put continues to tack on the outputs, while .put_line outputs and ends any outputs on that line. 
*/

--Question 8: 
/*
Provide a definition and /or description of the DBMS_OUTPUT. PUT procedure from appropriate Oracle documentation. 
Cite the source of your answer.

You can build a line of information piece by piece by making multiple calls to put. 
https://docs.oracle.com/database/121/TTPLP/d_output.htm#TTPLP71212
*/


--Question 9: 
/*
Provide a definition and /or description of the DBMS_OUTPUT. PUT_LINE procedure from appropriate Oracle documentation. 
Cite the source of your answer.

When you call PUT_LINE, the item you specify is automatically followed by an end-of-line marker. 
The put_line call ends the line with whatever is specified. 
https://docs.oracle.com/database/121/TTPLP/d_output.htm#TTPLP71212

*/





--Question 10: 
/*
Based on the definitions provided in 8 and 9, 
what is the difference between the DBMS_OUTPUT. PUT procedure and the DBMS_OUTPUT.PUT_LINE procedure?
The difference between .put and .put_line is that .put is used to build a line with multiple calls, where put_line
builds a line with a single call. 
*/


--Question 11: 
begin
        dbms_output.put_line ('My name is ' || '&sv_YourName');
end;
-- It asks for a substitute variable. Once you input that variable it will print the output to the dbms as
-- "my name is _____" with whatever you inputted in the blank space. 'My name is Logan'

--Question 12:
SET VERIFY ON;



--Question 13
/*
Run the PL/SQL code from Q11 again.
What is the output (e.g., what is printed to the screen)? Include everything outputted by the database.

old:begin
        dbms_output.put_line ('My name is ' || '&sv_YourName');
end;
new:begin
        dbms_output.put_line ('My name is ' || 'Logan');
end;

PL/SQL procedure successfully completed.
*/


--Question 14
SET VERIFY OFF;

--Question 15
/*
Run the PL/SQL code from Q11 again.
What is the output (e.g., what is printed to the screen)? Include everything outputted by the database.

PL/SQL procedure successfully completed.

*/


--Question 16
/*
Provide a definition and /or description of the VERIFY attribute from appropriate Oracle documentation.
Cite the source of your answer.

The verify attribute inputs the variable inputted into the appropriate call and displays the before and after of each line using the substitution. 
https://www.oreilly.com/library/view/oracle-sqlplus-the/0596007469/re106.html 
*/

--Question 17
begin
        dbms_output.put_line ('My name is ' || '&sv_YourName');
end;

/* --Answer
How many times are you prompted for the value of sv_YourName? 
What does this imply about the persistence of inputted values?

You are promted once per substitution request. 
If the request is canceled or simpley left blank it will do nothing to the request or leave it blank. 
This tells that the substitute variable can function without an substitue value. 
*/

--Question 18
begin
         dbms_output.put_line ('Today is ' || '&sv_day');
         dbms_output.put_line ('Tomorrow is ' || '&sv_day');
end;
/*
Can you use the same variable name twice within the same unnamed block? 
What occurs if you attempt to do so?

You can see the same veriable name twice within the same unnamed block, the variable is just a placeholder for the asked input
It does not seem to have any comflictions when naming a variable the same.

--results
Today is Today
Tomorrow is Tomorrow

*/

--Question 19
begin
         dbms_output.put_line ('Today is ' || '&&sv_Day');
         dbms_output.put_line ('Tommorrow is ' || '&sv_Day');
end;
/*
What is the output (e.g., what is printed to the screen)? 
Were you prompted to provide a value for the variable sv_day when the second DBMS_OUTPUT was executed?
What is different that caused this?
It only asked for a single substitution input. It outputted 'Today is Monday / Tomorrow is Monday' 
This is caused by the second & within the substitute value placeholder. 
*/

--Question 20
/*
Run the PL/SQL code from Question 19 again. What is the output now (e.g., what is printed to the screen)? 
Were you prompted for the variable sv_day? 
What does this imply about the persistence of variable input captured using the && command?

Using the && command that input captured is held as a constant for that variable rather than a temporary value. 
Having it as a constant value the reused named variable also uses it aswell. 
*/

--Question 21
declare
        v_day varchar2(20) := '&sv_day1' ;
begin   
        dbms_output.put_line ('Today is ' || v_Day);
end;
--Output: Today is Today. The input is declare before it is used in the dbms output line. 
--It could read as Today is '      '. 


--Question 22
declare
        v_day varchar2(10);
begin
    v_day := to_char(sysdate, 'Day');
    
    dbms_output.put_line ('Today is ' || v_Day);
    dbms_output.put_line ('Tommorow is ' || to_char (sysdate +1, 'Day'));
end ;
--results
/*
Today is Sunday   
Tommorow is Monday
*/
--Question 23
select employeeID
from employee
where employeeid = '100001';
--results
/*
EMPLOYEEID
----------
100001
*/
--Question 24
declare
    V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
    V_LASTNAME      EMPLOYEE.LASTNAME%TYPE;
    V_FIRSTNAME     EMPLOYEE.FIRSTNAME%TYPE;
    
begin
    select      EMPLOYEEID, LASTNAME, FIRSTNAME
    into        V_EMPLOYEEID, V_LASTNAME, V_FIRSTNAME
    from EMPLOYEE
    where EMPLOYEEID = '100001';
    
    DBMS_OUTPUT.PUT_LINE ('Employee ID      lastName        Firstname');
    DBMS_OUTPUT.PUT_LINE ('==========================================');
    DBMS_OUTPUT.PUT_LINE (V_EMPLOYEEID);
    DBMS_OUTPUT.PUT_LINE ('          ');
    DBMS_OUTPUT.PUT_LINE (V_LASTNAME);
    DBMS_OUTPUT.PUT_LINE ('         ');
    DBMS_OUTPUT.PUT_LINE (V_FIRSTNAME);
    DBMS_OUTPUT.PUT_LINE ('          ');
end;
--results
/*
Employee ID      lastName        Firstname
==========================================
100001
          
Manaugh
         
Jim
          
*/


--Question 25
select employeeID
from employee;
--results : 40 rows

--Question 26
declare
    V_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
    V_LASTNAME      EMPLOYEE.LASTNAME%TYPE;
    V_FIRSTNAME     EMPLOYEE.FIRSTNAME%TYPE;
    
begin
    select      EMPLOYEEID, LASTNAME, FIRSTNAME
    into        V_EMPLOYEEID, V_LASTNAME, V_FIRSTNAME
    from EMPLOYEE;
    
    DBMS_OUTPUT.PUT_LINE ('Employee ID      lastName        Firstname');
    DBMS_OUTPUT.PUT_LINE ('==========================================');
    DBMS_OUTPUT.PUT_LINE (V_EMPLOYEEID);
    DBMS_OUTPUT.PUT_LINE ('          ');
    DBMS_OUTPUT.PUT_LINE (V_LASTNAME);
    DBMS_OUTPUT.PUT_LINE ('         ');
    DBMS_OUTPUT.PUT_LINE (V_FIRSTNAME);
    DBMS_OUTPUT.PUT_LINE ('          ');
end;
--results
/*
Error report -
ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 7
*/
--Question 27
/*
based on Question 25 for Question 26 without a where clause the PL/SQL query is trying to assign 40 rows worth of information
into the variable set for employeeid, lastname, and firstname. 
*/




--Question 28
--A scalar variable can only hold one value at any given time.  




--Question 29
DECLARE
    V_EMPLOYEE EMPLOYEE%ROWTYPE;
    
BEGIN
    SELECT * INTO V_EMPLOYEE FROM EMPLOYEE WHERE EMPLOYEEID='100001';
    DBMS_OUTPUT.PUT_LINE ('Employee ID      lastName        Firstname');
    DBMS_OUTPUT.PUT_LINE ('==========================================');
    DBMS_OUTPUT.PUT_LINE (V_EMPLOYEE.EMPLOYEEID || '          ' || V_EMPLOYEE.LASTNAME || '         ' || V_EMPLOYEE.FIRSTNAME ||'          ');
END;
--results
/*
Employee ID      lastName        Firstname
==========================================
100001          Manaugh         Jim          


*/

--Question 30
v_TELEPHONE varchar2(3);

--Question 31A
declare
    V_CUSTFIRSTNAME     CUSTOMER.CUSTFIRSTNAME%TYPE;
    V_CUSTLASTNAME      CUSTOMER.CUSTLASTNAME%TYPE;
    V_CUSTAREACODE      CUSTOMER.PHONE%TYPE;
    
begin
    SELECT CUSTFIRSTNAME, CUSTLASTNAME, SUBSTR(PHONE,3)
    INTO V_CUSTFIRSTNAME, V_CUSTLASTNAME, V_CUSTAREACODE
    FROM CUSTOMER
    WHERE SUBSTR(PHONE,3) = '808';
    
    DBMS_OUTPUT.PUT_LINE ('Customer First Name      Last Name        Area Code');
    DBMS_OUTPUT.PUT_LINE ('==========================================');
    DBMS_OUTPUT.PUT_LINE (V_CUSTFIRSTNAME);
    DBMS_OUTPUT.PUT_LINE ('          ');
    DBMS_OUTPUT.PUT_LINE (V_CUSTLASTNAME);
    DBMS_OUTPUT.PUT_LINE ('         ');
    DBMS_OUTPUT.PUT_LINE (V_CUSTAREACODE);
    DBMS_OUTPUT.PUT_LINE ('          ');
end;
--Something like this would be used to store a large number of customers grouped by their area code. 
--currently this does not run without error. 

--Question 31B
declare
    V_CUSTFIRSTNAME     CUSTOMER.CUSTFIRSTNAME%TYPE;
    V_CUSTLASTNAME      CUSTOMER.CUSTLASTNAME%TYPE;
    V_CUSTAREACODE      CUSTOMER.PHONE%TYPE;
    
begin
    SELECT CUSTFIRSTNAME, CUSTLASTNAME, SUBSTR(PHONE,3)
    INTO V_CUSTFIRSTNAME, V_CUSTLASTNAME, V_CUSTAREACODE
    FROM CUSTOMER
    WHERE MAX(COUNT(V_CUSTAREACODE)) > COUNT(V_CUSTAREACODE)
    GROUP BY V_CUSTAREACODE;
    
    DBMS_OUTPUT.PUT_LINE ('Customer First Name      Last Name        Area Code');
    DBMS_OUTPUT.PUT_LINE ('==========================================');
    DBMS_OUTPUT.PUT_LINE (V_CUSTFIRSTNAME);
    DBMS_OUTPUT.PUT_LINE ('          ');
    DBMS_OUTPUT.PUT_LINE (V_CUSTLASTNAME);
    DBMS_OUTPUT.PUT_LINE ('         ');
    DBMS_OUTPUT.PUT_LINE (V_CUSTAREACODE);
    DBMS_OUTPUT.PUT_LINE ('          ');
end;
--Something like this could be used to print off the largest number of customers within an area code. 
--currently this does not run without error. 