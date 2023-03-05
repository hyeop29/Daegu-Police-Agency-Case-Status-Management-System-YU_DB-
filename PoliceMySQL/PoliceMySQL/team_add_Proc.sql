
USE PoliceDB;
DROP PROCEDURE IF EXISTS team_add_Proc;
DELIMITER $$
CREATE PROCEDURE team_add_Proc(
	IN incident_id INT,
	IN s_name varchar(10),
    IN d_name varchar(10),
    IN t_name varchar(10),
    IN start datetime,
    IN end datetime
)
BEGIN
	insert into Team_Incident values((select t.team_id from Station s
    join Department d on s.station_id = d.station_id
    join Team t on d.department_id = t.department_id 
    where s.name = s_name and d.name = d_name and t.name = t_name),
    incident_id, start, end);
END $$
DELIMITER ;

select * from Team_Incident;

delete from Team_Incident where team_id = 36 and incident_id = 2;
