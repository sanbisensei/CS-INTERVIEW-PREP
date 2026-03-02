set serveroutput on;

BEGIN
    update instructor
    set salary = salary + 500
    where id = 15151;

    DBMS_OUTPUT.PUT_LINE('count: '|| SQL%ROWCOUNT);
END;
/