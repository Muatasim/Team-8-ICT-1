CREATE PROCEDURE Login
@AdministratorUsername VARCHAR(30),
@AdministratorPassword VARCHAR(30)
AS
BEGIN
SELECT Administrator_Username, Administrator_Password
FROM Administrator
WHERE Administrator_Username = @AdministratorUsername 
AND Administrator_Password = @AdministratorPassword
END