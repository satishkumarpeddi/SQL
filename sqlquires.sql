SELECT *
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 101;

SELECT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
JOIN Boats B ON R.bid = B.bid
WHERE B.color = 'red'
ORDER BY S.age;

SELECT DISTINCT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid;

SELECT S.sname
FROM Sailors S
WHERE EXISTS (
    SELECT *
    FROM Reserves R
    WHERE R.sid = S.sid
);

SELECT DISTINCT S.sid, S.sname
FROM Sailors S
JOIN Reserves R1 ON S.sid = R1.sid
JOIN Reserves R2 ON S.sid = R2.sid
WHERE R1.day = R2.day
  AND R1.bid <> R2.bid;

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

-----------------------------------------------------------------------------

SELECT S.sname
FROM Sailors S
JOIN Reserves R ON S.sid = R.sid
WHERE R.bid = 103;

SELECT sname
FROM Sailors
WHERE sid IN (
    SELECT sid
    FROM Reserves
    WHERE bid = 103
);

SELECT S.sname
FROM Sailors S
WHERE EXISTS (
    SELECT *
    FROM Reserves R
    WHERE R.sid = S.sid
      AND R.bid = 103
);

SELECT *
FROM Sailors
WHERE rating > ANY (
    SELECT rating
    FROM Sailors
    WHERE sname = 'BOB'
);

SELECT *
FROM Sailors
WHERE rating >= ALL (
    SELECT rating
    FROM Sailors
);

------------------------------------------------------------------------------

SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MIN(age)
    FROM Sailors
);

SELECT sname, rating
FROM Sailors
WHERE rating > (
    SELECT rating
    FROM Sailors
    WHERE sname = 'Horatio'
);

SELECT COUNT(DISTINCT sname) AS total_names
FROM Sailors;

SELECT AVG(age) AS average_age
FROM Sailors;

SELECT sname, age
FROM Sailors
WHERE age = (
    SELECT MIN(age)
    FROM Sailors
);

----------------------------------------------------------------------------------------

SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating;

SELECT rating, AVG(age) AS avg_age
FROM Sailors
GROUP BY rating
HAVING COUNT(*) >= 2;

SELECT sid
FROM Sailors
WHERE rating = 10

UNION

SELECT sid
FROM Reserves
WHERE bid = 103;

SELECT S.sname
FROM Sailors S
WHERE S.sid IN (
    SELECT R.sid
    FROM Reserves R
    JOIN Boats B ON R.bid = B.bid
    WHERE B.color = 'red'
)
AND S.sid IN (
    SELECT R.sid
    FROM Reserves R
    JOIN Boats B ON R.bid = B.bid
    WHERE B.color = 'green'
);

SELECT sname
FROM Sailors
WHERE sid NOT IN (
    SELECT sid
    FROM Reserves
    WHERE bid = 103
);

---------------------------------------------------------------------------
