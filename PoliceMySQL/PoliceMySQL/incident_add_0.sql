USE PoliceDB;

drop procedure if exists incident_add_0;
delimiter $$
create procedure incident_add_0(
in type varchar(10),
in a_start datetime,
in Address varchar(45),
in T_id int,
in t_start datetime,
in t_end datetime)

begin
insert into Incident 
values(null, type, "배정완료", a_start, null, null, Address); 

insert into Team_Incident 
values(T_id, (select i.incident_id from Incident i
where i.incident_id = last_insert_id()),t_start, t_end);
end $$
delimiter ;

#select * from Incident;