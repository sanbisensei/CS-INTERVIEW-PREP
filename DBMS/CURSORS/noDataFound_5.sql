--  Declare variables for Name and Salary using %TYPE. Write a PL/SQL block to
-- select employee details for E_ID = 10. Handle the NO_DATA_FOUND exception and
-- print “Employee not found”. (using implicit cursor)



-- Code begins
SET SERVEROUTPUT ON;
SET VERIFY OFF;

Declare
v_name employee.name%type;
v_salary employee.salary%type;
begin
select name,salary into v_name,v_salary
from employee
where E_ID=10;
DBMS_OUTPUT.PUT_LINE('Name: ' || v_name || ', Salary: ' || v_salary);

EXCEPTION

when NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('not found');

end;
/