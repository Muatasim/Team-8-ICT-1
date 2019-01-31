CREATE PROCEDURE DeleteProduct
@ProductNo VARCHAR(10)
AS
BEGIN
DELETE FROM Product
WHERE Product_No = @ProductNo
END