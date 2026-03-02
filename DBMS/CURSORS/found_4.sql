-- Write a PL/SQL block to increase the salary by 300 for employee ID 3. Use
-- SQL%FOUND to print whether the update succeeded or no record was found. (using
-- implicit cursor)


-- Code begins
SET SERVEROUTPUT ON;
SET VERIFY OFF;

begin
update Employee
set salary = salary+300
where E_ID = 3;


IF SQL%FOUND THEN
DBMS_OUTPUT.PUT_LINE('Update succeeded.');
ELSE
DBMS_OUTPUT.PUT_LINE('Wind blows.');
END IF;
end;
/
