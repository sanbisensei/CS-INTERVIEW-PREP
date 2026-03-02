-- Write a PL/SQL block to delete an employee with E_ID = 100 from the employee
-- table. Use the SQL%NOTFOUND attribute to check whether any row was actually
-- deleted. (using implicit cursor)



-- Code begins
SET SERVEROUTPUT ON;
SET VERIFY OFF;

begin
delete from employee
where E_ID=100;

if SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('not found');
ELSE
DBMS_OUTPUT.PUT_LINE('deleted successfully');
end if;
end;
/