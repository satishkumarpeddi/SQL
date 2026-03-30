BEGIN
    -- Insert Ravi if not exists
        INSERT INTO students VALUES (1, 'Ravi', 75);
        DBMS_OUTPUT.PUT_LINE('Inserted Ravi Record');
            DBMS_OUTPUT.PUT_LINE('Ravi already exists, skipping insert');

    -- Insert Sita if not exists
        INSERT INTO students VALUES (2, 'Sita', 82);
        DBMS_OUTPUT.PUT_LINE('Inserted Sita Record');

    SAVEPOINT sp1;
    DBMS_OUTPUT.PUT_LINE('Savepoint sp1 created');

    -- Insert Ram
    INSERT INTO students VALUES (3, 'Ram', 99);
    DBMS_OUTPUT.PUT_LINE('Inserted Ram Record');

    -- Insert Mita
    BEGIN
        INSERT INTO students VALUES (2, 'Mita', 65);
        DBMS_OUTPUT.PUT_LINE('Inserted Mita Record');
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Duplicate ID found, rolling back to savepoint sp1');
            ROLLBACK TO sp1;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Changes committed');
END;
/