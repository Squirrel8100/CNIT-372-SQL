/*
Logan Fish
CNIT 372
Lab 4 Part 2, Part A
2/20/2022
*/

--Question 1a
CREATE OR REPLACE PROCEDURE HELLO_WORLD
AS
    V_OUTPUT VARCHAR2(35) := 'Hello World';
BEGIN
    DBMS_OUTPUT.PUT_LINE (V_OUTPUT);
END HELLO_WORLD;
--Result: Printed to the Script output is 'Procedure HELLO_WORLD compiled'. 

--Question 1b: what is required to eecute the hello_world procedure
EXECUTE HELLO_WORLD;


--Question 1c:
--Output is Hello World in the Dbms output pane. 

--Question 1d: difference between anonymous blocks and named blocks
--Answer: A named block is stored and can be reused, whereas an anonymous block is not saved and is one time use. 
--Reference: https://www.oracletutorial.com/plsql-tutorial/plsql-anonymous-block/#:~:text=A%20named%20block%20is%20stored,be%20useful%20for%20testing%20purposes.

--Question 2: Format
--Formatted Version of question 1a below
CREATE OR REPLACE PROCEDURE hello_world AS
    v_output VARCHAR2(35) := 'Hello World';
BEGIN
    dbms_output.put_line(v_output);
END hello_world;
--Format changed some of the code from uppercase to lowercase and shifted the statements to save space. 

--Question 3
CREATE OR REPLACE PROCEDURE HELLO_WORLD 
(p_name IN VARCHAR2)
AS
    v_output VARCHAR2(35);
BEGIN
    v_output := 'Hello ' || p_name;
    dbms_output.put_line(v_output);
END HELLO_WORLD;

--Question 3a. 
--To execute the and read the output of the 'Hello World' having: ' Execute hello_world ' after the end statement would execute the code. 
EXECUTE HELLO_WORLD('World');
--Output: Hello World

--Question 3b
EXECUTE HELLO_WORLD('Mark.');
--Output: Hello Mark.

--Question 3c
EXECUTE HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL.')
--output to script output is an Error dealing with character string buffer being too small. 

--Question 3d
CREATE OR REPLACE PROCEDURE HELLO_WORLD
(p_name in VARCHAR2)
AS
    v_output VARCHAR2(75);
BEGIN
    v_output := 'Hello ' || p_name;
    dbms_output.put_line (v_output);
END HELLO_WORLD;

--Question 3e 
EXECUTE HELLO_WORLD('World procedure. I have so much fun coding in SQL and PLSQL.');
--output: Hello World procedure. I have so much fun coding in SQL and PLSQL.


--Question 4. 
CREATE OR REPLACE PROCEDURE HELLO_WORLD
(
p_greeting IN varchar2,
p_name IN varchar2
)
AS
    v_output VARCHAR2(75);
BEGIN
    v_output := p_greeting || ' ' || p_name;
    dbms_output.put_line(v_output);
END HELLO_WORLD;

--QUESTION 4A
EXECUTE HELLO_WORLD('Hello' ,'World');
--Output Hello World

--QUESTION 4B
EXECUTE HELLO_WORLD('World');
--Output: wrong number or types arguments in call to 'HELLO_WORLD'

--Question 4c
EXECUTE HELLO_WORLD('Goodbye', 'Hal');
--Output: 'Goodbye Hal'

--Question 4d
EXECUTE HELLO_WORLD('Hello', null);
--Output: Hello 

--Question 5
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

--What is the sql code necessary to execute the number of employees function? execute the function with your code. 
DECLARE
    v_output NUMBER;
BEGIN
    v_output := number_of_employees();
    dbms_output.put_line('Number of Employees = ' || v_output);
    v_output := v_output;
END;
--Results: Number of Employees = 40



--Question 6
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES 
(p_jobtitle IN VARCHAR2) 
RETURN NUMBER 
AS
    v_number_of_employees NUMBER := 0;
BEGIN

    SELECT COUNT(*)
    INTO v_number_of_employees
    FROM employee
    WHERE jobtitle = p_jobtitle;
    
    RETURN v_number_of_employees;
END Number_Of_Employees;


--Question 6a determine the number of engineers
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle := 'Engineer';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--Ouput: number of employees = 5

--Question 6b Updated function
CREATE OR REPLACE FUNCTION NUMBER_OF_EMPLOYEES 
(p_jobtitle IN VARCHAR2) 
RETURN NUMBER 
AS
    v_number_of_employees NUMBER := 0;
BEGIN

    SELECT COUNT(*)
    INTO v_number_of_employees
    FROM employee
    WHERE trim(UPPER(jobtitle)) = trim(upper(p_jobtitle));
    
    RETURN v_number_of_employees;
END Number_Of_Employees;

--Question 6c
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle := 'engineer';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--Output: number of employees = 5




--Question 6d
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle := 'dba';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--Output: number of employees = 1



--Question 6e
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle := 'DBA';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--Output: number of employees = 1

--Question 6f
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle := 'chief sales officer';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--Output: number of employees = 1



--Question 6g
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle :=  ' chief sales officer ';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--output: number of employees = 1


--Question 6h
DECLARE
    p_jobtitle VARCHAR2(40);
    v_output   NUMBER;
BEGIN
    p_jobtitle := 'CEO';
    v_output := number_of_employees(p_jobtitle => p_jobtitle);
    dbms_output.put_line('number of employees = ' || v_output);
    v_output := v_output;
END;
--Output: number of employees = 0



--Question 7a
--Note: I tried to do this as a function but couldnt figure out how to get the dates to pass as inputs or as hardcode inputs. 
--Tried to do a comparission with if else statements to decide if i need to display days of the past or future. 
CREATE OR REPLACE PROCEDURE DAY_AWAY AS
    V_DATE         NUMBER := '&V_DATE';
    v_current_date NUMBER;
BEGIN
    v_current_date := TO_NUMBER(TO_CHAR(sysdate, 'DD'));

        IF V_DATE <= v_current_date THEN
            dbms_output.put_line( '-' || v_current_date - v_date || ' Days ago');
        ELSE
            dbms_output.put_line( '+' || v_date - v_current_date || ' Days away');
        END IF;
END;


 

--Question 7b
EXECUTE DAYS_AWAY;
--Results
--Notes: I could not figure out how to input a date format such as 02-20-2022 into v_date and be able to subtract from sysdate. 
--Best i could figure out over the long time trying different things was to input numbers as days and compare to the sysdate days. 
/*
Passed 12 into the function, Output: -8 Days ago
Passed 22 into the function, Output: +2 Days away
*/


--Question 8
--DAY-OF_THE_WEEK PROCEDURE


--Question 9
--DAYS_FROM_WEEKEND PROCEDURE













