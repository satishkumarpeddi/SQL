DECLARE
 a NUMBER := 10;
 b NUMBER := 20; 
 c NUMBER;
BEGIN
 	c := a+b;
    	DBMS_OUTPUT.PUT_LINE('Sum :'||c);
END;
/