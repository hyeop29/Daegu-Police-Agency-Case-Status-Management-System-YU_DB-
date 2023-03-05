USE PoliceDB;
DROP PROCEDURE IF EXISTS search_Incident_Victim_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_Incident_Victim_info_Proc(IN IncidentId INT)

BEGIN
	select v.victim_id, concat(v.name,'(',v.birth,')') as a_info
	from Incident_Victim iv join Victim v on iv.victim_id = v.victim_id
	where iv.incident_id=IncidentId;
END $$
DELIMITER 

#call search_Incident_Victim_info_Proc(10);


