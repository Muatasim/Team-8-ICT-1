CREATE PROCEDURE DisplayAdmin
AS
BEGIN
SELECT Administrator_No,Administrator_Name,Administrator_Phone_No,Administrator_Email,Grocery_Branch_Name 
FROM Administrator,Grocery_Branch
WHERE Grocery_Branch.Grocery_Branch_No = Administrator.Grocery_Branch_No
END