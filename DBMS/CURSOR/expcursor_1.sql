-- Write a PL/SQL block using a user-defined cursor to fetch the name and salary from
-- the employee table and print the total number of rows fetched.

SET SERVEROUTPUT ON; -- Enable DBMS_OUTPUT to print messages

DECLARE
    -- Declare variables to hold values fetched from the employee table
    v_eid    employee.e_id%TYPE;     -- Employee ID
    v_name   employee.name%TYPE;     -- Employee Name
    v_salary employee.salary%TYPE;   -- Employee Salary

    -- Declare a user-defined cursor to fetch all employees
    CURSOR c_employee IS
        SELECT e_id, name, salary
        FROM employee;

BEGIN
    -- Open the cursor: executes the SELECT query and prepares it for fetching
    OPEN c_employee;

    -- Loop to fetch each row from the cursor
    LOOP
        -- Fetch one row from the cursor into variables
        FETCH c_employee INTO v_eid, v_name, v_salary;

        -- Exit loop when no more rows are left
        EXIT WHEN c_employee%NOTFOUND;

        -- Print the current row's details
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_eid || ', Name: ' || v_name || ', Salary: ' || v_salary
        );
    END LOOP;

    -- After loop ends, print total number of rows fetched
    DBMS_OUTPUT.PUT_LINE('Total rows fetched: ' || c_employee%ROWCOUNT);

    -- Close the cursor to release memory and resources
    CLOSE c_employee;

END;
/