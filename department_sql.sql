create database department;
use department;

create table dept( DEPTNO int PRIMARY KEY, DNNAME varchar(255), LOC varchar(255));

Rename table dept to department;
Select * from department;

ALTER table department ADD COLUMN PINCODE int NOT NULL default 0;

Alter table department change DNNAME DEPT_NAME varchar(255);
Alter table department modify LOC CHAR(20);

Drop table department;