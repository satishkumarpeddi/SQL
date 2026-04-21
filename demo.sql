declare 
    v_message varchar(50) := 'Hello';
begin
  DBMS_OUTPUT.PUT_LINE(v_message);
exception
  when others THEN
    DBMS_OUTPUT.PUT_LINE('An error occurred.');
end;
/