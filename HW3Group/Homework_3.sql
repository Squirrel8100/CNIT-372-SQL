
--Question 0a.

drop table HW3_ZIPCODE cascade constraints;

create table HW3_ZIPCODE
(
zipcode varchar2(10),
state varchar2(2),
city varchar2(20),
latitude number(10,6),
longitude number(10,6),
update_time varchar2(25),
update_status varchar2(5)
);

/
/

--Question 0b.


Step 1
Expand Tables on left panel and select HW3_ZIPCODE

Step 2
Right Click on HW3_ZIPCODE and select Import Data...

Step 3
In File Section, select Browse and choose zipCodes_1990Census_clean.txt, uncheck Header box, then click Next

Step 4
Select Insert for Import Method, then click Next

Step 5
Make sure all columns are selected (they should be by default), then click Next

Step 6
Choose Position for Match By, switch the position of column 4 and 5, then click Next

Step 7
Check over everything then click Finish

Step 8
Select all from table to check that it inserted correctly


** same for zipCodes_supplemental.xlsx file **
/
/


--Question 0c

Select count(*), zipcode
from HW3_ZIPCODE
group by zipcode
having count(*) > 1;

/
/

--Question 0d

select postalcode
from customer
union 
select postalcode
from employee
union
select postalcode
from supplier
minus
select zipcode
from hw3_zipcode;

select zipcode
from hw3_zipcode
where zipcode = 58026 or zipcode = 592331 or zipcode = 80761;

select *
from customer
where postalcode = 58026;

select *
from customer
where postalcode = 592331;

select *
from customer
where postalcode = 80761;
/
/*

--Question 0e
select * from HW3_ZIPCODE;

insert into HW3_ZIPCODE (zipcode, state, city, latitude, longitude, update_status, update_time)
    Values ('58026', 'ND', 'GRAND FORKS', 47.9253, 97.0329, 'True',  '27-OCT-21');
insert into HW3_ZIPCODE (zipcode, state, city, latitude, longitude, update_status, update_time)
    Values ('592331', 'MT', 'GLASGOW', 48.1970, 106.6367, 'True', '27-OCT-21');
insert into HW3_ZIPCODE (zipcode, state, city, latitude, longitude, update_status, update_time)
    Values ('80761', 'CO', 'HAXTUN', 40.6411, 102.6269, 'True', '27-OCT-21');
    
Select *
from HW3_ZIPCODE
where zipcode = '58026' or zipcode = '592331' or zipcode = '80761';

/
/

--Question 0f

select postalcode
from customer
union 
select postalcode
from employee
union
select postalcode
from supplier
minus
select zipcode
from HW3_ZIPCODE;

/
/

--Question 1-6

/*package specification*/
/* DEGREES_TO_RADIANS was not included in package specification, because the function should be only internally accessible to the HW3 package*/

CREATE OR REPLACE PACKAGE HW_3 AS

FUNCTION KM_TO_MILES(p_KILOMETERS NUMBER) RETURN NUMBER;
FUNCTION DISTANCE_BETWEEN_ZIPS (p_ZIPCODE_ONE in varchar, p_ZIPCODE_TWO in varchar)RETURN NUMBER;
FUNCTION DISTANCE_BETWEEN_ZIPS (p_ZIPCODE_TWO in varchar)RETURN NUMBER;
PROCEDURE POI_WITHIN_DISTANCE (P_MILES IN NUMBER);
FUNCTION POI_DENSITY (P_MILES IN NUMBER) RETURN NUMBER;

END HW_3;

/*package body*/

CREATE OR REPLACE PACKAGE BODY HW_3 AS

function DEGREES_TO_RADIANS 
(p_DEGREES in NUMBER)
return NUMBER
is v_RADIANS NUMBER;
begin 
    v_RADIANS := p_DEGREES * 3.1415926/180;
    return v_RADIANS;

end DEGREES_TO_RADIANS;

function KM_TO_MILES 
(p_KILOMETERS in number)
return number
is v_MILES NUMBER;
begin 
    v_MILES := p_KILOMETERS * 0.621371192;
    return v_MILES;
end KM_TO_MILES;

function DISTANCE_BETWEEN_ZIPS
(p_ZIPCODE_ONE in varchar, p_ZIPCODE_TWO in varchar)
return number
is  v_lat1 NUMBER;
    v_lat2 NUMBER;
    v_lon1 NUMBER;
    v_lon2 NUMBER;
    v_distance NUMBER;
    v_count1 NUMBER;
    v_count2 NUMBER;
    z1temp NUMBER;
    z2temp NUMBER;
    
    CURSOR info_zipcode1
    IS 
        SELECT latitude, longitude from HW3_ZIPCODE where zipcode = p_ZIPCODE_ONE;
    
    CURSOR info_zipcode2
    IS
        SELECT latitude, longitude from HW3_ZIPCODE where zipcode = p_ZIPCODE_TWO;
        

