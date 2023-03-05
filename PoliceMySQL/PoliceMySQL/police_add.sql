USE PoliceDB;
#select 박스에서 아래와 같이 선택을 했다고 가정
-- SET @s_name = "동구경찰서";
-- SET @d_name = "수사과";
-- SET @t_name = "1팀";

drop procedure if exists police_add;
delimiter $$
create procedure police_add(in s_name varchar(10),in d_name varchar(10),in t_name varchar(10),in p_name varchar(10)
,in id int,in pw varchar(45),in birth date,in gender varchar(2),in phone varchar(14),in p_rank varchar(4),in address varchar(45))
begin
insert into User values(id, pw, p_name, birth,gender, phone,p_rank, "Police", address,
 (select team_id from Station s join Department d on s.station_id = d.station_id join Team t 
 on d.department_id = t.department_id where s.name = s_name and d.name = d_name and t.name = t_name));
 end $$
delimiter ;

call police_add("수성구경찰서","여성 청소년과","3팀","안희순",149,"aaa","1982-01-01","남성","010-6653-0998","경장","서구 원대로 한라아파트 1동");
select * from User;