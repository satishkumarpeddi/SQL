select sname from sailors s join reserves r on s.sid = r.sid where r.bid = 103;

select sname from sailors s where s.sid in (select r.sid from reserves where r.bid = 103);

select sname from sailors s where exists (select r.sid from resereves r where s.sid = r.sid and r.bid = 103);

select sname from sailors s where s.rating > any (select rating from sailors where sname = 'Bob');

select sname from sailors s where s.rating >= all(select rating from sailors);