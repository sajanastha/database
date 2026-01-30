#1.	Create a database named dbemp and switch to it.
create database dbemp1;
use dbemp1;
#2.	Create an employee table with appropriate data 
#types and constraints for employee details.
Create table employee (
	EmployeeID varchar(10),
    FirstName varchar(20),
    LastName varchar(20),
    Gender char(1),
    DateofBirth date,
    Designation varchar(20),
    DepartmentName varchar(20),
    ManagerId varchar(10),
    JoinedDate date,
    Salary decimal(10,0)
);
#3.	Insert at least two employee records into the employee table.
Insert into employee(
EmployeeID ,FirstName ,LastName ,Gender ,DateofBirth ,
Designation ,DepartmentName ,ManagerId ,JoinedDate ,Salary 
) values(
'001','Season','Maharjan','M','1996-04-02','Engineer',
'Software engineering','002','2022-11-02','5000000000'
),(
'003','Srijana','Maharjan','F','2000-04-02','Manager',
'Software engineering','005','2025-11-02','9000000'),
('004','Rain','Khadka','M','1990-12-01','Manager','Software Engineering','005','2015-03-15','1500000'),
('005','Raina','Tamang','F','1994-12-01','Senior Manager','Software Engineering','002','2015-03-15','1500000');

select * from employee;

#4 update gneder of an employee whose emplyee id is 003
update employee 
set Gender='M' where EmployeeID= '003';

#5 display the first name, cureent date, date of birth and age of employee who are older than 25 years
select FirstName, curdate() as CurrentDate, DateofBirth, timestampdiff(YEAR,DateofBirth,CURDATE()) as age from employee where
  timestampdiff(YEAR,DateofBirth,CURDATE()) >25; 

#6 Write a query to find the oldest employee 
select * from employee
where DateofBirth= (select Min(DateofBirth) from employee);

#7 Write a query to find the youngest employee 
select * from employee
where DateofBirth= (select Max(DateofBirth) from employee);

#8 Display the maximum salary department-wise
select DepartmentName, max(salary) as Maxsalary from employee Group By DepartmentName;

#9 Display the min salary department-wise
select DepartmentName, min(salary) as Maxsalary from employee Group By DepartmentName;

#10 list teh employee who act as managers
select * from employee where
EmployeeID in (select ManagerID from employee);


