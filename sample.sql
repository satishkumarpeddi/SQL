declare
 v_num number := 5;
 v_i number :=1;
 v_j number; 
 v_result number;
 ex_neg exception;
begin
  while v_i<=v_num loop
    dbms_output.put_line(v_i);
    v_i:=v_i+1;
  end loop;
  v_num:=-1;
  if v_num<0 then
    raise ex_neg;
  end if;
    v_result := 1/0;
    exception
      when zero_divide then
        dbms_output.put_line('Zero divide error');
      when ex_neg then
        dbms_output.put_line('Negitive error');
end;
/