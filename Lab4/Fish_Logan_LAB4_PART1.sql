/*
Logan Fish
CNIT 372
Lab 3
2/6/2022
*/

--Question 1a:
select jobtitle, count(employeeid)
from employee
group by jobtitle; 
--results of this Query
/*
JOBTITLE                            COUNT(EMPLOYEEID)
----------------------------------- -----------------
VP Finance                                          1
Sales                                               3
VP Information                                      1
Chief Information Officer                           1
Chief Sales Officer                                 1
VP Operations                                       1
Accountant                                          2
President                                           1
DBA                                                 1
Chief Financial Officer                             1
Engineer                                            5

JOBTITLE                            COUNT(EMPLOYEEID)
----------------------------------- -----------------
Programmer Analyst                                  2
Operations Officer                                  2
Assembly                                           18

14 rows selected. 
*/


--Question 1b:
DECLARE
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE          VARCHAR2(50) := '&V_JOBTITLE';

BEGIN
    select count(employeeid)
        into V_NUMBER_EMPLOYEES
    from employee
    where jobtitle = V_JOBTITLE;
    
    IF V_NUMBER_EMPLOYEES < 1 THEN
        DBMS_OUTPUT.PUT_LINE ('There are no employees with the job title: ' || V_JOBTITLE);
    ELSIF V_NUMBER_EMPLOYEES < 4 THEN
        DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);
    ELSIF V_NUMBER_EMPLOYEES < 7 THEN
        DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);
    ELSE
        DBMS_OUTPUT.PUT_LINE ('There are between 7 or more employees with the Job Title: ' || V_JOBTITLE);
    END IF;
END;
--When prompted for job title and inputted CIO the output printed to the screen is that 
--'There are no employees with the job title: CIO'

--Question 1c
/*
Job Title Accountant:
Results: 'There are between 1 and 3 employees with the Job Title: Accountant'

*/

--Question 1d
/*
Job Title Engineer:
Results: 'There are between 4 and 6 employees with the Job Title: Engineer'
*/

--Question 1e
/*
Job Title Assembly:
Results: 'There are between 7 or more employees with the Job Title: Assembly'
*/

--Question 2a:
DECLARE
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE          VARCHAR2(50) := '&V_JOBTITLE';

BEGIN
    select count(employeeid)
        into V_NUMBER_EMPLOYEES
    from employee
    where jobtitle = V_JOBTITLE;
    
    CASE V_NUMBER_EMPLOYEES
        WHEN 0 THEN
            DBMS_OUTPUT.PUT_LINE ('There are no employees with the job title: ' || V_JOBTITLE);
        WHEN 1 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);
        WHEN 2 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);
        WHEN 3 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 1 and 3 employees with the Job Title: ' || V_JOBTITLE);
        WHEN 4 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);
        WHEN 5 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);            
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE ('There are between 4 and 6 employees with the Job Title: ' || V_JOBTITLE);                     
        ELSE
            DBMS_OUTPUT.PUT_LINE ('There are between 7 or more employees with the Job Title: ' || V_JOBTITLE);
    END CASE;
END;
--RESULTS: 'There are no employees with the job title: CIO'

--Question 2b
/*
Job Title: Accountant
results: 'There are between 1 and 3 employees with the Job Title: Accountant'
*/

--Question 2c
/*
Job Title: Engineer
results: 'There are between 4 and 6 employees with the Job Title: Engineer'
*/



--Question 2d
/*
Job Title: Assembly
results: 'There are between 7 or more employees with the Job Title: Assembly'

*/


--Question 3

DECLARE
    V_NUMBER_EMPLOYEES  NUMBER;
    V_JOBTITLE          EMPLOYEE.JOBTITLE%TYPE := '&V_JOBTITLE';
    V_STAFF_LEVEL        VARCHAR2(100);

BEGIN
    select count(employeeid)
        into V_NUMBER_EMPLOYEES
    from employee
    where jobtitle = V_JOBTITLE;
    
    CASE V_NUMBER_EMPLOYEES
        WHEN 0 THEN
            V_STAFF_LEVEL := 'There are no employees with the job title: ';
        WHEN 1 THEN
            V_STAFF_LEVEL := 'There are between 1 and 3 employees with the Job Title: ';
        WHEN 2 THEN
            V_STAFF_LEVEL := 'There are between 1 and 3 employees with the Job Title: ';
        WHEN 3 THEN
            V_STAFF_LEVEL := 'There are between 1 and 3 employees with the Job Title: ';
        WHEN 4 THEN
            V_STAFF_LEVEL := 'There are between 4 and 6 employees with the Job Title: ';
        WHEN 5 THEN
            V_STAFF_LEVEL := 'There are between 4 and 6 employees with the Job Title: ';         
        WHEN 6 THEN
            V_STAFF_LEVEL := 'There are between 4 and 6 employees with the Job Title: ';                    
        ELSE
            V_STAFF_LEVEL := 'There are between 7 or more employees with the Job Title: ';
    END CASE;
    
    --OUTPUT USER FRIENDLY RESPONSE
    DBMS_OUTPUT.PUT_LINE (V_STAFF_LEVEL || V_JOBTITLE);

END;
--Resulting Output: 'There are between 4 and 6 employees with the Job Title: Engineer'


--Question 4a
DECLARE
    MY_COUNT INTEGER := '&MY_COUNT';
    MY_COUNTER INTEGER := 1;
    MY_NUMBER INTEGER;

BEGIN
    LOOP
        MY_NUMBER := dbms_random.value(1,MY_COUNT);
        DBMS_OUTPUT.PUT(MY_NUMBER || ', ');
        MY_COUNTER := MY_COUNTER +1;
        EXIT WHEN MY_COUNTER > MY_COUNT;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END;
--OUTPUT: 3, 2, 2, 2, 3, 


--4B
/*
The loop runs through the program as many times as was inputted as my_count. 
For each loop a random value is chosen, and the counter moves up once. 
When the counter matches the chosen count value the prgram ends the loop and prints out randomly chosen number

*/

--Question 4c+4d
/*
Rewrite the above loop usign a while loop and verify it runs. including resulting output in your submission. 
*/
DECLARE
    MY_COUNT INTEGER := '&MY_COUNT';
    MY_COUNTER INTEGER := 0;
    MY_NUMBER INTEGER;

BEGIN
WHILE MY_COUNT > MY_COUNTER
    LOOP
        MY_NUMBER := dbms_random.value(1,MY_COUNT);
        DBMS_OUTPUT.PUT(MY_NUMBER || ', ');
        MY_COUNTER := MY_COUNTER +1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END;
--Resulting Output for an inputted 5
-- Results: 2, 4, 2, 2, 3, 
-- I changed the counter to 0 for the while comparrision to still create the 
--appropriate number of numbers. 


--Question 5a + 5b: Rewrite using a for Loop

DECLARE
    MY_COUNT INTEGER := '&MY_COUNT';
    MY_COUNTER INTEGER := 0;
    MY_NUMBER INTEGER;

BEGIN
FOR MY_COUNTER IN 1 .. MY_COUNT
    LOOP
        MY_NUMBER := dbms_random.value(1,MY_COUNT);
        DBMS_OUTPUT.PUT(MY_NUMBER || ', ');
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
END;
--Resulting Output for inputting 5 is : 3, 4, 1, 4, 4, 

































