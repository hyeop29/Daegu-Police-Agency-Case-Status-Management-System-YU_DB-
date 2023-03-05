USE PoliceDB;
drop procedure if exists incidentAdd3;
delimiter $$
create procedure incidentAdd3(in s_name varchar(10),in d_name varchar(10))
begin
	select t.team_id, t.name, 
    SUM(case when ti.team_id is null or i.progress = "수사완료" 
    then 0 else 1 end) as count
	from Station s join Department d on s.station_id = d.station_id 
	join Team t on d.department_id = t.department_id 
	left join Team_Incident ti on t.team_id = ti.team_id 
    left join Incident i on i.incident_id = ti.incident_id
	where s.name = s_name and d.name = d_name 
    group by t.team_id;

end $$
delimiter ;

#SET @s_name = "동구경찰서";
#SET @d_name = "수사과";
#call incidentAdd3(@s_name,@d_name);