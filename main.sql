declare 
    v_name student_marks.name%type;
    v_marks student_marks.marks%type;
    cursor c1 is
        select name,marks from student_marks where marks>=60;
    no_data exception;
    count_records number :=0;
    begin
      open c1;
      loop
        fetch c1 into v_name,v_marks;
        exit when c1%notfound;
            dbms_output.put_line(v_name||'  '||v_marks);
        count_records := count_records +1;
      end loop;
      close c1;
        if count_records =0 then   
         raise no_data;
        end if;
        exception
          when no_data then
            dbms_output.put_line('No data found');
          when others then
           dbms_output.put_line('Error');
    end;
    /