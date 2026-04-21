-- DECLARE
--  a NUMBER := 10;
--  b NUMBER := 20; 
--  c NUMBER;
-- BEGIN
--  	c := a+b;
--     	DBMS_OUTPUT.PUT_LINE('Sum :'||c);
-- END;
-- /

-- ACCEPT num PROMPT 'Enter a number: '

-- BEGIN
--   DBMS_OUTPUT.PUT_LINE('You entered: ' || &num);
-- END;
-- /

	accept a prompt 'Enter value for a : '
	accept a prompt 'Enter value for b : '
declare
	v_a number := &a;
	v_b number := &b;
	c number := 0;
begin
	c := v_a+v_b;
	dbms_output.put_line('Sum of two number : '|| c);
end;
/