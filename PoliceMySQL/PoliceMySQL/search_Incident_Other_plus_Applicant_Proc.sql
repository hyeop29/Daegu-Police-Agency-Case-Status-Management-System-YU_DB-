USE PoliceDB;
DROP PROCEDURE IF EXISTS search_Incident_Other_plus_Applicant_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_Incident_Other_plus_Applicant_info_Proc(IN IncidentId INT)

BEGIN
	select i.incident_id , i.type , i.start_date, i.end_date, 
    i.progress, i.address , 
    a.applicant_id, concat(a.name,'(',a.birth,')') as a_info
	from Incident i 
	left join Applicant a on i.applicant_id = a.applicant_id
	where i.incident_id= IncidentId;  
END $$
DELIMITER 

#call search_Incident_Other_plus_Applicant_info_Proc(10);


