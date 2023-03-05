USE PoliceDB;
set @a_s = true; #구 -> 디폴트 값으로 체크 됨(고정 값)
set @a_c = false; #로/동
# (구), (구, 로/동) 으로 선택 가능
drop procedure if exists statistics2;
delimiter $$
create procedure statistics2(in a_s boolean,in a_c boolean)
begin
select 
if(a_c is true, SUBSTRING_INDEX(i.address," ", 2), SUBSTRING_INDEX(i.address," ", 1)) as 'address',
#,SUBSTRING_INDEX(i.address," ", 1) as '구',
sum(case when i.type='살인' then 1 else 0 end) as '살인',
sum(case when i.type='사기' then 1 else 0 end ) as '사기',
sum(case when i.type='음주' then 1 else 0 end ) as '음주',
sum(case when i.type='폭행' then 1 else 0 end ) as '폭행',
sum(case when i.type='성폭행' then 1 else 0 end ) as '성폭행',
sum(case when i.type='절도' then 1 else 0 end ) as '절도'
from Incident i
group by 
if(a_c is true, SUBSTRING_INDEX(i.address," ", 2), SUBSTRING_INDEX(i.address," ", 1))
order by SUBSTRING_INDEX(i.address," ", 1); #구 기준으로 정렬
end $$
delimiter ;

call statistics2(@a_s,@a_c);

select * from User;
