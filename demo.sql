begin 
    insert into studentsdemo values(1,'Ravi',18);
    DBMS_OUTPUT.PUT_LINE('Inserted into Ravi Student.');
    savepoint sp1;
    DBMS_OUTPUT.PUT_LINE('SavePoint is Created.');
    insert into studentsdemo values(2,'Sita',19);
    DBMS_OUTPUT.PUT_LINE('Inserted into Sita Student.');
    savepoint sp2;
    DBMS_OUTPUT.PUT_LINE('SavePoint is Created.');
  begin
    insert into studentsdemo values(2,'Mita',20);
    exception
      when dup_val_on_index then
      DBMS_OUTPUT.PUT_LINE('Duplicate value on index');
      rollback to sp1;
  end;
  commit;
  DBMS_OUTPUT.PUT_LINE('Changes Commited.');
end;
/