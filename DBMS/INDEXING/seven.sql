SET SERVEROUTPUT ON;
set verify off;


CREATE OR REPLACE TRIGGER backup_student_after_insert
AFTER INSERT ON students
FOR EACH ROW
BEGIN
    INSERT INTO backup_students 
    VALUES (
        :NEW.student_id, 
        :NEW.name, 
        :NEW.semester_fee, 
        :NEW.current_semester, 
        :NEW.dept_name,
        SYSDATE,
        USER
    );
    DBMS_OUTPUT.PUT_LINE('Backup created after insert for student: ' || :NEW.name);
END;
/

-- Test:
INSERT INTO students VALUES (103, 'Alice Johnson', 26000, 4, 'BBA');
SELECT * FROM backup_students;