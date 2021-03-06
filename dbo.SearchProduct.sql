﻿CREATE PROCEDURE SearchProduct
@ProductName VARCHAR(50),           
@PageIndex INTEGER = 1,  
@PageSize INTEGER = 10,  
@RecordCount INTEGER OUTPUT    
AS  
BEGIN  
SET NOCOUNT ON;  
SELECT ROW_NUMBER() OVER
(
 ORDER BY Product_Name
)
AS RowNumber,  
    Product_Image,
    Product_Name,
	Product_Category_Name,
	Product_Price,
    Product_Quantity,
    Grocery_Branch_Name   
    INTO #Results 
	FROM Product,Product_Category,Grocery_Branch
	WHERE Product_Category.Product_Category_No = Product.Product_Category_No
    AND Grocery_Branch.Grocery_Branch_No = Product.Grocery_Branch_No
	AND Product_Name LIKE '%' + @ProductName + '%'
            
    SELECT * FROM #Results  
    WHERE RowNumber BETWEEN (@PageIndex - 1) * @PageSize + 1 
	AND (((@PageIndex - 1) * @PageSize + 1) + @PageSize) - 1  
      
	SELECT @RecordCount = COUNT(*) FROM #Results  
        
    DROP TABLE #Results  
END