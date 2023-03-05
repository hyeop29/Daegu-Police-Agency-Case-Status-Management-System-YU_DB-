USE PoliceDB;
set @s_n = true; #서 -> 디폴트 값으로 체크 됨(고정값)
set @d_n = true; #부서
set @t_n = false; #팀
#(서), (서,부서), (서,부서,팀)으로 총 3가지로 선택 가능
drop procedure if exists statistics1;
delimiter $$
create procedure statistics1(in s_n boolean,in d_n boolean,in t_n boolean)
begin
select 
trim(concat(if(s_n is true, a.sname, " ")," ",if(d_n is true, a.dname, " "), " ",if(t_n is true, a.tname, " "))) as 'Unit',
(sum(case when a.type='살인' then 1 else 0 end)) as '살인',
(sum(case when a.type='사기' then 1 else 0 end)) as '사기',
(sum(case when a.type='음주' then 1 else 0 end)) as '음주',
(sum(case when a.type='폭행' then 1 else 0 end)) as '폭행',
(sum(case when a.type='성폭행' then 1 else 0 end)) as '성폭행',
(sum(case when a.type='절도' then 1 else 0 end)) as '절도'
from 
( 
select s.name as sname , d.name as dname , t.name as tname, i.type
from Incident i 
join Team_Incident ti on i.incident_id= ti.incident_id 
join Team t on ti.team_id = t.team_id
join Department d on d.department_id = t.department_id
join Station s on s.station_id = d.station_id
group by 
if(s_n is true, s.name, s.name),
if(d_n is true, d.name, s.name),
if(t_n is true, t.name, s.name),
i.incident_id 
)a
group by 
if(s_n is true, a.sname, a.sname)
,if(d_n is true, a.dname, a.sname)
,if(t_n is true, a.tname, a.sname)
order by a.sname;
end $$
delimiter ;

call statistics1(@s_n,@d_n,@t_n);


