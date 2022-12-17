--You will be working with the following tables and data, which you can download from Brightspace:DROP TABLE CLASS;DROP TABLE STUDENT;------CREATE TABLE CLASS (     CLASSNO NUMBER(3) PRIMARY KEY,     CLASSNAME  VARCHAR2(50),     DEPT    VARCHAR2(25));INSERT INTO CLASS VALUES (101,'Intro Civ','Hist');INSERT INTO CLASS VALUES (201,'Med Europe','Hist');INSERT INTO CLASS VALUES (305,'Ethics','Phil');INSERT INTO CLASS VALUES (401,'Database Management','CNIT');INSERT INTO CLASS VALUES (102,'Technical writing','ENGL');------CREATE TABLE student (    studno     NUMBER(4) PRIMARY KEY,    lastname   VARCHAR2(20),    major      VARCHAR2(9),    enrolldate DATE,    gpa        NUMBER(7, 2),    classno    NUMBER(3));INSERT INTO STUDENT VALUES (7369,'SMITH','HIST','17-DEC-1980',3.5,201);INSERT INTO STUDENT VALUES (7499,'ALLEN','CS','20-FEB-1981',2.8,305);INSERT INTO STUDENT VALUES (7521,'WARD','CS','22-FEB-1981',3.0,305);INSERT INTO STUDENT VALUES (7566,'JONES','CNIT','2-APR-1981',2.5,401);INSERT INTO STUDENT VALUES (7654,'MARTIN','CS','28-SEP-1981',3.1,305);INSERT INTO STUDENT VALUES (7698,'BLAKE','CNIT','1-MAY-1981',3.75,305);INSERT INTO STUDENT VALUES (7782,'CLARK','CNIT','9-JUN-1981',3.4,101);INSERT INTO STUDENT VALUES (7788,'SCOTT','PHIL','09-DEC-1982',2.9,201);INSERT INTO STUDENT VALUES (7839,'KING','MGN','17-NOV-1981',2.9,101);INSERT INTO STUDENT VALUES (7844,'TURNER','CS','8-SEP-1981',2.8,305);INSERT INTO STUDENT VALUES (7876,'ADAMS','HIST','12-JAN-1983',3.3,201);INSERT INTO STUDENT VALUES (7900,'JAMES','HIST','3-DEC-1981',3.2,305);INSERT INTO STUDENT VALUES (7902,'FORD','PHIL','3-DEC-1981',3.6,201);INSERT INTO STUDENT VALUES (7934,'MILLER','HIST','23-JAN-1982',3.9,101);-- Question 5:(select firstname || ' '|| lastname AS Person_of_Interest, homephone,     nvl(emailaddr, 'Empty email'), 'Eagle Electronics' as Employer, streeetaddress     from employees    where jobtitle = 'Assembly'  and substr(phone,1,3) != 919)UNION(select custfirstname || ' '|| custlastname AS Person_of_Interest, phone,     nl(emailaddr, 'Empty email'), compayname, address      from customer    where (companyname is not null and address like 'Rd.'  and state in ('OH', 'IN', 'MI', 'KY', 'ND'))  or substr(phone,1,3) = 898 and state = 'CT'  and substr(phone,-1,1) != substr(fax,-1,1))