USE PoliceDB;
DROP PROCEDURE IF EXISTS search_Incident_Other_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_Incident_Other_info_Proc(IN IncidentId INT)

BEGIN
	select i.incident_id , i.type , 
    i.start_date, i.end_date, i.progress, i.address 
    from Incident i 
    where i.incident_id= IncidentId;  
END $$
DELIMITER 


#call search_Incident_Other_info_Proc(9);

