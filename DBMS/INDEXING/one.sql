SET SERVEROUTPUT ON;
set verify off;

CREATE OR REPLACE PROCEDURE insert_student (
    p_student_id IN NUMBER,
    p_name IN VARCHAR2,
    p_semester_fee IN NUMBER,
    p_current_semester IN NUMBER,
    p_dept_name IN VARCHAR2
)
IS
BEGIN
    INSERT INTO students 
    VALUES (p_student_id, p_name, p_semester_fee, p_current_semester, p_dept_name);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Student record inserted successfully!');
END insert_student;
/

-- Execution:
EXEC insert_student(101, 'John Doe', 25000, 5, 'CSE');
