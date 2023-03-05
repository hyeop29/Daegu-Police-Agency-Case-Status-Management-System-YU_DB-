
USE PoliceDB;
DROP PROCEDURE IF EXISTS Police_delete_Proc;
DELIMITER $$
CREATE PROCEDURE Police_delete_Proc(
IN d_user_id int
)
BEGIN
delete from User where user_id = d_user_id;
END $$
DELIMITER ;

