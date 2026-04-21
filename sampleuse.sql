CREATE TABLE students (
    student_id NUMBER(5) PRIMARY KEY,
    first_name VARCHAR2(30),
    last_name VARCHAR2(30),
    gender VARCHAR2(10),
    date_of_birth DATE,
    course VARCHAR2(50),
    marks NUMBER(5,2),
    phone_number VARCHAR2(15),
    city VARCHAR2(30)
);

INSERT INTO students VALUES (101, 'Rahul', 'Kumar', 'Male', TO_DATE('15-08-2003','DD-MM-YYYY'), 'B.Tech', 85.50, '9876543210', 'Guntur');

INSERT INTO students VALUES (102, 'Sneha', 'Reddy', 'Female', TO_DATE('22-01-2004','DD-MM-YYYY'), 'B.Sc', 91.25, '9123456780', 'Vijayawada');

INSERT INTO students VALUES (103, 'Arjun', 'Naidu', 'Male', TO_DATE('10-11-2002','DD-MM-YYYY'), 'BCA', 78.00, '9988776655', 'Hyderabad');

commit;

-- declare 
--     v_first_name varchar2(50);
--     v_last_name varchar2(50);
--     v_marks varchar2(50);
--     v_count number := 0;
--     cursor student_info is select first_name,last_name,marks from students where marks>80;
--     no_data exception;
-- begin
--   open student_info;
--   loop
--     fetch student_info into v_first_name,v_last_name,v_marks;
--     exit when student_info%notfound;
--     dbms_output.put_line(v_first_name||'   '||v_last_name||'  '||v_marks);
--     v_count := v_count+1;
--   end loop;
--   if v_count=0 then
--     raise no_data;
--   end if;
--   exception
--     when no_data_found then
--     dbms_output.put_line('No data found');
-- end;
-- /

-- begin
--     INSERT INTO students VALUES (101, 'Rahul', 'Kumar', 'Male', TO_DATE('15-08-2003','DD-MM-YYYY'), 'B.Tech', 85.50, '9876543210', 'Guntur');
--     dbms_output.put_line('First Recored Inserted Successfully.');
--     savepoint s1;
--     dbms_output.put_line('Save Point 1 is Created Successfully.');
--     INSERT INTO students VALUES (102, 'Sneha', 'Reddy', 'Female', TO_DATE('22-01-2004','DD-MM-YYYY'), 'B.Sc', 91.25, '9123456780', 'Vijayawada');
--     dbms_output.put_line('Second Recored Inserted Successfully.');
--     savepoint s2;
--     dbms_output.put_line('Save Point 2 is Created Successfully.');
--     INSERT INTO students VALUES (103, 'Arjun', 'Naidu', 'Male', TO_DATE('10-11-2002','DD-MM-YYYY'), 'BCA', 78.00, '9988776655', 'Hyderabad');
--     dbms_output.put_line('Third Recored Inserted Successfully.');
--     rollback to s2;
--     rollback to s1; 
--     exception
--         when others then
--             rollback;
--             dbms_output.put_line(sqlerrm);
-- end;
-- /


-- create or replace procedure get_info(
--     p_id in students.student_id%type,
--     p_first_name out varchar2,
--     p_marks out number
-- ) is 
-- begin
--   select first_name,marks into p_first_name,p_marks from students where student_id = p_id;
--   exception
--     when no_data_found then
--         p_first_name := 'Not Found';
--         p_marks := NULL;
-- end;
-- /
-- declare
--     v_id students.student_id%type;
--     v_name varchar2(50);
--     v_marks number;
-- begin
--   v_id := &v_id;
--   get_info(v_id,v_name,v_marks);
--   dbms_output.put_line(v_id||'   '||v_name||'   '||v_marks);
--   exception
--     when others then
--         dbms_output.put_line(sqlerrm);
-- end;
-- /

-- declare 
--     v_id  number:= &v_id;
--     v_name varchar2(50);
--     v_marks number;

--     cursor info is select first_name,v_marks from students where student_id = v_id for update;
-- begin
--     open info;
--     loop
--       fetch info into v_name,v_marks;
--       exit when info%notfound;
--       if v_marks>80 then
--         dbms_output.put_line('Highest');
--         dbms_output.put_line(v_name||'  '||v_marks);
--       else
--         dbms_output.put_line('Lowest');
--         dbms_output.put_line(v_name||'  '||v_marks);
--       end if;
--       update students set marks = marks+2.5 where student_id = v_id;
--     end loop;
--     close info;
--     exception
--       when others then
--       raise_application_error(-20001,'Error found');
-- end;
-- /

