CREATE TABLE student (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    age NUMBER,
    course VARCHAR2(50)
);
SET SERVEROUTPUT ON;

BEGIN
    -- Insert first two records
    INSERT INTO student VALUES (1, 'Alice', 20, 'CSE');
    INSERT INTO student VALUES (2, 'Bob', 21, 'ECE');

    DBMS_OUTPUT.PUT_LINE('First 2 records inserted.');

    -- Savepoint created
    SAVEPOINT sp1;
    DBMS_OUTPUT.PUT_LINE('SAVEPOINT sp1 created.');

    -- Insert more records
    INSERT INTO student VALUES (3, 'Charlie', 22, 'MECH');
    INSERT INTO student VALUES (4, 'David', 19, 'EEE');

    DBMS_OUTPUT.PUT_LINE('Next 2 records inserted.');

    -- Rollback to savepoint
    ROLLBACK TO sp1;
    DBMS_OUTPUT.PUT_LINE('Rolled back to SAVEPOINT sp1.');

    -- Insert another record after rollback
    INSERT INTO student VALUES (5, 'Eva', 20, 'IT');
    DBMS_OUTPUT.PUT_LINE('Inserted record after rollback.');

    -- Final commit
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred. Transaction rolled back.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/