--- Create database 
Create Database  Sept2024Db

-- creating Emps table
CREATE TABLE Product
(
	ProductID INT PRIMARY KEY, 
	ProductName VARCHAR(10),
	Price INT,	
	Quantity INT,	
	Category VARCHAR(10)
)


-- inserting records to Emps table
INSERT INTO Product VALUES(1,'PEN',3,5, 'STATIONERY');
INSERT INTO Product VALUES(2,'PENCIL',5,5,'STATIONERY');
INSERT INTO Product VALUES(3,'CHAIR',750,2,'FURNITURE');
INSERT INTO Product VALUES(4,'TABLE',1150,1,'FURNITURE');
INSERT INTO Product VALUES(5,'WATCH',9500,1,'GADGETS');
INSERT INTO Product VALUES(6,'MOBILE',28500,1,'GADGETS');

-- select commands
SELECT * FROM Product

