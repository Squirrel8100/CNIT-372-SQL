/*
Logan Fish
CNIT 372 Spring 2022
Lab 5


*/

--Question 1a
CREATE OR REPLACE PROCEDURE print_employee_roster
AS
    CURRENT_EMPLOYEEID EMPLOYEE.EMPLOYEEID%TYPE;
    CURRENT_LASTNAME EMPLOYEE.LASTNAME%TYPE;
    CURRENT_FIRSTNAME EMPLOYEE.FIRSTNAME%TYPE;
    
    CURSOR all_employees
    IS
        SELECT 
            EmployeeID, LastName, FirstName 
            FROM Employee;
        
BEGIN
    OPEN all_employees;
    
    FETCH all_employees into current_employeeid, current_lastname, current_firstname;
    
    WHILE all_employees%FOUND LOOP
    
        DBMS_OUTPUT.PUT (RPAD(current_employeeid, 15, ' '));
        DBMS_OUTPUT.PUT (RPAD(current_lastname, 30, ' '));
        DBMS_OUTPUT.PUT (Current_firstname);
        FETCH all_employees into current_employeeid, current_lastname, current_firstname;
    END LOOP;
    
    CLOSE all_employees;
END print_employee_roster;

--Question 1b

EXECUTE PRINT_EMPLOYEE_ROSTER;
--Script output results. 
/*
PL/SQL procedure successfully completed.

*/


--Question 2a
CREATE OR REPLACE PROCEDURE print_employee_roster AS

    current_employeeid employee.employeeid%TYPE;
    current_lastname   employee.lastname%TYPE;
    current_firstname  employee.firstname%TYPE;
    CURSOR all_employees IS
    SELECT
        employeeid,lastname,firstname
    FROM
        employee;

    current_employee   all_employees%rowtype;
BEGIN
    OPEN all_employees;
    FETCH all_employees INTO current_employee;
    WHILE all_employees%found 
    LOOP
        dbms_output.put(rpad(current_employee.employeeid, 15, ' '));
        dbms_output.put(rpad(current_employee.lastname, 30, ' '));
        dbms_output.put_line(current_employee.firstname);
    FETCH all_employees INTO current_employee;
    END LOOP;

    CLOSE all_employees;
END print_employee_roster;

--Question 2b
execute print_employee_roster;
--Results
/*
Procedure PRINT_EMPLOYEE_ROSTER compiled

100001         Manaugh                       Jim
100101         Rosner                        Joanne
100103         Bush                          Rita
100104         Abbott                        Michael
100106         Eckelman                      Paul
100112         Hickman                       Steven
100120         Nairn                         Michelle
100125         Stevenson                     Gabrielle
100127         Wendling                      Jason
100200         Zobitz                        Beth
100204         Keck                          David
100206         Xolo                          Kathleen
100209         Yates                         Tina
100220         Vigus                         Todd
100330         Gustavel                      Kristen
100365         Cheswick                      Sherman
100399         Day                           Ronald
100475         Hess                          Steve
100488         Osman                         Jamie
100550         Roland                        Allison
100559         Tyrie                         Meghan
100600         Zollman                       Calie
100650         Lilley                        Edna
100700         Jones                         Charles
100880         German                        Gary
100892         Platt                         Joseph
100944         Stahley                       Ryan
100967         Albregts                      Nicholas
100989         Deagen                        Kathryn
101007         Krasner                       Jason
101030         Moore                         Kristey
101045         Ortman                        Austin
101066         Rodgers                       Laura
101088         Underwood                     Patricha
101089         Alvarez                       Melissa
101097         Brose                         Jack
101115         Cochran                       Steve
101135         Deppe                         David
101154         Hettinger                     Gregory
101166         Reece                         Phil

*/
--Question 2c " What is the database object that the current_employee variable is based upon?
--The current_employee variable is based on the all_employees object. 


--Question 3a
CREATE OR REPLACE PROCEDURE print_employee_roster
AS

    CURSOR all_employees 
    IS
        SELECT employeeid, lastname || ', ' || firstname as name
        FROM employee;
    current_employee all_employees%ROWTYPE;
