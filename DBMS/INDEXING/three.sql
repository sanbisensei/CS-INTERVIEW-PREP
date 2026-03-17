CREATE OR REPLACE FUNCTION calculate_scholarship (
    p_semester_fee IN NUMBER
)
RETURN NUMBER
IS
    v_scholarship NUMBER;
BEGIN
    v_scholarship := p_semester_fee * 0.15;
    RETURN v_scholarship;
END calculate_scholarship;
/

-- Execution:
DECLARE
    v_fee NUMBER := 25000;
    v_scholarship NUMBER;
BEGIN
    v_scholarship := calculate_scholarship(v_fee);
    DBMS_OUTPUT.PUT_LINE('Semester Fee: ' || v_fee);
    DBMS_OUTPUT.PUT_LINE('Scholarship (15%): ' || v_scholarship);
END;
/