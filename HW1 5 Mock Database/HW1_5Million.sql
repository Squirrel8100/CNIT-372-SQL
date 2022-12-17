/*
Instructions: 
1. Run the Drop Table in case This table already exsists
2. Run the Create Table Block
3. Run the 3rd Step Block. Starting with the Declare and ending with END.  This Inserts the looped arrays of data into the DEMO Table
4. Run the Querys Below Individually. 
They Demonstrate # of rows overall,  # of rows for each object, and the count of all Distinct Data within the Table. (more than 5mil.)
*/


drop table DEMO; --DROP IF TABLE ALREADY EXSISTS... SHOULDNT BE NEEDED

--Create table to insert data into. 
--create table DEMO ("FirstName" varchar2(15), "LastName" varchar2(15), "City" varchar2(25), "State" varchar2(2)) ;
CREATE TABLE DEMO (
FirstName varchar2(15),
LastName varchar2(15),
City varchar2(25),
State varchar2(2)
);


--Declaring the arrays of random insert items. 
--Beginning of 3rd Step
declare
--First Name
 type FirstName_array is varray(100) of varchar(15);
 FirstName FirstName_array := FirstName_array('Aaren', 'Aarika', 'Abagael', 'Abagail', 'Abbe', 'Abbey', 'Abbi', 'Abbie', 'Abby', 'Abbye', 'Abigael', 'Abigail', 'Abigale', 'Abra', 'Ada', 'Adah', 'Adaline', 'Adan', 'Adara', 'Adda', 'Addi', 'Addia', 'Addie', 'Addy', 'Adel', 'Adela', 'Adelaida', 'Adelaide', 'Adele', 'Adelheid', 'Adelice', 'Adelina', 'Adelind', 'Adeline', 'Adella', 'Adelle', 'Adena', 'Adey', 'Adi', 'Adiana', 'Adina', 'Adora', 'Adore', 'Adoree', 'Adorne', 'Adrea', 'Adria', 'Adriaens', 'Adrian', 'Adriana', 'Adriane', 'Adrianna', 'Adrianne', 'Adriena', 'Adrienne', 'Aeriel', 'Aeriela', 'Aeriell', 'Afton', 'Ag', 'Agace', 'Agata', 'Agatha', 'Agathe', 'Aggi', 'Aggie', 'Aggy', 'Agna', 'Agnella', 'Agnes', 'Agnese', 'Agnesse', 'Agneta', 'Agnola', 'Agretha', 'Aida', 'Aidan', 'Aigneis', 'Aila', 'Aile', 'Ailee', 'Aileen', 'Ailene', 'Ailey', 'Aili', 'Ailina', 'Ailis', 'Ailsun', 'Ailyn', 'Aime', 'Aimee', 'Aimil', 'Aindrea', 'Ainslee', 'Ainsley', 'Ainslie', 'Ajay', 'Alaine', 'Alameda', 'Alana');
 -- https://github.com/dominictarr/random-name/blob/master/first-names.txt (only used 100 of the first names)
 
 --Last Name
  type LastName_array is varray(100) of varchar(15);
 LastName LastName_array := LastName_array('SMITH', 'JOHNSON', 'WILLIAMS', 'JONES', 'BROWN', 'DAVIS', 'MILLER', 'WILSON', 'MOORE', 'TAYLOR', 'ANDERSON', 'THOMAS', 'JACKSON', 'WHITE', 'HARRIS', 'MARTIN', 'THOMPSON', 'GARCIA', 'MARTINEZ', 'ROBINSON', 'CLARK', 'RODRIGUEZ', 'LEWIS', 'LEE', 'WALKER', 'HALL', 'ALLEN', 'YOUNG', 'HERNANDEZ', 'KING', 'WRIGHT', 'LOPEZ', 'HILL', 'SCOTT', 'GREEN', 'ADAMS', 'BAKER', 'GONZALEZ', 'NELSON', 'CARTER', 'MITCHELL', 'PEREZ', 'ROBERTS', 'TURNER', 'PHILLIPS', 'CAMPBELL', 'PARKER', 'EVANS', 'EDWARDS', 'COLLINS', 'STEWART', 'SANCHEZ', 'MORRIS', 'ROGERS', 'REED', 'COOK', 'MORGAN', 'BELL', 'MURPHY', 'BAILEY', 'RIVERA', 'COOPER', 'RICHARDSON', 'COX', 'HOWARD', 'WARD', 'TORRES', 'PETERSON', 'GRAY', 'RAMIREZ', 'JAMES', 'WATSON', 'BROOKS', 'KELLY', 'SANDERS', 'PRICE', 'BENNETT', 'WOOD', 'BARNES', 'ROSS', 'HENDERSON', 'COLEMAN', 'JENKINS', 'PERRY', 'POWELL', 'LONG', 'PATTERSON', 'HUGHES', 'FLORES', 'WASHINGTON', 'BUTLER', 'SIMMONS', 'FOSTER', 'GONZALES', 'BRYANT', 'ALEXANDER', 'RUSSELL', 'GRIFFIN', 'DIAZ', 'HAYES' );
