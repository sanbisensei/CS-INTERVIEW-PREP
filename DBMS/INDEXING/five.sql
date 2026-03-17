SET SERVEROUTPUT ON;
set verify off;

CREATE OR REPLACE TRIGGER backup_student_before_delete
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO backup_students 
    VALUES (
        :OLD.student_id, 
        :OLD.name, 
        :OLD.semester_fee, 
        :OLD.current_semester, 
        :OLD.dept_name,
        SYSDATE,
        USER
    );
    DBMS_OUTPUT.PUT_LINE('Backup created for student: ' || :OLD.name);
END;
/

DELETE FROM students WHERE student_id = 101;
SELECT * FROM backup_students;