begin 
select(
SELECT COUNT(zipcode) FROM HW3_ZIPCODE WHERE ZIPCODE=p_ZIPCODE_ONE)
into z1temp
from dual;

select(
SELECT COUNT(zipcode) FROM HW3_ZIPCODE WHERE ZIPCODE=p_ZIPCODE_TWO)
into z2temp
from dual;

    IF z1temp='0'  then 
    begin
        v_distance := -1;
        return v_distance;
    END;
    END IF;
    
    IF z2temp='0'  then 
    begin
        v_distance := -1;
        return v_distance;
    END;  
        
    end if;

    
    open info_zipcode1;
    open info_zipcode2;
    fetch info_zipcode1 into v_lat1, v_lon1;
    fetch info_zipcode2 into v_lat2, v_lon2;
    
    
    v_distance := POWER(SIN((DEGREES_TO_RADIANS(v_lat2) - DEGREES_TO_RADIANS(v_lat1))/2),2)
+ COS(DEGREES_TO_RADIANS(v_lat1)) * COS(DEGREES_TO_RADIANS(v_lat2)) *
  POWER(SIN((DEGREES_TO_RADIANS(v_lon2) - DEGREES_TO_RADIANS(v_lon1))/2),2);
    return ROUND(6367 * 2 * ATAN2(SQRT(v_distance), SQRT(1-v_distance)),1);
    
    close info_zipcode1;
    close info_zipcode2;
 
exception 
    when others then 
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));

end DISTANCE_BETWEEN_ZIPS;


function DISTANCE_BETWEEN_ZIPS
(p_ZIPCODE_TWO in varchar)
return number
is  v_lat1 NUMBER;
    v_lat2 NUMBER;
    v_lon1 NUMBER;
    v_lon2 NUMBER;
    v_distance NUMBER;
    v_count1 NUMBER;
    v_count2 NUMBER;
    z1temp NUMBER;
    z2temp NUMBER;
    
    CURSOR info_zipcode1
    IS 
        SELECT latitude, longitude from HW3_ZIPCODE where zipcode = '33605';
    
    CURSOR info_zipcode2
    IS
        SELECT latitude, longitude from HW3_ZIPCODE where zipcode = p_ZIPCODE_TWO;
        

begin 
select(
SELECT COUNT(zipcode) FROM HW3_ZIPCODE WHERE ZIPCODE='33605')
into z1temp
from dual;

select(
SELECT COUNT(zipcode) FROM HW3_ZIPCODE WHERE ZIPCODE=p_ZIPCODE_TWO)
into z2temp
from dual;

    IF z1temp='0'  then 
    begin
        v_distance := -1;
        return v_distance;
    END;
    END IF;
    
    IF z2temp='0'  then 
    begin
        v_distance := -1;
        return v_distance;
    END;  
        
    end if;

    
    open info_zipcode1;
    open info_zipcode2;
    fetch info_zipcode1 into v_lat1, v_lon1;
    fetch info_zipcode2 into v_lat2, v_lon2;
    
    
    v_distance := POWER(SIN((DEGREES_TO_RADIANS(v_lat2) - DEGREES_TO_RADIANS(v_lat1))/2),2)
+ COS(DEGREES_TO_RADIANS(v_lat1)) * COS(DEGREES_TO_RADIANS(v_lat2)) *
  POWER(SIN((DEGREES_TO_RADIANS(v_lon2) - DEGREES_TO_RADIANS(v_lon1))/2),2);
    return ROUND(6367 * 2 * ATAN2(SQRT(v_distance), SQRT(1-v_distance)),1);
    
    close info_zipcode1;
    close info_zipcode2;
 
exception 
    when others then 
        DBMS_OUTPUT.PUT (SQLCODE);
        DBMS_OUTPUT.PUT (': ');
        DBMS_OUTPUT.PUT_LINE (SUBSTR(SQLERRM, 1, 100));

end DISTANCE_BETWEEN_ZIPS;

PROCEDURE poi_within_distance (
    p_miles IN NUMBER
) AS
    v_number_of_persons_of_interest NUMBER := 0;
    cursor person_of_interest is
    select lastname || ', ' || firstname as name, 'Eagle Electronics' as companyname,
    'Employee' type, postalcode, city from employee
    union
    select custlastname || ', ' || custfirstname as name, 'N/A' as companyname,
    'Residential Customer' as type, postalcode, city from customer where companyname is NULL
    union
    select custlastname || ', ' || custfirstname as name, companyname,
    'Commercial Customer' as type, postalcode, city from customer where companyname is not NULL
    union
    select contactname as name, companyname, 'Supplier' as type, postalcode, city from supplier;
    person_of_interests_distance number;
    hold person_of_interest%rowtype;