--https://github.com/arineng/arincli/blob/master/lib/last-names.txt 
 --City
 type City_array is varray(115) of varchar(25);
 City City_array := City_array('Aberdeen', 'Abilene', 'Akron', 'Albany', 'Albuquerque', 'Alexandria', 'Allentown', 'Amarillo', 'Anaheim', 'Anchorage', 'Ann Arbor', 'Antioch', 'Apple Valley', 'Appleton', 'Arlington', 'Arvada', 'Asheville', 'Athens', 'Atlanta', 'Atlantic City', 'Augusta', 'Aurora', 'Austin', 'Bakersfield', 'Baltimore', 'Barnstable', 'Baton Rouge', 'Beaumont', 'Bel Air', 'Bellevue', 'Berkeley', 'Bethlehem', 'Billings', 'Birmingham', 'Bloomington', 'Boise', 'Boise City', 'Bonita Springs', 'Boston', 'Boulder', 'Bradenton', 'Bremerton', 'Bridgeport', 'Brighton', 'Brownsville', 'Bryan', 'Buffalo', 'Burbank', 'Burlington', 'Cambridge', 'Canton', 'Cape Coral', 'Carrollton', 'Cary', 'Cathedral City', 'Cedar Rapids', 'Champaign', 'Chandler', 'Charleston', 'Charlotte', 'Chattanooga', 'Chesapeake', 'Chicago', 'Chula Vista', 'Cincinnati', 'Clarke County', 'Clarksville', 'Clearwater', 'Cleveland', 'College Station', 'Colorado Springs', 'Columbia', 'Columbus', 'Concord', 'Coral Springs', 'Corona', 'Corpus Christi', 'Costa Mesa', 'Dallas', 'Daly City', 'Danbury', 'Davenport', 'Davidson County', 'Dayton', 'Daytona Beach', 'Deltona', 'Denton', 'Denver', 'Des Moines', 'Detroit', 'Downey', 'Duluth', 'Durham', 'El Monte', 'El Paso', 'Elizabeth', 'Elk Grove', 'Elkhart', 'Erie', 'Escondido', 'Eugene', 'Evansville', 'Fairfield', 'Fargo', 'Fayetteville', 'Fitchburg', 'Flint', 'Fontana', 'Fort Collins', 'Fort Lauderdale', 'Fort Smith', 'Fort Walton Beach', 'Fort Wayne', 'Fort Worth', 'Frederick');
 --https://www.storagecafe.com/blog/top-15-most-common-city-and-town-names-in-the-us/
 
 --State
 type State_array is varray(51) of varchar(2);
 State State_array := State_array('AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA',
           'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME',
           'MI', 'MN', 'MO', 'MS', 'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM',
           'NV', 'NY', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX',
           'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY' );


 -- declare the collection
 type DEMO_record_type is record ("FirstName" varchar2(15), "LastName" varchar2(15), "City" varchar2(25), "State" varchar2(2)) ;
 type DEMO_collection_type is table of DEMO_record_type index by binary_integer;
 DEMO_collection DEMO_collection_type;
begin
 -- fill the collection
 for i in 1..7e6 loop  --" 5e6 is 5 Million"... 7 is 7 million. 
  DEMO_collection(i)."FirstName":=FirstName( dbms_random.value(1,FirstName.count) );
    DEMO_collection(i)."LastName":=LastName( dbms_random.value(1,LastName.count) );
        DEMO_collection(i)."City":=City( dbms_random.value(1,City.count) );
            DEMO_collection(i)."State":=State( dbms_random.value(1,State.count) );
  null;
 end loop;
 -- call the insert
 forall i in 1..DEMO_collection.count insert into DEMO values DEMO_collection(i);
 commit;
end;
--End of 3rd Step


--Count of Total Records
Select count(*) from DEMO;

--View of the Records
select * from DEMO; 

--Count of Distinct Records for each Object
select Distinct City from DEMO;
select Distinct State from DEMO;
select Distinct FirstName from DEMO;
select Distinct LastName from DEMO;


-- Count of all Distinct Records within the Table
select count(*)
from ( select distinct * from DEMO);
--Results at a specifc time of running. 
/*
  COUNT(*)
----------
   6588968
*/
