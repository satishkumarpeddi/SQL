create or replace procedure get_info(
    p_id in students.student_id%type,
    p_name out varchar2,
    p_marks out number
)
is 
begin
  select student_name, marks into p_name,p_marks from students where student_id = p_id;
  exception
    when no_data_found then
        p_name := 'Not found';
        p_marks := NULL;
end;
/
declare 
    v_id students.student_id%type;
    v_name varchar2(50);
    v_marks number;
begin
    v_id := &v_id;
    get_info(v_id,v_name,v_marks);
    dbms_output.put_line('v_id : '||v_id||'v_name : '||v_name||'v_marks : '||v_marks);

end;
/