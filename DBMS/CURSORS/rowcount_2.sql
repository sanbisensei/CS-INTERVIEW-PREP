-- Write a PL/SQL block that increases the salary by 500 for all employees whose salary
-- is less than 5000. Print the number of rows updated using SQL%ROWCOUNT.
-- (using implicit cursor)


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