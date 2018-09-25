CREATE PROCEDURE AdminRegistration
@AdministratorName VARCHAR(50),
@AdministratorUsername VARCHAR(30),
@AdministratorPassword VARCHAR(30),
@AdministratorPhoneNo VARCHAR(20),
@AdministratorEmail VARCHAR(30),
@GroceryBranchName VARCHAR(20)
AS
BEGIN
INSERT INTO Administrator(Administrator_Name,Administrator_Username,Administrator_Password,Administrator_Phone_No,Administrator_Email,Grocery_Branch_No)
SELECT @AdministratorName,@AdministratorUsername,@AdministratorPassword, @AdministratorPhoneNo,@AdministratorEmail,(SELECT Grocery_Branch_No FROM Grocery_Branch WHERE Grocery_Branch_Name = @GroceryBranchName)
END