USE PoliceDB;
DROP PROCEDURE IF EXISTS search_Incident_Team_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_Incident_Team_info_Proc(IN IncidentId INT)

BEGIN
	select 
    ti.team_id,
    CONCAT(s.name," ", d.name," ",t.name) as Unit , 
    CONCAT(DATE_FORMAT(ti.start_date, '%Y-%m-%d %H:%i:%s')," ~ ", 
    IFNULL(DATE_FORMAT(ti.end_date,'%Y-%m-%d %H:%i:%s'), "진행중")) as perid
	from Team_Incident ti join Team t on ti.team_id = t.team_id 
	join Department d on d.department_id= t.department_id 
	join Station s on s.station_id=d.station_id 
	where ti.incident_id=IncidentId;
END $$
DELIMITER 

#call search_Incident_Team_info_Proc(10);

