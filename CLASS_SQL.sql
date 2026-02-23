Create database Customer;
use Customer;

create table Customer_info(
Student_ID int Primary key,
FirstName varchar(255),
LastName varchar(255),
Address varchar(255),
City varchar(255),
Gender char(1)
);

Insert into Customer_info(
Student_ID, FirstName, LastName, Address, City, Gender
)  VALUES(
1, 'Sajana', 'Shrestha', 'Dahikot', 'Thimi', 'F'),
(2,'Kripa','Parajuli', 'Dahikot', 'Thimi', 'F'),
(3, 'Anisha', 'Shrestha', 'Pulchwok', 'Patan', 'M'),
(4, 'Sneha', 'Thankur', 'Kupondole', 'Patan', 'M');

UPDATE customer_info set Gender='F' where Gender='M';
SELECT * FROM customer_info;
DELETE FROM Customer_info WHERE Student_ID=1;

ALTER table Customer_info add email varchar(255);

ALTER TABLE Customer_info DROP COLUMN email;

ALTER TABLE Customer_info
RENAME COLUMN Student_ID to Customer_No;

SELECT * FROM Customer_info
WHERE Address = 'Dahikot' AND FirstName LIKE 'K%'; #Can use OR,Not
SELECT * FROM Customer_info
WHERE Address = 'Dahikot' OR FirstName LIKE 'S%';

SELECT MIN(Customer_No) FROM Customer_info;
SELECT MAX(Customer_No) FROM Customer_info;

SELECT COUNT(*) FROM Customer_info;

SELECT SUM(Customer_No) FROM Customer_info
where City='Patan';

SELECT AVG(Customer_No)FROM Customer_info;

SELECT * FROM Customer_info WHERE FirstName LIKE 'A%';
SELECT * FROM Customer_info WHERE City IN ('Thimi');

SELECT * FROM Customer_info
WHERE Customer_No BETWEEN 2 AND 3;

SELECT Address AS Town
FROM Customer_info;

Drop table Customer_info;

create table Customer_order(
Order_NO int Primary key,
Product varchar(255),
Customer_No int,
Price int
);

Insert into Customer_order(
Order_NO, Product, Customer_No, Price
)  VALUES
(1, 'Chair', 3, 800),
(2,'Chair',2,400),
(3, 'Laptop', 4, 10000000);

SELECT Order_NO, Product FROM Customer_order
INNER JOIN Customer_info ON Customer_order.Customer_No = Customer_info.Customer_No;

SELECT Customer_info.Customer_No, Customer_info.FirstName, Customer_info.LastName
FROM Customer_info
LEFT JOIN Customer_order
ON Customer_info.Customer_No = Customer_order.Customer_No
ORDER BY Customer_info.FirstName;




