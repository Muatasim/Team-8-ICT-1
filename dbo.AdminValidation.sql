CREATE PROCEDURE AdminValidation
@AdministratorUsername VARCHAR(30),
@AdministratorPassword VARCHAR(30),
@GroceryBranchName VARCHAR(20)
AS
BEGIN
SELECT Administrator_Username,Administrator_Password,Grocery_Branch_Name 
FROM Administrator,Grocery_Branch
WHERE Grocery_Branch.Grocery_Branch_No = Administrator.Grocery_Branch_No
AND Administrator_Username = @AdministratorUsername 
AND Administrator_Password = @AdministratorPassword
AND Grocery_Branch_Name = @GroceryBranchName
END