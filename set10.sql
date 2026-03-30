declare 
    v_name varchar2(100);
    v_marks number;
    cursor student_info is select sname,smarks from students where smarks>75;
begin
    open student_info;
    loop
      fetch student_info into v_name , v_marks;
      exit when student_info%notfound;
      dbms_output.put_line('student v_name : '||v_name||'student v_marks: '||v_marks);
    end loop;
    exception
      when no_data_found then
        dbms_output.put_line('Data not found.');
      when others then
        dbms_output.put_line('An errored : '||sqlerrm);
end;
/