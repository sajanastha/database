Create database TechSolutionsDB;
use TechSolutionsDB;

Create table DEPARTMENT (DeptID int primary key, DeptName varchar(45) NOT NULL, Location varchar(255));
Create table EMPLOYEE (EmpID int primary key, FirstName varchar(255), LastName varchar(255), 
Gender char, Salary int, HireDate date, DeptID int, 
foreign key(DeptID) references DEPARTMENT (DeptID) );
Create table PROJECT( ProjectID int primary key, ProjectName varchar(255), StartDate date,
EndDate date, Budget int);
CREATE TABLE WORKS_ON (
EmpID INT,
ProjectID INT,
HoursWorked INT,
PRIMARY KEY (EmpID, ProjectID),
FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID),
FOREIGN KEY (ProjectID) REFERENCES PROJECT(ProjectID)
);
 
ALTER TABLE PROJECT MODIFY COLUMN Budget decimal(12,1);

INSERT INTO DEPARTMENT (DeptID, DeptName, Location)
 VALUES (1, 'Human Resources', 'New York, NY'),
 (2, 'IT Department', 'San Francisco, CA'),
 (3, 'Sales', 'Chicago, IL'),
 (4, 'Marketing', 'Los Angeles, CA'),
 (5, 'Finance', 'Boston, MA');

INSERT INTO EMPLOYEE (EmpID, FirstName, LastName, Gender, Salary, HireDate, DeptID) VALUES (101, 'Jennifer', 'Anderson', 'F', 65000, '2019-03-15', 1),
 (102, 'Michael', 'Brown', 'M', 58000, '2020-07-22', 1),
 (103, 'Sarah', 'Wilson', 'F', 82000, '2018-01-10', 2),
 (104, 'David', 'Martinez', 'M', 75000, '2019-09-05', 2),
 (105, 'James', 'Garcia', 'M', 68000, '2021-04-12', 3),
 (106, 'Robert', 'Lee', 'M', 69000, '2020-08-25', 4),
 (107, 'Amanda', 'White', 'F', 78000, '2018-06-14', 5);

INSERT INTO PROJECT (ProjectID, ProjectName, StartDate, EndDate, Budget) VALUES (1, 'Website Redesign', '2024-01-15', '2024-06-30', 150000.0),
 (2, 'Mobile App Development', '2024-02-01', '2024-08-31', 250000.0),
 (3, 'CRM Implementation', '2023-10-01', '2024-03-31', 180000.0),
 (4, 'Marketing Campaign 2024', '2024-03-01', '2024-12-31', 95000.0),
 (5, 'HR System Upgrade', '2024-04-01', '2024-09-30', 120000.0),
 (6, 'Financial Audit 2024', '2024-01-01', '2024-05-31', 75000.0);

INSERT INTO WORKS_ON (EmpID, ProjectID, HoursWorked) 
VALUES 
(103, 1, 120), (104, 1, 95), (105, 2, 60),
(103, 3, 100), (105, 3, 110), (106, 3, 105),
(107, 4, 130), (101, 5, 90), (102, 5, 85),
(103, 5, 70);

Select * from EMPLOYEE where salary>= 60000;

select FirstName, LastName, Salary from EMPLOYEE 
ORDER BY Salary DESC;

Select * from EMPLOYEE where DeptID=2; 

Select DeptID, count(EmpId) as Employee_number from EMPLOYEE group by DeptID;

Select * from employee where HireDate > '2022-1-1';

SELECT E.FirstName, E.LastName, D.DeptName
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.DeptID = D.DeptID;

SELECT E.FirstName, E.LastName, P.ProjectName
FROM EMPLOYEE E
JOIN WORKS_ON W ON E.EmpID = W.EmpID
JOIN PROJECT P ON W.ProjectID = P.ProjectID;

SELECT P.ProjectName, SUM(W.HoursWorked) AS TotalHours
FROM PROJECT P
JOIN WORKS_ON W ON P.ProjectID = W.ProjectID
GROUP BY P.ProjectName;

select avg(Salary) as Average, DeptID from EMPLOYEE GROUP BY DeptID;

SELECT DeptID, COUNT(EmpID) AS EmployeeCount
FROM EMPLOYEE
GROUP BY DeptID
ORDER BY EmployeeCount DESC
LIMIT 1;

SELECT FirstName, LastName, Salary
FROM EMPLOYEE
WHERE Salary > (
    SELECT AVG(Salary)
    FROM EMPLOYEE
);




 
 

