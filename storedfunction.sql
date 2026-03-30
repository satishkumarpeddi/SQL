create or replace function get_annual_salary(
    p_salary number
)
return number
is 
    v_annual number;
begin
   v_annual := p_salary*12;
   return v_annual;
end;
/
DECLARE
    v_result number;
begin
  v_result := get_annual_salary(100000);
  DBMS_OUTPUT.PUT_LINE(v_result);
end;
/