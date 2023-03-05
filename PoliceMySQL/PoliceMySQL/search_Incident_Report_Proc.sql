USE PoliceDB;
DROP PROCEDURE IF EXISTS search_Incident_Report_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_Incident_Report_info_Proc(IN IncidentId INT)

BEGIN
	select r.report_id, concat(s.name," ", d.name," ",t.name, 
    "(작성일:", DATE_FORMAT(r.re_date, '%Y-%m-%d %H:%i:%s'), ")") as r_info
	from Team_Incident ti join Report r 
    on ti.incident_id = r.incident_id and ti.team_id = r.team_id
	join Team t on t.team_id = ti.team_id
	join Department d on d.department_id = t.department_id
	join Station s on d.station_id = s.station_id
	where ti.incident_id = IncidentId;
END $$
DELIMITER 

#call search_Incident_Report_info_Proc(10);


