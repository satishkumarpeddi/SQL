CREATE TABLE student_marks (
    student_id NUMBER PRIMARY KEY,
    student_name VARCHAR2(50),
    marks NUMBER,
    attendance NUMBER,
    remarks VARCHAR2(50)
);
INSERT INTO student_marks VALUES (1, 'Alice', 92, 85, NULL);
INSERT INTO student_marks VALUES (2, 'Bob', 76, 65, 'Good');
INSERT INTO student_marks VALUES (3, 'Charlie', 45, NULL, NULL);
INSERT INTO student_marks VALUES (4, 'David', 30, 55, 'Needs Improvement');

COMMIT;
SET SERVEROUTPUT ON;

DECLARE
    v_id student_marks.student_id%TYPE := 1;
    v_name student_marks.student_name%TYPE;
    v_marks student_marks.marks%TYPE;
    v_attendance student_marks.attendance%TYPE;
    v_remarks student_marks.remarks%TYPE;
    
    v_grade VARCHAR2(5);
    v_result VARCHAR2(20);
    v_att_status VARCHAR2(20);
    v_safe_attendance NUMBER;
    
BEGIN
    -- Fetch student data
    SELECT student_name, marks, attendance, remarks
    INTO v_name, v_marks, v_attendance, v_remarks
    FROM student_marks
    WHERE student_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);

    ---------------------------------------------------
    -- 1. NESTED IF
    ---------------------------------------------------
    IF v_marks >= 35 THEN
        IF v_marks >= 75 THEN
            v_result := 'Passed with Distinction';
        ELSE
            v_result := 'Passed';
        END IF;
    ELSE
        v_result := 'Failed';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Result (Nested IF): ' || v_result);

    ---------------------------------------------------
    -- 2. CASE STATEMENT
    ---------------------------------------------------
    CASE
        WHEN v_marks >= 90 THEN
            v_grade := 'A+';
        WHEN v_marks >= 75 THEN
            v_grade := 'A';
        WHEN v_marks >= 60 THEN
            v_grade := 'B';
        WHEN v_marks >= 35 THEN
            v_grade := 'C';
        ELSE
            v_grade := 'F';
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Grade (CASE Statement): ' || v_grade);

    ---------------------------------------------------
    -- 3. CASE EXPRESSION
    ---------------------------------------------------
    v_att_status := CASE
                        WHEN v_attendance >= 75 THEN 'Good Attendance'
                        WHEN v_attendance >= 50 THEN 'Average Attendance'
                        ELSE 'Low Attendance'
                    END;

    DBMS_OUTPUT.PUT_LINE('Attendance Status (CASE Expression): ' || v_att_status);

    ---------------------------------------------------
    -- 4. NULLIF FUNCTION
    ---------------------------------------------------
    -- If attendance is 0, NULLIF returns NULL
    v_safe_attendance := NULLIF(v_attendance, 0);

    DBMS_OUTPUT.PUT_LINE('Attendance after NULLIF: ' || NVL(TO_CHAR(v_safe_attendance), 'NULL'));

    ---------------------------------------------------
    -- 5. COALESCE FUNCTION
    ---------------------------------------------------
    -- Returns first non-null value
    v_remarks := COALESCE(v_remarks, 'No Remarks Available');

    DBMS_OUTPUT.PUT_LINE('Remarks using COALESCE: ' || v_remarks);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student found with given ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/