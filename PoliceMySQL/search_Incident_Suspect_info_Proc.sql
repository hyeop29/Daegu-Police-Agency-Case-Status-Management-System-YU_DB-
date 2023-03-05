USE PoliceDB;
DROP PROCEDURE IF EXISTS search_Incident_Suspect_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_Incident_Suspect_info_Proc(IN IncidentId INT)

BEGIN
	select s.suspect_id, concat(s.name,'(',s.birth,')') as a_info
from Incident_Suspect ins join Suspect s on ins.suspect_id = s.suspect_id
where ins.incident_id=IncidentId;
END $$
DELIMITER 

#call search_Incident_Suspect_info_Proc(10);


