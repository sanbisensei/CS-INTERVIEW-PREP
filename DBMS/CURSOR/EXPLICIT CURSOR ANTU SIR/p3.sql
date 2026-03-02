set serveroutput on;

declare
namey instructor.name%TYPE;
salaryy instructor.name%TYPE;
BEGIN
  select name,salary into namey,salaryy
  from instructor
  where id = 99999;

    DBMS_OUTPUT.PUT_LINE(namey || ' ' || salaryy);

    EXCEPTION
    when NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('you are doomed');

END;
/