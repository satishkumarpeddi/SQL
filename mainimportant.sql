create or replace function grade_cal(marks number) return varchar2 is grade varchar2(50);
begin 
  if marks>=18 then
    grade := 'A+';
  end if;
  return grade;
end; 
/

select sname,grade_cal(age) from studentsdemo;