SET SERVEROUTPUT ON;

DECLARE
    -- Cursor declaration
    CURSOR student_cursor IS
        SELECT ID, NUMBER_OF_ATTENDANCE, EXAM_NUMBER
        FROM STUDENT_EXAM
        FOR UPDATE;

    -- Variables
    v_id STUDENT_EXAM.ID%TYPE;
    v_attendance STUDENT_EXAM.NUMBER_OF_ATTENDANCE%TYPE;
    v_marks STUDENT_EXAM.EXAM_NUMBER%TYPE;
    v_bonus NUMBER := 0;
    v_count NUMBER := 0;

BEGIN

    OPEN student_cursor;

    LOOP
        FETCH student_cursor INTO v_id, v_attendance, v_marks;
        EXIT WHEN student_cursor%NOTFOUND;

        -- Check if already passed
        IF v_marks >= 40 THEN
            DBMS_OUTPUT.PUT_LINE('Already Passed. No update for ID: ' || v_id);

        ELSE
            -- Bonus calculation
            IF v_attendance BETWEEN 3 AND 5 THEN
                v_bonus := 2;
            ELSIF v_attendance BETWEEN 6 AND 10 THEN
                v_bonus := 3;
            ELSIF v_attendance > 10 THEN
                v_bonus := 4;
            ELSE
                v_bonus := 0;
            END IF;

            -- Apply bonus if any
            IF v_bonus > 0 THEN
                UPDATE STUDENT_EXAM
                SET EXAM_NUMBER = EXAM_NUMBER + v_bonus
                WHERE CURRENT OF student_cursor;

                DBMS_OUTPUT.PUT_LINE('Bonus +' || v_bonus || ' added for ID: ' || v_id);
                v_count := v_count + 1;
            ELSE
                DBMS_OUTPUT.PUT_LINE('No bonus applicable for ID: ' || v_id);
            END IF;

        END IF;

    END LOOP;

    CLOSE student_cursor;

    DBMS_OUTPUT.PUT_LINE('Total Students Updated: ' || v_count);

END;
/