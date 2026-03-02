SET SERVEROUTPUT ON;

DECLARE
    -- Explicit cursor selecting necessary columns
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, last_name, salary
        FROM employee;

    -- Variables to hold each column
    v_employee_id employee.employee_id%TYPE;
    v_first_name  employee.first_name%TYPE;
    v_last_name   employee.last_name%TYPE;
    v_salary      employee.salary%TYPE;

BEGIN
    -- Open the cursor
    OPEN emp_cursor;

    LOOP
        -- Fetch each row into the individual variables
        FETCH emp_cursor INTO v_employee_id, v_first_name, v_last_name, v_salary;
        
        -- Exit loop when no more rows
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Check if salary is less than 7000
        IF v_salary < 7000 THEN
            -- Update salary by 500 for this employee only
            UPDATE employee
            SET salary = salary + 500
            WHERE employee_id = v_employee_id;

            -- Display message
            DBMS_OUTPUT.PUT_LINE('Salary updated for ' || v_first_name || ' ' || v_last_name || 
                                 ' (ID: ' || v_employee_id || ') - New Salary: ' || (v_salary + 500));
        ELSE
            -- Display message if no update
            DBMS_OUTPUT.PUT_LINE('Salary not updated for ' || v_first_name || ' ' || v_last_name || 
                                 ' (ID: ' || v_employee_id || ') - Current Salary: ' || v_salary);
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;

    -- Commit updates
    COMMIT;

END;
/