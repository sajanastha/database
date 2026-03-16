#1 create database named BankDB
#and create a table accounts with the fields: account_id, account_holder nad balance
create database BankDB;
use BankDB;
Create table accounts(account_id int primary key, 
account_holder varchar(100), balance decimal(10,2));

Insert into accounts values
(1, 'Ram', 50000),
(2, 'Shyam', 50300),
(3, 'Sita', 20000);

#Write a transcation that transfer Rs.5000 from Ram's account to Shyam's account
Start transaction;
update accounts
set balance = balance -5000 where account_id =1;
update accounts
set balance = balance + 5000 where account_id=2;
commit; #coomit is imp can be rollback instead of commit too

#Write a transaction that trnsfer rs 10000 from shyam's acc to sita's acc and demonstrate that use of ROLLBACK
Start transaction;
update accounts
set balance = balance - 10000 where account_id=2;
update accounts
set balance = balance + 10000 where account_id=3;
rollback;

#write a transcation that demonstrates the use of savepoint while updating account balances.
start transaction;
update accounts
set balance = balance -2000 where account_id=1;
savepoint sp1;
update accounts 
set balance = balance +2000 where account_id=2;
rollback to sp1;
commit;

#Create a table employee with the fields: emp_id, name, salary
Create table employee
(emp_id int primary key,
name varchar(100),
salary decimal(10,2));

#create anotehr table salary_log to recorc empoloyee salary changes with the fields:
#log_id, emp_id, old_salary, new_salary, updated_at.
create table salary_log
(log_id int auto_increment primary key,
 emp_id int , 
 old_salary decimal(10,2), 
 new_salary decimal(10,2), 
 updated_at timestamp default current_timestamp
 );

#create a BEFORE INSERT tigger on employees that prevents inserting employees whose salary is less than 10000
Delimiter $$
  create trigger check_salary
  before insert on employee
  for each row
  begin
  if new.salary < 10000 then
  signal sqlstate '45000'
  set message_text = 'salary must be atleast 10000';
  end if ;
  end $$
Delimiter ;

Delimiter $$
  create trigger log_salary_update
  after update on employee
  for each row
  begin 
  insert into salary_log(emp_id, old_salary, new_salary)
  values (old.emp_id, old.salary, new.salary);
  end $$
Delimiter ;

#Stored procedure
#create a stored procedure that retrives all record from the employee table.
Delimiter $$
Create procedure getEmployee()
begin
select * from employee;
end $$
Delimiter ;
call getEmployee();

#create a stored procedure that inserts a new empmloyee into the employee table using parameters
#using parameters
Delimiter $$
Create procedure addEmployee(
In p_id int,
In p_name varchar(100),
In p_salary decimal(10,2) )
begin
insert into employee values(p_id, p_name, p_salary);
end $$
Delimiter ;
call addEmployee (5, 'Hari', 20000);

#3 cretae a stored procedure that updates the salary of an employee based on employee id
Delimiter $$
create procedure updateSalary(
in p_id int, in new_salary decimal(10,2))
begin 
update employee
set salary =new_salary
where emp_id = p_id;
end $$
Delimiter ;
call updateSalary(1, 30000);

#4create a stored pocedure that transfers money between 2 acc using ba transaction
Delimiter $$
create procedure transferMoney(
in from_account int, in to_account int, in ammount decimal)
begin
start transaction;
update accounts
SET balance = balance - amount
WHERE account_id = from_account;
UPDATE accounts
SET balance = balance + amount
WHERE account_id = to_account;
COMMIT;
end $$
Delimiter ;
call transferMoney(1,2,5000);
