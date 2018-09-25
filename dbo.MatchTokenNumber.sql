CREATE PROCEDURE MatchTokenNumber
@TokenNo VARCHAR(20)
AS
BEGIN
SELECT Token_No FROM Token 
WHERE Token_No LIKE @TokenNo
END