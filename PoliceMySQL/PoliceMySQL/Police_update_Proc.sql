USE PoliceDB;
DROP PROCEDURE IF EXISTS Police_update_Proc;
DELIMITER $$
CREATE PROCEDURE Police_update_Proc(
IN n_name varchar(10),
IN n_birth date,
IN n_gender varchar(2),
IN n_phone varchar(14),
IN u_rank varchar(10),
IN n_address varchar(45),
IN s_name varchar(10),
IN d_name varchar(10),
IN t_name varchar(10),
IN n_user_id int
)
BEGIN
Update User u set name = n_name, birth = n_birth, gender = n_gender, phone = n_phone, 
u.rank = u_rank, address = n_address, 
team_id = (select team_id from Station s 
join Department d on s.station_id = d.station_id 
join Team t on d.department_id = t.department_id
where s.name = s_name and d.name = d_name and t.name = t_name)
where user_id = n_user_id;
END $$
DELIMITER ;

select * from User;
desc User;