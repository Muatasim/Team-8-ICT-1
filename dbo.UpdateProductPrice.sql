CREATE PROCEDURE UpdateProductPrice
@ProductName VARCHAR(50),
@ProductPrice MONEY
AS
BEGIN
UPDATE Product
SET Product_Price = @ProductPrice
WHERE Product_Name = @ProductName
END