
USE PoliceDB;
DROP PROCEDURE IF EXISTS Police_update_delete_Proc;
DELIMITER $$
CREATE PROCEDURE Police_update_delete_Proc(
IN user_id int
)
BEGIN
select u.user_id, u.password, u.name, u.birth, u.gender, u.phone, u.rank, u.address,s.name as station, d.name as department,t.name as team 
from Station s join Department d on s.station_id = d.station_id 
join Team t on d.department_id = t.department_id
join User u on t.team_id = u.team_id 
where u.user_id = user_id;
END $$
DELIMITER ;