-- declare 
--     record_count number :=0;
--     v_info varchar2(50);
-- begin
--     -- while record_count<=3 loop
--     --   dbms_output.put_line(record_count);
--     --   record_count := record_count+1;
--     -- end loop;
--     for i in 1..5 loop
--         for j in 1..5 loop
--             dbms_output.put_line(i||'   '||j);
--             dbms_output.put_line(' ');
--         end loop;
--     end loop;
--     case 
--         when record_count=3 then
--             dbms_output.put_line('3');
--         else
--             dbms_output.put_line('0');
--     end case;
--     v_info := case 
--             when record_count=3 then
--                 'Good'
--             else 
--                 'Average'
--             end;
--     dbms_output.put_line(v_info);
--     dbms_output.put_line(nvl(to_char(nullif(record_count,0)),'null'));
--     dbms_output.put_line(COALESCE(record_count,'remarks'));
-- end;
-- /

-- CREATE TABLE emp(emp_id NUMBER PRIMARY KEY, emp_name VARCHAR2(20), salary NUMBER);
-- CREATE TABLE log_tab(msg VARCHAR2(50));
-- INSERT INTO emp VALUES(1,'Ravi',20000);
-- INSERT INTO emp VALUES(2,'Sita',30000);
-- COMMIT;

-- create or replace trigger trg_before before insert on emp for each row 
-- begin
--   if :new.salary<=20000 then :new.salary := 50000;
--   end if;
-- end;
-- /

-- create or replace trigger trg_after after delete on emp for each row 
-- begin
--   insert into log_tab values('Delete EMP_ID : '||:old.emp_id);
-- end;
-- /

-- create or replace trigger trg_update after update on emp begin
--   insert into log_tab values('Update table info');
-- end;

-- create view view_emp as select * from emp;
-- create or replace trigger trg_instead instead of insert on emp_view for each row begin
--   insert into emp_view(:new.emp_id,:new.emp_name,:new.salary);
-- end;
-- /
-- INSERT INTO emp VALUES(3,'Priya',5000);
-- UPDATE emp SET salary=salary+1000 WHERE emp_id=1;
-- DELETE FROM emp WHERE emp_id=2;
-- INSERT INTO emp_view VALUES(4,'Kiran',25000);
-- SELECT * FROM emp;
-- SELECT * FROM log_tab;


CREATE TABLE Sailors (
    sid     NUMBER PRIMARY KEY,         -- Sailor ID (integer)
    sname   VARCHAR2 (15) NOT NULL,     -- Sailor's name (string)
    rating NUMBER (3) NOT NULL,         -- Rating (integer)
    age     NUMBER (5, 2)                -- Age (real number, with two decimal points)
);
CREATE TABLE Boats (
    bid     NUMBER PRIMARY KEY,         -- Boat ID (integer)
    bname   VARCHAR2 (15) NOT NULL,     -- Boat name (string)
    color   VARCHAR2 (50)                -- Boat color (string)
);
CREATE TABLE Reserves (
    sid     NUMBER,                     -- Sailor ID (foreign key)
    bid     NUMBER,                     -- Boat ID (foreign key)
    day     DATE,                       -- Date of reservation
    PRIMARY KEY (sid, bid, day),        -- Composite primary key (sid, bid, day must be unique)
    FOREIGN KEY (sid) REFERENCES Sailors (sid),  -- Foreign key from Sailors table
    FOREIGN KEY (bid) REFERENCES Boats (bid)     -- Foreign key from Boats table
);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (22, 'Dustin', 7, 45);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (29, 'Brutus', 1, 33);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (31, 'Lubber', 8, 55.5);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (32, 'Andy', 8, 25.5);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (58, 'Rusty', 10, 35);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (64, 'Horatio', 7, 35);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (71, 'Zorba', 10, 16);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (74, 'Horatio', 9, 40);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (85, 'Art', 3, 25.5);
INSERT INTO Sailors (sid, sname, rating, age) VALUES (95, 'Bob', 3, 63.5);
INSERT INTO Boats (bid, bname, color) VALUES (101, 'Interlake', 'blue');
INSERT INTO Boats (bid, bname, color) VALUES (102, 'Interlake', 'red');
INSERT INTO Boats (bid, bname, color) VALUES (103, 'Clipper', 'green');
INSERT INTO Boats (bid, bname, color) VALUES (104, 'Marine', 'red');
INSERT INTO Reserves (sid, bid, day) VALUES (22, 101, TO_DATE('1998-10-10', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (22, 102, TO_DATE('1998-10-10', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (22, 103, TO_DATE('1998-10-08', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (22, 104, TO_DATE('1998-10-07', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (31, 102, TO_DATE('1998-11-10', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (31, 103, TO_DATE('1998-11-06', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (31, 104, TO_DATE('1998-11-12', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (64, 101, TO_DATE('1998-09-05', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (64, 102, TO_DATE('1998-09-08', 'YYYY-MM-DD'));
INSERT INTO Reserves (sid, bid, day) VALUES (74, 103, TO_DATE('1998-09-08', 'YYYY-MM-DD'));
