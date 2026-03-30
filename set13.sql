SET SERVEROUTPUT ON;

DECLARE
    -- Variables
    v_counter NUMBER := 1;
    v_marks student_marks.marks%TYPE;
    v_name student_marks.student_name%TYPE;
    v_total NUMBER := 0;
    v_avg NUMBER;

    -- User-defined exception
    ex_low_marks EXCEPTION;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== WHILE LOOP =====');

    ----------------------------------------------------
    -- 1. WHILE LOOP
    ----------------------------------------------------
    WHILE v_counter <= 3 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter value: ' || v_counter);
        v_counter := v_counter + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('===== NUMERIC FOR LOOP =====');

    ----------------------------------------------------
    -- 2. NUMERIC FOR LOOP
    ----------------------------------------------------
    FOR i IN 1..4 LOOP
        SELECT marks INTO v_marks
        FROM student_marks
        WHERE student_id = i;

        DBMS_OUTPUT.PUT_LINE('Student ID ' || i || ' Marks: ' || v_marks);
        v_total := v_total + v_marks;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('===== NESTED LOOP =====');

    ----------------------------------------------------
    -- 3. NESTED LOOP
    ----------------------------------------------------
    FOR i IN 1..2 LOOP
        DBMS_OUTPUT.PUT_LINE('Outer Loop i = ' || i);

        FOR j IN 1..3 LOOP
            DBMS_OUTPUT.PUT_LINE('   Inner Loop j = ' || j);
        END LOOP;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('===== BUILT-IN EXCEPTION =====');

    ----------------------------------------------------
    -- 4. BUILT-IN EXCEPTION (NO_DATA_FOUND)
    ----------------------------------------------------
    BEGIN
        SELECT student_name INTO v_name
        FROM student_marks
        WHERE student_id = 10; -- does not exist

        DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Built-in Exception: No student found with ID 10.');
    END;

    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('===== USER-DEFINED EXCEPTION =====');

    ----------------------------------------------------
    -- 5. USER-DEFINED EXCEPTION
    ----------------------------------------------------
    SELECT marks INTO v_marks
    FROM student_marks
    WHERE student_id = 3;

    IF v_marks < 35 THEN
        RAISE ex_low_marks;
    END IF;

    ----------------------------------------------------
    -- 6. AVERAGE CALCULATION
    ----------------------------------------------------
    v_avg := v_total / 4;
    DBMS_OUTPUT.PUT_LINE('Average Marks: ' || v_avg);

EXCEPTION
    ----------------------------------------------------
    -- Handling user-defined exception
    ----------------------------------------------------
    WHEN ex_low_marks THEN
        DBMS_OUTPUT.PUT_LINE('User-defined Exception: Student has failed (marks below 35).');

    ----------------------------------------------------
    -- Handling built-in exception
    ----------------------------------------------------
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Built-in Exception: Division by zero error.');

    ----------------------------------------------------
    -- Handling all other exceptions
    ----------------------------------------------------
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Other Error: ' || SQLERRM);
END;
/