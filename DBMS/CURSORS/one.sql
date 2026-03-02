-- Code begins
SET SERVEROUTPUT ON;
SET VERIFY OFF;

Begin
update Employee
set salary = salary + 500
where salary < 5000;

DBMS_OUTPUT.PUT_LINE('Rows Updated:'|| SQL%ROWCOUNT);
End;
/