------ASSIGNMENT 1-----------

USE Sept2024Db;
CREATE TABLE Users
(
  UserId INT PRIMARY KEY,
  UserName VARCHAR(50),
  Password VARCHAR(10), 
  ContactNumber INT, 
  City VARCHAR(50)
  
);

CREATE TABLE Products
(
  ProductId INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  QuantityInStock INT NOT NULL, 
  UnitPrice INT NOT NULL, 
  Category VARCHAR(50) NOT NULL,
  CONSTRAINT  CHK_PROD_QUANTITY CHECK (QuantityInStock> 0),
  CONSTRAINT  CHK_PROD_UNITPRICE CHECK (UnitPrice>0)
  
);

CREATE TABLE Cart
(
  CartId INT PRIMARY KEY,
  ProductId INT ,
  QuantityInStock INT NOT NULL, 
  CONSTRAINT  FK_CART_PID  FOREIGN KEY (ProductId)
  REFERENCES Products(ProductId)	
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  CONSTRAINT  CHK_CART_QUANTITY CHECK (QuantityInStock > 0)
);

ALTER TABLE Users ALTER COLUMN ContactNumber VARCHAR(50);

 	
SELECT * FROM Users;
INSERT INTO Users VALUES(2,'HARSHI', 'JHVBCSXHBAX', 9876543486,'HYDERABAD');
INSERT INTO Users VALUES(3,'PRANEETHA', 'HBCXASNKSD', 9876543376,'GUNTUR');
INSERT INTO Users VALUES(1,'YAMUNA', 'HBCASNUCD', 9876543221,'VISAKAPATNAM');
INSERT INTO Users VALUES(4,'SCANDHA', 'IUQBACSJKAXNJ', 9876558786,'VIJAYAWADA');
INSERT INTO Users VALUES(5,'AARUSH PAL', 'IUJAKSCBX', 9876476923,'NEW DELHI');
---------
SELECT * FROM Products;

INSERT INTO Products VALUES(1,'SHOES', 5, 10000,'FOOTWEAR');
INSERT INTO Products VALUES(2,'BINGO',40, 10,'FOOD');
INSERT INTO Products VALUES(3,'T-SHIRT', 2, 2000,'CLOTHING');
INSERT INTO Products VALUES(4,'IPHONE', 1, 60000,'SMARTPHONES');
INSERT INTO Products VALUES(5,'SAREE', 33, 500,'CLOTHING');
INSERT INTO Products VALUES(6,'SHOES', 5, 1000,'FOOTWEAR');
INSERT INTO Products VALUES(7,'KURTHI', 1, 500,'CLOTHING');

SELECT * FROM Cart;
INSERT INTO Cart VALUES(12,2,2);
INSERT INTO Cart VALUES(23,1,1);
INSERT INTO Cart VALUES(34,2,33);
INSERT INTO Cart VALUES(45,4,5);
INSERT INTO Cart VALUES(56,4,10);


--------On Product Table  
SELECT * FROM Products;
SELECT Category, Name FROM Products WHERE Category='CLOTHING';
SELECT * FROM Products WHERE QuantityInStock <=0;
SELECT * FROM Products WHERE QuantityInStock >1000 AND QuantityInStock<10000  ;

----ii.   On Cart Table:


SELECT * FROM Cart;	

SELECT * FROM Cart
INNER JOIN Products
ON  Cart.ProductId = Products.ProductId;

-----	iii.   On Users Table

SELECT * FROM Users;
SELECT * FROM Users WHERE ContactNumber=9876543221;
SELECT * FROM Users WHERE UserId=2;

---------
----ASSIGNMENT 2---------
---2.1---
SELECT c.CartId,  p.Name, c.QuantityInStock, p.UnitPrice
FROM Cart c
INNER JOIN Products p
ON  C.ProductId = P.ProductId 

SELECT c.CartId,  p.Name, c.QuantityInStock, p.UnitPrice FROM Cart c RIGHT JOIN Products p ON c.ProductId= p.ProductId;
SELECT c.CartId,  p.Name, c.QuantityInStock, p.UnitPrice FROM Cart c LEFT JOIN Products p ON c.ProductId= p.ProductId;
SELECT c.CartId,  p.Name, c.QuantityInStock, p.UnitPrice FROM Cart c FULL OUTER JOIN Products p ON c.ProductId= p.ProductId;

----2.2
CREATE TABLE Student
(
  StudentId INT PRIMARY KEY,
  StudentName VARCHAR(50),
  CourseName VARCHAR(10), 
  CityName VARCHAR(50), 
  ContactName VARCHAR(50)
  
);

SELECT * FROM Student;

INSERT INTO Student VALUES(1,'YAMUNA', 'IT', 'VISAKAPATNAM','YAM');
INSERT INTO Student VALUES(2,'HARSHI', 'IT', 'HYDERABAD','HAR');
INSERT INTO Student VALUES(3,'PRANEETHA', 'CSE','GUNTUR', 'PRA');
INSERT INTO Student VALUES(4,'SCANDHA', 'ECE','VIJAYAWADA','SCA');
INSERT INTO Student VALUES(5,'AARUSH PAL', 'CSE', 'NEW DELHI','AAR');
INSERT INTO Student VALUES(6,'PRASHANTH', 'IT', 'VIJAYAWADA','PRAS');
INSERT INTO Student VALUES(7,'AJAY', 'CSE', 'HYDERABAD','AJA');
INSERT INTO Student VALUES(8,'VISWA', 'ECE','GUNTUR', 'VIS');
INSERT INTO Student VALUES(9,'ROSHNA', 'IT','VIJAYAWADA','ROS');
INSERT INTO Student VALUES(10,'RITU', 'ECE', 'NEW DELHI','RIT');

SELECT CourseName, COUNT(StudentId) as students  from Student GROUP BY CourseName HAVING CourseName='IT';
SELECT CityName, COUNT(StudentId) as PEOPLE  from Student GROUP BY CityName HAVING CityName='HYDERABAD';
SELECT CityName, COUNT(StudentId) as PEOPLE  from Student GROUP BY CityName
SELECT CityName,CourseName, COUNT(StudentId) as students  from Student GROUP BY CourseName,CityName


-------2.3
SELECT * FROM Cart
INNER JOIN Products
ON  Cart.ProductId = Products.ProductId;

SELECT * FROM Products WHERE UnitPrice <5000
SELECT * FROM Cart
WHERE ProductId 
IN (SELECT ProductId FROM Products WHERE UnitPrice<5000)

