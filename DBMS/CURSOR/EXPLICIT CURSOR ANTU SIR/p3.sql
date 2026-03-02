set serveroutput on;

declare
namey instructor.name%TYPE;
salaryy instructor.name%TYPE;
BEGIN
    select name,salary into namey,salaryy
    from instructor
    where id = 22222;

    DBMS_OUTPUT.PUT_LINE(namey || ' ' || salaryy);
END;
/