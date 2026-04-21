-- create or replace function get_annual_salary(
--     p_salary number
-- )
-- return number
-- is 
--     v_annual number;
-- begin
--    v_annual := p_salary*12;
--    return v_annual;
-- end;
-- /
-- DECLARE
--     v_result number;
-- begin
--   v_result := get_annual_salary(100000);
--   DBMS_OUTPUT.PUT_LINE(v_result);
-- end;
-- /

-- create or replace function get_annual_salary(p_salary number) return number is v_annual number;
-- begin
--  v_annual := p_salary * 12;
--  return v_annual; 
-- end;
-- /
-- DECLARE
--     v_num_annual number := 0;
-- begin
--     v_num_annual:= get_annual_salary(100000);
--     dbms_output.put_line(v_num_annual);
-- end;
-- /

--sorted functions for addition of two number


create or replace function add_method_function(a number,b number) return number is result number;
begin
 result:=a+b;
 return result; 
end;
/
declare
    result_value number := 0;
begin
    result_value := add_method_function(10,30);
    dbms_output.put_line('Result value := '||result_value);
end;
/