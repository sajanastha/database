create database COMPANYDB; 
use COMPANYDB;
create table DEPARTMENT (
DNAME varchar(20),
DNUMBER int primary key,
MGRSSN varchar(20),
MGSTARTDTAE date);

create table EMPLOYEE(
FNAME char(1),
LNAME varchar(15),
SSN varchar(15) primary key,
BDTAE date,
ADDRESS varchar(100),
SEX char(1),
SALARY int,
SUPERSSN varchar(15),
DNO int,
foreign key(DNO)
references DEPARTMENT(DNUMBER));

INSERT INTO DEPARTMENT VALUES
('Research', 1, '123456789', '2020-01-15'),
('Administration', 2, '987654321', '2019-05-20'),
('IT Services', 3, '555123456', '2021-03-10'),
('Human Resources', 4, '777888999', '2018-11-01');

INSERT INTO EMPLOYEE VALUES
('J', 'English', '444555666', '1992-03-05', '5631 Rice, Houston, TX', 'F', 35000, '987654321', 2),
('R', 'Narayan', '555123456', '1990-09-15', '975 Fire Oak, Humble, TX', 'M', 50000, NULL, 3),
('A', 'Jabbar', '666777888', '1993-06-20', '980 Dallas, Houston, TX', 'M', 38000, '555123456', 3),
('J', 'Borg', '777888999', '1982-11-10', '450 Stone, Houston, TX', 'M', 48000, NULL, 4),
('A', 'Wallace', '888999000', '1995-02-28', '291 Berry, Bellaire, TX', 'F', 32000, '777888999', 4);

Select * from Department;
Select * from Employee;

#q1 10% Salary Raise for Research Department
select E.FNAME, E.LNAME, E.SALARY * 1.1 as 
increased_salary from EMPLOYEE E
join DEPARTMENT D on E.DNO=D.DNUMBER
where D.DNAME= 'Research';  

#2 Salary Statistics of accounts department sum,max,min,aug fro department administration
Select sum(E.SALARY) as total, max(E.SALARY) as max,
min(E.SALARY) as min, avg(E.SALARY) as average
from EMPLOYEE E
join DEPARTMENT D on E.DNO=D.DNUMBER
where D.DNAME= 'administration'; 

#q3 Employee controlled by department nno.5 (/3)
select E.FNAME, E.LNAME from EMPLOYEE  E where E.DNO=3;

#q4 Departments Having At least 2 employees
SELECT D.DNAME, count(*) as EMP_count
From EMPLOYEE E
join DEPARTMENT D on E.DNO = D.DNUMBER
GROUP BY D.DNUMBER,D.DNAME
HAVING count(*) >=2;

#q5 Employees born in 1950(1955-1999)
select * from EMPLOYEE
where year(BDTAE) between 1955 and 1999