USE PoliceDB;
DROP PROCEDURE IF EXISTS loginProc;
DELIMITER $$
CREATE PROCEDURE 
loginProc(IN userId INT, IN userPassword varchar(45))

BEGIN
	SELECT role, team_id
    FROM User 
    where user_id = userId and password = userPassword;
END $$
DELIMITER 


#call loginProc(1, "aaa");



