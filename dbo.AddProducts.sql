CREATE PROCEDURE AddProducts
@ProductImage VARBINARY(MAX),
@ProductName VARCHAR(50),
@ProductCategoryName VARCHAR(20),
@ProductPrice MONEY,
@ProductQuantity INTEGER,
@GroceryBranchName VARCHAR(50),
@BarcodeNo VARCHAR(20)
AS
BEGIN
INSERT INTO Product (Product_Image,Product_Name,Product_Category_No,Product_Price,Product_Quantity,Grocery_Branch_No,Barcode_No)
SELECT @ProductImage,@ProductName,(SELECT Product_Category_No FROM Product_Category WHERE Product_Category_Name = @ProductCategoryName),@ProductPrice,@ProductQuantity,(SELECT Grocery_Branch_No FROM Grocery_Branch WHERE Grocery_Branch_Name = @GroceryBranchName),@BarcodeNo
END