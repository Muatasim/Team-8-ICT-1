CREATE PROCEDURE ViewProfile
@AdministratorUsername VARCHAR(30)
AS
BEGIN
SELECT Administrator_Name,Administrator_Username,Administrator_Password,Administrator_Phone_No,Administrator_Email
FROM Administrator
WHERE Administrator_Username = @AdministratorUsername
END