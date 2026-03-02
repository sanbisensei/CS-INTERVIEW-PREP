set serveroutput on;

declare

BEGIN
  DELETE from instructor
  where id = 12345;

  if SQL%NOTFOUND THEN
    DBMS_OUTPUT.PUT_LINE('not found');
    else
    DBMS_OUTPUT.PUT_LINE('found');
    end if;
END;
/