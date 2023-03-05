USE PoliceDB;

drop procedure if exists applicant_add;
delimiter $$
create procedure applicant_add
(in name2 varchar(10),
in birth2 date, 
in phone2 varchar(14),
in date2 datetime,
in gender2 varchar(2),
in address2 varchar(45))

begin
insert into Applicant 
values(null, name2, birth2, phone2, date2, gender2, address2);

end $$
delimiter ;

#select * from Applicant;
-- call applicant_add("남경민","2022-12-05","010-3456-1113","2021-12-22 12:00:00","여성","북구 원대로 강남아파트 1동")