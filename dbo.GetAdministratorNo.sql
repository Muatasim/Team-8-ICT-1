﻿CREATE PROCEDURE GetAdministratorNo
@AdministratorUsername VARCHAR(30),
@AdministratorNo INTEGER OUTPUT
AS
BEGIN
SET @AdministratorNo = (SELECT Administrator_No FROM Administrator WHERE Administrator_Username = @AdministratorUsername) 
RETURN;
END