--Question 1: Function
CREATE OR REPLACE FUNCTION ClassEnrollmentNo 
(p_CLASSNAME IN VARCHAR2) 
RETURN NUMBER 
AS
    v_number_of_students NUMBER;
BEGIN

    SELECT COUNT(lastname)
    INTO v_number_of_students
    FROM STUDENT
    NATURAL JOIN CLASS
    WHERE trim(UPPER(CLASSNAME)) = trim(upper(p_CLASSNAME));
    
    RETURN v_number_of_students;
END ClassEnrollmentNo;

--Q1 Input 
DECLARE
    p_CLASSNAME VARCHAR2(20);
    v_output   NUMBER;
BEGIN
    p_CLASSNAME := 'Intro Civ'; --Mixed case input example. returns 1 result. 
    v_output := ClassEnrollmentNo(p_CLASSNAME => p_CLASSNAME);
    dbms_output.put_line('number of Students = ' || v_output);
    v_output := v_output;
END;



--Question 2: MinMaxGPA
CREATE OR REPLACE PROCEDURE MinMaxGPA 
(p_CLASSNAME IN VARCHAR2,maxStudentGPA out NUMBER, minStudentGPA out NUMBER ) AS
BEGIN
    select max(gpa) as MaxGPA, min(gpa)as MinGPA
    into maxStudentGPA, minStudentGPA
    from Student
    natural join class
    WHERE trim(UPPER(CLASSNAME)) = trim(upper(p_CLASSNAME));
END MinMaxGPA;

--Question 2 input Class
 --Use any class to check the max and min gpas for that respective class.
DECLARE
    maxStudentGPA NUMBER;
    minStudentGPA NUMBER;
BEGIN
    MinMaxGPA('intro civ', maxStudentGPA, minStudentGPA);
    dbms_output.put_line(maxStudentGPA || ' ' || minStudentGPA);
END;



--Question 3:
CREATE OR REPLACE PROCEDURE StudentWithGivenGPA 
(V_GPA NUMBER, p_CLASSNAME VARCHAR2)
AS
    V_NAME varchar2(50);
    S_GPA NUMBER;
    S_CLASSNAME varchar2(50);
BEGIN
select LASTNAME, CLASSNAME
into V_NAME, S_CLASSNAME
from student
NATURAL JOIN CLASS
WHERE GPA = V_GPA AND trim(UPPER(CLASSNAME)) = trim(upper(p_CLASSNAME));
DBMS_OUTPUT.put_line(V_NAME);
END;

--Question 3    
execute StudentWithGivenGPA ('3.5', 'Med Europe');




--Quesiton 4
CREATE OR REPLACE PROCEDURE ClassEnrollmentReport
(p_CLASSNAME IN VARCHAR2)
AS
    StudentCount number;
    S_GPA NUMBER(7, 2);
   

     
BEGIN
    select Count(lastname)
    into StudentCount
    from student
    natural join class
    WHERE trim(UPPER(CLASSNAME)) = trim(upper(p_CLASSNAME));

    CASE 
        WHEN StudentCount = 0 THEN
            DBMS_OUTPUT.PUT_LINE ('There are no students in this class: ' || p_CLASSNAME);
        WHEN StudentCount = 1 THEN
            DBMS_OUTPUT.PUT_LINE ('There is 1 student in this class: ');
                
                DECLARE
                    maxStudentGPA NUMBER;
                    minStudentGPA NUMBER;
                BEGIN
                MinMaxGPA(p_CLASSNAME, maxStudentGPA, minStudentGPA);
                    IF maxStudentGPA < 3 then
                StudentWithGivenGPA(maxStudentGPA, p_CLASSNAME);
                DBMS_OUTPUT.PUT_LINE ('has below a 3.0');
                    else
                DBMS_OUTPUT.PUT_LINE ('has above a 3.0');
                END IF;
                END; 
        WHEN StudentCount >= 2 THEN
            DBMS_OUTPUT.PUT_LINE ('There are 2 or more students in this class: ' || p_CLASSNAME);
            DECLARE
                maxStudentGPA NUMBER;
                minStudentGPA NUMBER;
            BEGIN
                MinMaxGPA(p_CLASSNAME, maxStudentGPA, minStudentGPA);
                dbms_output.put_line(maxStudentGPA || ' ' || minStudentGPA);
                dbms_output.put_line('Highest GPA Student:');
                StudentWithGivenGPA(maxStudentGPA, p_CLASSNAME);
                dbms_output.put_line('Lowest GPA Student:');
                StudentWithGivenGPA(minStudentGPA, p_CLASSNAME);
            END;
        Else
            DBMS_OUTPUT.PUT_LINE ('Bad Input');
    END CASE;
END;
    
CALL ClassEnrollmentReport('Technical writing');


--Question 5: There are 6 things wrong with the code.
select FirstName || ' '|| LastName AS Person_of_Interest, homephone, 
    nvl(to_char(emailaddr), 'Empty email'),'Eagle Electronics' as Employer , StreetAddress 
    from EMPLOYEE
    where JobTitle = 'Assembly'  and substr(homephone,1,3) != 919
UNION
select custfirstname || ' '|| custlastname AS Person_of_Interest, phone, 
    nvl(to_char(emailaddr), 'Empty email'), companyname, address  
    from customer
    where (companyname is not null and address like '%Rd.'  and state in ('OH', 'IN', 'MI', 'KY', 'ND')  or substr(phone,1,3) = 898 and state = 'CT'  and substr(phone,-1,1) != substr(fax,-1,1));
