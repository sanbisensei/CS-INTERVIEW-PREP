SET SERVEROUTPUT ON;
set verify off;

CREATE TABLE backup_students (
    student_id NUMBER,
    name VARCHAR2(100),
    semester_fee NUMBER,
    current_semester NUMBER,
    dept_name VARCHAR2(50),
    deleted_at DATE,
    deleted_by VARCHAR2(50)
);