BEGIN
    OPEN all_employees;

    FETCH all_employees INTO current_employee;

    WHILE all_employees%found LOOP
    
        dbms_output.put(rpad(current_employee.employeeid, 15, ' '));
        dbms_output.put_line(current_employee.name);
        FETCH all_employees INTO current_employee;
    END LOOP;
    
    CLOSE all_employees;
END print_employee_roster;

--Question 3b
execute print_employee_roster;
--results
/*
100001         Manaugh, Jim
100101         Rosner, Joanne
100103         Bush, Rita
100104         Abbott, Michael
100106         Eckelman, Paul
100112         Hickman, Steven
100120         Nairn, Michelle
100125         Stevenson, Gabrielle
100127         Wendling, Jason
100200         Zobitz, Beth
100204         Keck, David
100206         Xolo, Kathleen
100209         Yates, Tina
100220         Vigus, Todd
100330         Gustavel, Kristen
100365         Cheswick, Sherman
100399         Day, Ronald
100475         Hess, Steve
100488         Osman, Jamie
100550         Roland, Allison
100559         Tyrie, Meghan
100600         Zollman, Calie
100650         Lilley, Edna
100700         Jones, Charles
100880         German, Gary
100892         Platt, Joseph
100944         Stahley, Ryan
100967         Albregts, Nicholas
100989         Deagen, Kathryn
101007         Krasner, Jason
101030         Moore, Kristey
101045         Ortman, Austin
101066         Rodgers, Laura
101088         Underwood, Patricha
101089         Alvarez, Melissa
101097         Brose, Jack
101115         Cochran, Steve
101135         Deppe, David
101154         Hettinger, Gregory
101166         Reece, Phil

*/

--Question 4a
CREATE OR REPLACE PROCEDURE print_employee_roster 
AS
    CURSOR all_employees 
    IS
        SELECT employeeid, lastname || ' '|| firstname AS name
        FROM employee;
BEGIN
    FOR current_employee IN all_employees LOOP

        dbms_output.put(rpad(current_employee.employeeid, 15, ' '));
        dbms_output.put_line(current_employee.name);
    END LOOP;
END print_employee_roster;

--Question 4b
execute print_employee_roster;

/*
100001         Manaugh Jim
100101         Rosner Joanne
100103         Bush Rita
100104         Abbott Michael
100106         Eckelman Paul
100112         Hickman Steven
100120         Nairn Michelle
100125         Stevenson Gabrielle
100127         Wendling Jason
100200         Zobitz Beth
100204         Keck David
100206         Xolo Kathleen
100209         Yates Tina
100220         Vigus Todd
100330         Gustavel Kristen
100365         Cheswick Sherman
100399         Day Ronald
100475         Hess Steve
100488         Osman Jamie
100550         Roland Allison
100559         Tyrie Meghan
100600         Zollman Calie
100650         Lilley Edna
100700         Jones Charles
100880         German Gary
100892         Platt Joseph
100944         Stahley Ryan
100967         Albregts Nicholas
100989         Deagen Kathryn
101007         Krasner Jason
101030         Moore Kristey
101045         Ortman Austin
101066         Rodgers Laura
101088         Underwood Patricha
101089         Alvarez Melissa
101097         Brose Jack
101115         Cochran Steve
101135         Deppe David
101154         Hettinger Gregory
101166         Reece Phil

*/

--Question 4c



--Question 5a
CREATE OR REPLACE PROCEDURE print_employee_roster 
(p_jobtitle IN employee.jobtitle%TYPE)
AS

    CURSOR all_employees 
    IS
        SELECT employeeid, lastname || ' ' || firstname AS name
        FROM employee
        WHERE upper(trim(jobtitle)) = upper(trim(p_jobtitle));

BEGIN

    FOR current_employee IN all_employees LOOP
        dbms_output.put(rpad(current_employee.employeeid, 15, ' '));
        dbms_output.put_line(current_employee.name);
    END LOOP;
END print_employee_roster;

--Question 5b
execute print_employee_roster('sales');
/*
100600         Zollman Calie
101007         Krasner Jason
101066         Rodgers Laura

*/

