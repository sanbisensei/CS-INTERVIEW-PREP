SET SERVEROUTPUT ON;
set verify off;


CREATE OR REPLACE TRIGGER backup_student_before_update
BEFORE UPDATE ON students
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
    DBMS_OUTPUT.PUT_LINE('Backup created before update for student: ' || :OLD.name);
END;
/


UPDATE students SET semester_fee = 28000 WHERE student_id = 102;
SELECT * FROM backup_students;