BEGIN
    for person in person_of_interest loop
    select km_to_miles(distance_between_zips(person.postalcode)) into person_of_interests_distance from dual;
    fetch person_of_interest into hold;
    if person_of_interests_distance <= p_miles then
     dbms_output.put_line(hold.name || ' ' || hold.companyname || ' ' || hold.type);
    end if;
    end loop;
END poi_within_distance;

function poi_density(
    p_miles IN NUMBER
) RETURN NUMBER AS
    v_number_of_persons_of_interest NUMBER := 0;
    cursor person_of_interest is
    select lastname || ', ' || firstname as name, 'Eagle Electronics' companyname,
    'Employee' as type, postalcode, city from employee
    union
    select custlastname || ', ' || custfirstname as name, 'N/A' as companyname,
    'Residential Customer' as type, postalcode, city from customer where companyname is NULL
    union
    select custlastname || ', ' || custfirstname as name, companyname,
    'Commercial Customer' as type, postalcode, city from customer where companyname is not NULL
    union
    select contactname as name, companyname, 'Supplier' as type, postalcode, city from supplier;
    person_of_interests_distance number;
BEGIN
    for person in person_of_interest loop
    select km_to_miles(distance_between_zips(person.postalcode)) into person_of_interests_distance from dual;
   
    if person_of_interests_distance <= p_miles then
    v_number_of_persons_of_interest := v_number_of_persons_of_interest + 1;
    end if;
    end loop;

    return v_number_of_persons_of_interest;
end poi_density;

end HW_3;


--Question 9
--Private Test
select bonner12.HW_3.DEGREES_TO_RADIANS(180) from dual;

select na23.HW_3.DEGREES_TO_RADIANS(180) from dual;

select fishl.HW_3.DEGREES_TO_RADIANS(180) from dual;

select avejzovi.HW_3.DEGREES_TO_RADIANS(180) from dual;

--Public Test

--Question 10
--Private Test
select HW_3.DEGREES_TO_RADIANS(180) from dual;

--Public Test



================================RESULTS=======================================

--Q 0a.

Table HW3_ZIPCODE created.

/
/

--Q 0c.

0 rows selected. There are no repeating ZIPCODE.

/
/

--Q 0d.

ZIPCODE       
--------------
58026
592331
80761
58026
592331
80761

6 rows selected. 

There are three Eagle Electronic zipcodes that are not in the HW3_ZIPCODE table.
They are  58026, 592331 and 80761.

/
/

--Q 0e.


ZIPCODE    ST CITY                   LATITUDE  LONGITUDE UPDAT UPDATE_TI
---------- -- -------------------- ---------- ---------- ----- ---------
58026      ND GRAND FORKS             47.9253    97.0329 True  27-OCT-21
592331     MT GLASGOW                  48.197   106.6367 True  27-OCT-21
80761      CO HAXTUN                  40.6411   102.6269 True  27-OCT-21

3 rows selected. 

/
/

--Q Of.

no rows selected

/
/


--Q 1-6

Package HW_3 compiled

Package Body HW_3 compiled

/
/

-- Q7
/*
The purpose of making procedures or functions privately accessible in a package 
is mainly to hide or obscure it from any objects not residing in the package itself.
Essentially, this can be used to ensure proper scope is used especially when a
function or procedure in a package will certainly not be used outside of that 
specific package.  Conversely, functions or procedures that will be used outside
of the package will necessarily be defined as public so that the scope is expanded
and they can be utilized by external functions or procedures outside of the scope 
of the package.  For example, many of the conversions in 1-6 would likely be used 
outside of the package since they are declared as publicly accessible.  However,
the degrees to radians conversion would not be usable outside of the package since
it is defined as private/only internally accessible.
*/

--Q 8 
/* https://community.oracle.com/tech/developers/discussion/3928262/grant-execute-on-package-procedure

The 'grant execute' command can be used to grant permission to a specific user 
to be able to run or execute the package*/

grant execute on HW_3 to bonner12;

-- Q9
--Private Test Results:
ORA-00904: "AVEJZOVI"."HW_3"."DEGREES_TO_RADIANS": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
Error at Line: 7 Column: 8

-- Q10
--Private Test Results:
ORA-00904: "HW_3"."DEGREES_TO_RADIANS": invalid identifier
00904. 00000 -  "%s: invalid identifier"
*Cause:    
*Action:
Error at Line: 11 Column: 8