--Question 5c
execute print_employee_roster('assembly');
/*
100101         Rosner Joanne
100120         Nairn Michelle
100204         Keck David
100399         Day Ronald
100475         Hess Steve
100550         Roland Allison
100892         Platt Joseph
100967         Albregts Nicholas
100989         Deagen Kathryn
101030         Moore Kristey
101045         Ortman Austin
101088         Underwood Patricha
101089         Alvarez Melissa
101097         Brose Jack
101115         Cochran Steve
101135         Deppe David
101154         Hettinger Gregory
101166         Reece Phil

*/

--Question 5d
execute print_employee_roster('student');
/*
PL/SQL procedure successfully completed.
No output to DBMS
*/
--Question 6a
CREATE OR REPLACE PROCEDURE print_employee_roster 
(p_jobtitle IN employee.jobtitle%TYPE) AS

    CURSOR all_employees 
    IS
        SELECT employeeid, lastname || ' ' || firstname AS name
        FROM employee
        WHERE upper(trim(jobtitle)) = upper(trim(p_jobtitle));

BEGIN

    FOR current_employee IN all_employees LOOP
        dbms_output.put(rpad(current_employee.employeeid, 15, ' '));
        dbms_output.put_line(current_employee.name);
    END LOOP;
    
EXCEPTION

WHEN OTHERS THEN
    dbms_output.put (SQLCODE);
    dbms_output.put(': ');
    dbms_output.put_line(substr(SQLERRM, 1, 100));
END print_employee_roster;

--Question 6b
execute print_employee_roster('assembly');
/*
100101         Rosner Joanne
100120         Nairn Michelle
100204         Keck David
100399         Day Ronald
100475         Hess Steve
100550         Roland Allison
100892         Platt Joseph
100967         Albregts Nicholas
100989         Deagen Kathryn
101030         Moore Kristey
101045         Ortman Austin
101088         Underwood Patricha
101089         Alvarez Melissa
101097         Brose Jack
101115         Cochran Steve
101135         Deppe David
101154         Hettinger Gregory
101166         Reece Phil


*/


--Question 6c
/*
The display to a user when an exception would occur woud be an error code/number and can come with a message. 
SQLCODE will display an error number with the most recent of errors. 
SQLERRM will display the message and the error number that it's associated with. 

https://www.oratable.com/sqlcode-and-sqlerrm/#:~:text=SQLCODE%20and%20SQLERRM%20are%20Oracle's,with%20its%20error%2Dnumber%20argument. 
*/

--Question 7a
CREATE OR REPLACE PROCEDURE customer_roster 
(p_state IN customer.STATE%TYPE) 
AS

    CURSOR all_customers 
    IS
        SELECT companyname,city, state
        FROM customer
        WHERE STATE = p_state;
        
    current_customer all_customers%rowtype;
BEGIN

    OPEN all_customers;
    FETCH all_customers INTO current_customer;
    WHILE all_customers%found LOOP
        dbms_output.PUT(rpad(nvl(current_customer.companyname, 'No Company'),15, ' '));
        dbms_output.PUT(rpad(current_customer.city, 15, ' '));
        dbms_output.put_line(current_customer.STATE);
    FETCH all_customers INTO current_customer;
    END LOOP;
    CLOSE all_customers;
    EXCEPTION
    WHEN OTHERS THEN
        dbms_output.PUT(SQLCODE);
        dbms_output.PUT(': ');
        dbms_output.put_line(substr(sqlerrm, 1, 100));
END customer_roster;

--Question 7b
execute customer_roster('GA');
--results
/*
No Company     Swainsboro     GA
No Company     Athens         GA
No Company     Macon          GA
No Company     Nahunta        GA
Family Medical Adel           GA
Down Deep DrillElberton       GA
*/




--Question 8a
CREATE OR REPLACE PROCEDURE customer_search 
(p_name IN customer.custlastname%TYPE)
AS

    CURSOR all_customers IS
    SELECT companyname, custfirstname, custlastname, custtitle
    FROM customer
    WHERE upper(trim(custlastname)) like upper(trim('%' || p_name || '%'));
    
    current_customer all_customers%rowtype;
