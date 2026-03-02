-- Write a PL/SQL program using an explicit cursor that retrieves all rows from the
-- EMPLOYEE table and checks each employee’s salary. If an employee's salary is less
-- than 7000, increase it by 500 using an UPDATE statement with a proper WHERE
-- clause to ensure only the matching row is updated. For each row processed, display a
-- message using DBMS_OUTPUT.PUT_LINE indicating whether the salary was
-- updated or not, based on the condition. The program should use cursor control
-- statements (OPEN, FETCH, EXIT WHEN, CLOSE) and conditional logic inside a
-- loop to handle per-row processing.



SET SERVEROUTPUT ON;

DECLARE
    -- Define an explicit cursor to select all employees
    CURSOR emp_cursor IS
        SELECT employee_id, first_name, last_name, salary
        FROM employee;

    -- Record variable to hold fetched row
    emp_record emp_cursor%ROWTYPE;

BEGIN
    -- Open the cursor
    OPEN emp_cursor;

    LOOP
        -- Fetch each row into the record variable
        FETCH emp_cursor INTO emp_record;
        
        -- Exit the loop when no more rows
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Check salary condition
        IF emp_record.salary < 7000 THEN
            -- Update salary by 500
            UPDATE employee
            SET salary = salary + 500
            WHERE employee_id = emp_record.employee_id;

            -- Display message
            DBMS_OUTPUT.PUT_LINE('Salary updated for ' || emp_record.first_name || ' ' || emp_record.last_name || 
                                 ' (ID: ' || emp_record.employee_id || ') - New Salary: ' || (emp_record.salary + 500));
        ELSE
            -- Display message if no update
            DBMS_OUTPUT.PUT_LINE('Salary not updated for ' || emp_record.first_name || ' ' || emp_record.last_name || 
                                 ' (ID: ' || emp_record.employee_id || ') - Current Salary: ' || emp_record.salary);
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;

    -- Commit changes
    COMMIT;

END;
/