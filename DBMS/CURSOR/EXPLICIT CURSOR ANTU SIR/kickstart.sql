drop table instructor;

create table instructor(
    id number primary key,
    name varchar2(50),
    dept_name varchar2(50),
    salary number
);


INSERT INTO instructor (id, name, dept_name, salary) VALUES (10101, 'Srinivasan', 'Comp. Sci.', 65000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (12121, 'Wasif', 'Finance', 90000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (15151, 'Mozart', 'Music', 40000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (22222, 'Einstein', 'Physics', 95000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (32343, 'El Said', 'History', 60000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (33456, 'Goblin', 'Physics', 87000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (45565, 'Katz', 'Comp. Sci.', 75000);
INSERT INTO instructor (id, name, dept_name, salary) VALUES (58583, 'Califieri', 'History', 62000);

-- Commit the inserts
-- COMMIT;

