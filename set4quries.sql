select sname , age from sailors where age = (select min(age) from sailors);

select sname , rating from sailors where rating >= any (select rating from sailors where sname = 'Horatio');

select count(distinct sname) from sailors;

select avg(age) as average_age from sailors;

select sname,age from sailors where age = (select min(age) from sailors);