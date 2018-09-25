CREATE PROCEDURE AdminSearchProductsOnBranch
@ProductName VARCHAR(50),
@GroceryBranchName VARCHAR(50)
AS
BEGIN
SELECT Product_No,Product_Image,Product_Name,Barcode_No,Product_Category_Name,Product_Price,Product_Quantity,Grocery_Branch_Name 
FROM Product,Product_Category,Grocery_Branch
WHERE Product_Category.Product_Category_No = Product.Product_Category_No
AND Grocery_Branch.Grocery_Branch_No = Product.Grocery_Branch_No
AND Product_Name LIKE '%' + @ProductName + '%'
AND Grocery_Branch_Name = @GroceryBranchName
END