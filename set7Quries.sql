select * from sailors s where s.sid in (select r.sid from reserves r where r.bid = 101);

select sname from sailors s join reserves r on r.sid = s.sid join boats b on b.bid = r.bid where b.color = 'red' order by age;

select distinct sname from sailors s;

select distinct s.sid,s.sname from sailors s join reserves r1 on s.sid = r1.sid join reserves r2 on s.sid = r2.sid where r1.day = r2.day and r1.bid<>r2.bid;

SELECT DISTINCT sid
FROM Reserves
WHERE bid IN (
    SELECT bid
    FROM Boats
    WHERE color IN ('red', 'green')
);

SELECT DISTINCT R.sid
FROM Reserves R
WHERE EXISTS (
    SELECT *
    FROM Boats B
    WHERE B.bid = R.bid
      AND B.color IN ('red', 'green')
);

SELECT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red'

UNION

SELECT R.sid
FROM Reserves R
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'green';