BEGIN
    OPEN all_customers;
    FETCH all_customers INTO current_customer;
    WHILE all_customers%found LOOP
        dbms_output.put(NVL(current_customer.companyname, 'No Company') || ':');
        dbms_output.put(rpad(current_customer.custtitle, 5, ' '));
        dbms_output.put(rpad(current_customer.custfirstname, 10, ' '));
        dbms_output.put_line(current_customer.custlastname);
    FETCH all_customers INTO current_customer;
    END LOOP;

    CLOSE all_customers;

    exception
    when others then
        dbms_output.put (SQLCODE);
        dbms_output.put(': ');
        dbms_output.put_line(substr(SQLERRM, 1, 100));
END customer_search;



--Question 8b
execute customer_search('NA');
/*
Bobs Repair Service:Mr.  Daniel    Hundnall
Automart:Ms.  Jessica   Nakamura
No Company:Dr.  Dorlan    Bresnaham
No Company:Mr.  Jay       Hanau
No Company:Mr.  Matt      Nakanishi
No Company:Mr.  Jim       Manaugh

*/


--Question 8c
CREATE OR REPLACE PROCEDURE customer_search 
(p_name IN customer.custlastname%TYPE)
AS
    CURSOR all_customers IS
    SELECT companyname, custfirstname, custlastname, custtitle
    FROM customer
    WHERE upper(trim(custfirstname)) like upper(trim('%' || p_name || '%')) or upper(trim(custlastname)) like upper(trim('%' || p_name || '%')) ;

    current_customer all_customers%rowtype;
BEGIN
    OPEN all_customers;
    FETCH all_customers INTO current_customer;
    WHILE all_customers%found LOOP
        dbms_output.put(NVL(current_customer.companyname, 'No Company') || ':');
        dbms_output.put(rpad(current_customer.custtitle, 5, ' '));
        dbms_output.put(rpad(current_customer.custfirstname, 10, ' '));
        dbms_output.put_line(current_customer.custlastname);
    FETCH all_customers INTO current_customer;
    END LOOP;
    CLOSE all_customers;

    exception
    when others then
        dbms_output.put (SQLCODE);
        dbms_output.put(': ');
        dbms_output.put_line(substr(SQLERRM, 1, 100));
END customer_search;

--Question 8d
execute customer_search('na');
/*
Bobs Repair Service:Mr.  Daniel    Hundnall
Automart:Ms.  Jessica   Nakamura
No Company:Dr.  Anna      Mayton
No Company:Mr.  Ronald    Miller
No Company:Dr.  Dorlan    Bresnaham
No Company:Ms.  Verna     McGrew
No Company:Mrs. Christina Wilson
No Company:Mr.  Jay       Hanau
No Company:Mr.  Matt      Nakanishi
No Company:Mrs. Nancy     Basham
No Company:Mr.  Jim       Manaugh
No Company:Mr.  Jonathon  Blanco

*/

--Question 8e
CREATE OR replace procedure customer_search
(p_name IN customer.custlastname%TYPE) 
as

    cursor all_customers 
    IS
    SELECT companyname, custfirstname, custlastname, custtitle
    FROM customer
    WHERE upper(TRIM(custfirstname)) LIKE upper(TRIM('%' || p_name || '%')) OR upper(TRIM(custlastname)) LIKE upper(TRIM('%' || p_name || '%'));

BEGIN
    FOR current_customer IN all_customers LOOP
        dbms_output.put(nvl(current_customer.companyname, 'No Company') || ': ');
        dbms_output.put(rpad(current_customer.custtitle, 5, ' '));
        dbms_output.put(rpad(current_customer.custfirstname, 10, ' '));
        dbms_output.put_line(current_customer.custlastname);
    END LOOP;
END customer_search;


--Question 8f
EXECUTE customer_search('na');
/*
Bobs Repair Service: Mr.  Daniel    Hundnall
Automart: Ms.  Jessica   Nakamura
No Company: Dr.  Anna      Mayton
No Company: Mr.  Ronald    Miller
No Company: Dr.  Dorlan    Bresnaham
No Company: Ms.  Verna     McGrew
No Company: Mrs. Christina Wilson
No Company: Mr.  Jay       Hanau
No Company: Mr.  Matt      Nakanishi
No Company: Mrs. Nancy     Basham
No Company: Mr.  Jim       Manaugh
No Company: Mr.  Jonathon  Blanco
*/