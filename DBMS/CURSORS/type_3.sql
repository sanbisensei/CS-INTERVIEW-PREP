-- Code begins
SET SERVEROUTPUT ON;
SET VERIFY OFF;

Declare
v_name employee.name%type;
v_salary employee.salary%type;
Begin
select name,salary into v_name,v_salary
from employee
where E_ID=2;

DBMS_OUTPUT.PUT_LINE('Name:'|| v_name|| 'salary:' || v_salary);
end;
/