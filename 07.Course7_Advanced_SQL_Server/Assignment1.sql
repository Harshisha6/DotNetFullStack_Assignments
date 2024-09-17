USE Project
CREATE VIEW ProductsLessThanAverage AS SELECT * from Products WHERE UnitPrice < ( Select avg(UnitPrice) from products);
select * from ProductsLessThanAverage

EXEC sp_rename 'Low Cost Products', 'Low_Cost_Products'
select * from Low_Cost_Products
 DROP view Low_Cost_Products


 -----Assignment 2 
 use pubs
CREATE PROCEDURE ExecuteProducts
AS
BEGIN
	SELECT * FROM Products
END

EXEC ExecuteProducts



CREATE PROCEDURE CalculateProducts
AS
 
Begin

-- Step1
DECLARE @ProductName NVARCHAR(255);
DECLARE @UnitsOnOrder INT;
DECLARE @UnitPrice DECIMAL(10, 2);
DECLARE @TotalAmount DECIMAL(10, 2);
DECLARE @GrandTotal DECIMAL(10, 2) = 0.00;

DECLARE cursor_product CURSOR FOR
SELECT ProductName, UnitsOnOrder, UnitPrice 
FROM  Products;
    
	   
-- Step2
OPEN cursor_product;


-- Step3
FETCH NEXT FROM cursor_product INTO @ProductName,@UnitsOnOrder, @UnitPrice;

-- Step4

WHILE @@FETCH_STATUS = 0

BEGIN
SET @TotalAmount=@UnitsOnOrder* @UnitPrice;
SET @GrandTotal=@GrandTotal+ @TotalAmount; 
        PRINT @ProductName + ' - ' +  CAST(@TotalAmount AS nvarchar(10));
        FETCH NEXT FROM cursor_product INTO @ProductName,@UnitsOnOrder, @UnitPrice;
    END;


--  Step5
CLOSE cursor_product;

DEALLOCATE cursor_product;
PRINT 'Grand Total -' + CAST(@GrandTotal AS NVARCHAR(10));
End;

EXEC CalculateProducts
------

