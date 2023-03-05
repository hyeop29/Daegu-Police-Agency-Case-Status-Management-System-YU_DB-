
USE PoliceDB;
DROP PROCEDURE IF EXISTS Police_search_Proc;
DELIMITER $$
CREATE PROCEDURE Police_search_Proc(
IN s_name varchar(10),
IN d_name varchar(10),
IN t_name varchar(10),
IN name varchar(10)
)
BEGIN
select u.user_id, u.password, u.name, u.birth, u.gender, u.phone, u.rank, u.address,
s.name as station, d.name as department, t.name as team from Station s
join Department d on s.station_id = d.station_id
join Team t on d.department_id = t.department_id
join User u on t.team_id = u.team_id
where s.name = ifnull(s_name, s.name) and d.name = ifnull(d_name, d.name)
and t.name = ifnull(t_name, t.name) and u.name like
ifnull(concat('%', name, '%'), u.name);
END $$
DELIMITER ;
