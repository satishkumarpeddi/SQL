DECLARE 
    name varchar2(15);
begin
  select sname into name from student where sid=1;
  dbms_output.put_line(name);
end;
/