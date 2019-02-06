create database employee;
use employee;
create table EMP(empno numeric(10) not null,
ename varchar(10), job char(20), mgr numeric(10), hiredate date,
sal numeric(10), comm numeric(10), deptno numeric(10), 
primary key(empno));

create table dept(deptno numeric(10) not null,
dname varchar(10), loc varchar(10), primary key(deptno));

insert into emp values(7369,'SMITH','CLEARK',7902,'1980-12-17',800,null,20);
insert into emp values(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
insert into emp values(7521,'WARDS','SALESMAN',7698,'1981-02-22',1250,500,30);
insert into emp values(7566,'JHONS','MANAGER',7839,'1981-04-02',2975,null,20);
insert into emp values(7653,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);
insert into emp values(7698,'BAKE','MANAGER',7839,'1981-01-05',2850,null,30);
insert into emp values(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,null,10);
insert into emp values(7788,'SCOTT','ANALYST',7566,'1981-12-09',3000,null,20);
insert into emp values(7839,'KING','PRESIDENT',null,'1981-11-17',5000,null,10);

insert into emp values(7874,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
insert into emp values(7876,'ADAM','CLEARK',7788,'1983-01-12',1100,null,20);
insert into emp values(7900,'JAMES','CLEARK',7698,'1981-12-03',950,null,30);
insert into emp values(7902,'FORD','ANALYST',7566,'1981-12-04',3000,null,20);
insert into emp values(7934,'MILLER','CLEARK',7782,'1982-01-23',1300,null,10);

select * from emp;

insert into dept values(20,'RESEARCH','DALLAS');
insert into dept values(10,'ACCOUNTING','NEW YORK');
insert into dept values(30,'SALES','CHICAGO');
insert into dept values(40,'OPERATIONS','BOSTON');
alter table emp add foreign key(deptno) references dept(deptno);


##assignment 8 
select * from emp;
##a
SELECT ename FROM emp where job="analyst" or job="Salesman";
##b
SELECT * FROM emp where hiredate<"1981-09-30";
##c
SELECT ename FROM emp where job!="Manager";
##d
SELECT ename FROM emp where empno="7369" or empno="7521" or empno="7839" or empno="7788";
##e
SELECT * FROM emp where deptno="20";
##f
SELECT ename FROM emp where hiredate between "1981-06-30" and "1981-12-31";
##g
SELECT distinct job FROM emp;
##h
SELECT ename FROM emp where comm is null or comm="null";
##i
SELECT ename FROM emp where mgr is null;
##j
SELECT * FROM emp where deptno is null;
##k
SELECT * FROM emp where comm is NOT null;
##l
SELECT * FROM emp where ename like '%s' or ename like 'S%';
##m
SELECT ename FROM emp where ename like '_i%';
##n
SELECT count(distinct empno) FROM emp;
##o
SELECT count(distinct job) FROM emp;
##p
SELECT sum(sal) FROM emp;
##q
SELECT max(sal) as maxsalary, avg(sal) as averagesalary, min(sal) as minimumsalary FROM emp;
##r
SELECT max(sal) FROM emp where job="Salesman";
##END OF ASSIGNMENT 8

##START OF ASSIGNMENT 11
##a
SELECT job, avg(sal), deptno FROM emp where deptno="20" having avg(sal)>1000;
##b
SELECT ename, sal, ((sal/100))*10 as PF FROM emp;
##d
SELECT * FROM emp order by sal;
##e
SELECT ename, sal, ((sal/100)*10) as PF, ((sal/100)*50) as HRA, ((sal/100)*30) as DA, (((sal/100)*10)+((sal/100)*50)+((sal/100)*30)+sal) as gross FROM emp order by gross;
##f
SELECT deptno, count(*) FROM emp group by deptno;
##g
SELECT deptno, sum(sal) FROM emp group by deptno;
##h
SELECT  job, count(*) as count FROM emp group by job order by count Desc;
##i
SELECT max(sal), min(sal), avg(sal), sum(sal), job FROM emp group by job;
##j
SELECT max(sal),min(sal),avg(sal),sum(sal), deptno FROM emp where deptno="20";
##k
SELECT job, avg(sal), deptno FROM emp where deptno="20" having avg(sal)>1000;



Create Table Trainer (
TrainerID numeric(2) Primary Key,
TrainerName varchar(10) Not Null,
EmailID varchar(10) Unique,
Phone varchar(10)
);

Insert into Trainer values (1, 'Abraham', 't1@i.com','9844499901');
Insert into Trainer values (2, 'Boyce', 't2@i.com','9844499902');
Insert into Trainer values (3, 'Camilla', 't3@i.com','9844499903');
Insert into Trainer values (4, 'Davis', 't4@i.com','9844499904');
Insert into Trainer values (5, 'Elsa', 't5@i.com','9844499905');

Create Table Course_Details (
 CourseID Char(3) Primary Key,
 CourseName varchar(30) Not Null
);

Insert into Course_Details values('GPF', 'Programming Fundamentals');
Insert into Course_Details values('GDB', 'RDBMS');
Insert into Course_Details values('ODB', 'Oracle 9i');
Insert into Course_Details values('OVB', 'Visual Basic');
Insert into Course_Details values('JJA', 'Java');
Insert into Course_Details values('JJE', 'Java JEE1');

Create Table Batch_Schedule (
BatchName varchar(8),
CourseID Char(3) References Course_Details(CourseID),
Start_Date Date Not Null,
End_Date Date Not Null,
Constraint pk_BS Primary Key (BatchName,CourseID)
); 

Insert into Batch_Schedule values ('Batch1', 'GPF', '2008-01-10', '2008-01-20');
Insert into Batch_Schedule values ('Batch1', 'GDB', '2008-01-21', '2008-01-31');
Insert into Batch_Schedule values ('Batch1', 'ODB', '2008-02-01', '2008-02-20');
Insert into Batch_Schedule values ('Batch1', 'OVB', '2008-02-21', '2008-02-28');
Insert into Batch_Schedule values ('Batch2', 'GPF', '2008-01-10', '2008-01-20');
Insert into Batch_Schedule values ('Batch3', 'GPF', '2008-01-21', '2008-02-01');
Insert into Batch_Schedule values ('Batch3', 'JJA', '2008-02-02', '2008-02-08');

Create Table FeedBack(
TrainerID numeric(2) References Trainer(TrainerID),
CourseID Char(3),
BatchName varchar(8) ,
FBRate numeric(3,2) Not Null Check (FBRate between 0 and 5),
Constraint fk_FB_CID_BN Foreign Key (BatchName, CourseID) References Batch_Schedule(BatchName,CourseID),
Constraint pk_FB Primary Key (TrainerID,CourseID,BatchName)
);

Insert into Feedback values (1, 'GPF','Batch1',4.18);
Insert into Feedback values (2, 'GDB','Batch1',4.65);
Insert into Feedback values (3, 'ODB','Batch1',4.51);
Insert into Feedback values (4, 'OVB','Batch1',4.68);
Insert into Feedback values (5, 'GPF','Batch2',4.28);
Insert into Feedback values (1, 'GPF','Batch3',4.28);
Insert into Feedback values (3, 'JJA','Batch3',4.32);

##START OF ASSIGNMENT 12
##a
select distinct t.trainerName, c.CourseName from trainer t, feedback f, course_details c
where t.trainerId = f.trainerId and f.courseId = c.courseId;
##b
select distinct t.trainerName from trainer t, feedback f 
where t.trainerId = f.trainerId;
##c
select t.trainerId, t.trainerName, count(distinct c.courseName) from trainer t, feedback f, course_details c
where t.trainerId = f.trainerId and f.courseId=c.courseId group by t.trainerName; 
##d
select t.trainerId, t.trainerName, c.CourseName, count(c.courseId)
from trainer t, feedback f, course_details c
where t.trainerId = f.trainerId and c.courseId=f.courseId 
group by c.courseId;
##g
select f.BatchName, t.trainerId from trainer t, feedback f 
where t.trainerId = f.trainerId;
##h
select t.trainerName from trainer t inner join feedback f on t.trainerId = f.trainerId
group by t.trainerId
having count(*) = (select count(*) from course_details); 

select * from emp;
