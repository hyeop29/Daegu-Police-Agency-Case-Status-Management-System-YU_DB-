USE PoliceDB;
DROP PROCEDURE IF EXISTS search_IncidentByFilter_Other_info_Proc;
DELIMITER $$
CREATE PROCEDURE 
search_IncidentByFilter_Other_info_Proc(
	IN s_n varchar(10),IN d_n varchar(10),
    IN t_n varchar(10),IN ip_n varchar(10),
    IN it_n varchar(10),IN id_n varchar(45)
)
BEGIN
	select i.incident_id , i.type, #사건ID는 “사건상세 페이지로 이동할 때 사용”
	i.start_date,i.end_date, i.progress, i.address ,i.applicant_id
	from Incident i 
	join Team_Incident ti on i.incident_id= ti.incident_id 
	join Team t on ti.team_id = t.team_id
	join Department d on d.department_id = t.department_id
	join Station s on s.station_id = d.station_id
	where 
	s.name = ifnull(s_n, s.name) 
    and d.name = ifnull(d_n, d.name) 
    and t.name = ifnull(t_n, t.name) 
    and i.progress = ifnull(ip_n, i.progress) 
    and i.type = ifnull(it_n, i.type)
	and (INSTR(i.address, ifnull(id_n,"")) > 0)
	group by i.incident_id;
END $$
DELIMITER 

#call search_IncidentByFilter_Other_info_Proc(null, null, null, null, null, null);


