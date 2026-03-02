DROP TABLE STUDENT_EXAM;

CREATE TABLE STUDENT_EXAM (
    ID NUMBER PRIMARY KEY,
    NUMBER_OF_ATTENDANCE NUMBER,
    EXAM_NUMBER NUMBER
);
INSERT INTO STUDENT_EXAM VALUES (1, 12, 67);
INSERT INTO STUDENT_EXAM VALUES (2, 8, 37);
INSERT INTO STUDENT_EXAM VALUES (3, 3, 38);
INSERT INTO STUDENT_EXAM VALUES (4, 11, 41);
INSERT INTO STUDENT_EXAM VALUES (5, 6, 39);
INSERT INTO STUDENT_EXAM VALUES (6, 4, 25);
INSERT INTO STUDENT_EXAM VALUES (7, 9, 42);
INSERT INTO STUDENT_EXAM VALUES (8, 7, 33);





SET SERVEROUTPUT ON;

DECLARE
    CURSOR student_cursor IS
        SELECT ID, NUMBER_OF_ATTENDANCE, EXAM_NUMBER
        FROM STUDENT_EXAM;

    v_id STUDENT_EXAM.ID%TYPE;
    v_attendance STUDENT_EXAM.NUMBER_OF_ATTENDANCE%TYPE;
    v_marks STUDENT_EXAM.EXAM_NUMBER%TYPE;
    v_bonus NUMBER;
    v_count NUMBER := 0;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor INTO v_id, v_attendance, v_marks;
        EXIT WHEN student_cursor%NOTFOUND;

        IF v_marks >= 40 THEN
            DBMS_OUTPUT.PUT_LINE('Already Passed. No update for ID: ' || v_id);

        ELSE
            IF v_attendance BETWEEN 3 AND 5 THEN
                v_bonus := 2;
            ELSIF v_attendance BETWEEN 6 AND 10 THEN
                v_bonus := 3;
            ELSIF v_attendance > 10 THEN
                v_bonus := 4;
            ELSE
                v_bonus := 0;
            END IF;

            IF v_bonus > 0 THEN
                UPDATE STUDENT_EXAM
                SET EXAM_NUMBER = EXAM_NUMBER + v_bonus
                WHERE ID = v_id;

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