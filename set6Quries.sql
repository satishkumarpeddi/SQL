select avg(age) as average_age,rating from sailors group by rating;

select avg(age) from sailors s group by rating having count(*)>=2;

select sid from sailors where rating = 10 
union 
select sid from reserves r where r.bid = 103;

select distinct sname from sailors s join reserves r on s.sid = r.sid join boats b on r.bid = b.bid where b.color in ('red','green');

select sname from sailors s where not exists (select sid from reserves r where r.sid = s.sid and r.bid = 103);