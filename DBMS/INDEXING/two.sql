SET SERVEROUTPUT ON;
set verify off;

CREATE OR REPLACE PROCEDURE update_fee (
    p_student_id IN NUMBER,
    p_amount IN NUMBER,
    p_updated_fee OUT NUMBER
)
IS
BEGIN
    UPDATE students
    SET semester_fee = semester_fee + p_amount
    WHERE student_id = p_student_id;
    
    SELECT semester_fee INTO p_updated_fee
    FROM students
    WHERE student_id = p_student_id;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fee updated successfully. New fee: ' || p_updated_fee);
END update_fee;
/


DECLARE
    v_new_fee NUMBER;
BEGIN
    update_fee(101, 2000, v_new_fee);
    DBMS_OUTPUT.PUT_LINE('Updated Fee: ' || v_new_fee);
END;
/