--Person 1: Jamil Morgan
--Person 2: Logan Fish

--Question B1 P1 (17)
--Question B2 P1 (18)


--Question B3 P2 (19)
select * from Morga239.supervisor;
--results
/*

ID         EMPLOYEENUM
---------- -----------
100200               2
100559               5
100104               3
100944               5
100365               3
100127               2
100125               3
100206               1
100650               2
                     1
100330               2

ID         EMPLOYEENUM
---------- -----------
100209               4
100001               2
100103               2
100880               3

15 rows selected. 


*/
--Question B4 P1 (20)
--Question B5 P1 (21)


--Question B6 P2 (22)
select * from Morga239.supervisor;
/*

ID         EMPLOYEENUM
---------- -----------
100200               2
100559               5
100104               3
100944               5
100365               3
100127               2
100125               3
100206               1
100650               2
                     1
100330               2

ID         EMPLOYEENUM
---------- -----------
100209               4
100001               2
100103               2
100880               3

15 rows selected. 

*/
--The new employee is not listed because they are not a supervisor that is supervising anyone. 


--Question B7 P1 (23)
--Question B8 P2 (24)
select * from Morga239.supervisor;
--results
/*

ID         EMPLOYEENUM
---------- -----------
100200               3
100559               5
100104               3
100944               5
100365               3
100127               2
100125               3
100206               1
100650               2
                     1
100330               2

ID         EMPLOYEENUM
---------- -----------
100209               4
100001               2
100103               2
100880               3

15 rows selected. 


*/

--Question B9 P1 (25)
--Question B10 P1 (26)


--Question B11 P2 (27)
select * from Morga239.supervisor;
--results
/*

ID         EMPLOYEENUM
---------- -----------
100200               3
100559               5
100104               3
100944               5
100365               3
100127               2
100125               3
100206               1
100650               2
                     1
100330               2

ID         EMPLOYEENUM
---------- -----------
100209               4
100001               2
100103               2
100880               3

15 rows selected. 


*/
--The new employee is still there because there was no commit. 


--Question B12 P1 (28)
--Question B13 P2 (29)
select * from Morga239.supervisor;
--results
/*
Error report -
SQL Error: ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

*/

--Question B14 P1 (30)
--Question B15 Together (31)


--Question B16 Together (32)
--Role Privledges. 
--We are likely set as a student privledge and allowing for other people access based off privledge is a dangerous thing if implemented improperly. 
-- can lead to modifying others data or accessing things that were not desired to be shared. 






