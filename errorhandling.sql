DECLARE
 marks number := 65;
begin
 if marks>=75 then 
    dbms_output.put_line('First Class');
 else
    dbms_output.put_line('Not First Class');
 end if;
exception
    when others then
        dbms_output.put_line('Error occur');
end;
/