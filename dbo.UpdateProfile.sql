CREATE PROCEDURE UpdateProfile
@AdministratorNo INTEGER,
@AdministratorName VARCHAR(30),
@AdministratorUsername VARCHAR(30),
@AdministratorPassword VARCHAR(30),
@AdministratorPhoneNo VARCHAR(20),
@AdministratorEmail VARCHAR(30)
AS
BEGIN
UPDATE Administrator
SET Administrator_Name = @AdministratorName,
    Administrator_Username = @AdministratorUsername,
	Administrator_Password = @AdministratorPassword,
	Administrator_Phone_No = @AdministratorPhoneNo,
    Administrator_Email = @AdministratorEmail
WHERE Administrator_No = @AdministratorNo
END