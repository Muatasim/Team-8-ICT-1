CREATE PROCEDURE UpdateProductQuantity
@ProductNo VARCHAR(10),
@ProductQuantity INTEGER
AS
BEGIN
UPDATE Product
SET Product_Quantity = @ProductQuantity
WHERE Product_No = @ProductNo
END