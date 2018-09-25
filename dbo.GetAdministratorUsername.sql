CREATE PROCEDURE GetAdministratorUsername
@AdministratorNo INT,
@AdministratorUsername VARCHAR(30) OUTPUT
AS
BEGIN
SET @AdministratorUsername = (SELECT Administrator_Username FROM Administrator WHERE Administrator_No = @AdministratorNo) 
RETURN
END