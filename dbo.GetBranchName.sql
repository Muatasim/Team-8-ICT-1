CREATE PROCEDURE GetBranchName
@AdministratorUsername VARCHAR(30),
@BranchName VARCHAR(50) OUTPUT
AS
BEGIN
SET @BranchName = (SELECT Grocery_Branch_Name FROM Grocery_Branch WHERE Grocery_Branch_No = (SELECT Grocery_Branch_No FROM Administrator
WHERE Administrator_Username = @AdministratorUsername))   
RETURN
END