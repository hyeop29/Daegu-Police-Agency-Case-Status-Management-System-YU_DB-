USE PoliceDB;
DROP PROCEDURE IF EXISTS update_Incident_Proc;
DELIMITER $$
CREATE PROCEDURE 
update_Incident_Proc(
	IN incidentId INT,
    IN u_end_date datetime,
    IN u_progress varchar(10)
)
BEGIN
	UPDATE Incident 
    SET progress = IFNULL(u_progress, progress),
    end_date = IFNULL(u_end_date, end_date) 
    WHERE incident_id = incidentId;
END $$
DELIMITER 

#call update_Incident_Proc(9, null, "수사완료");


