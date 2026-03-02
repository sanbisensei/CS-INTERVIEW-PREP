drop table Employee;

create table Employee(
    E_ID NUMBER PRIMARY KEY,
    Name Varchar2 (50),
    Salary Number
);

INSERT INTO Employee VALUES (1, 'Alim', 10000);
INSERT INTO Employee VALUES (2, 'Bob', 4500);
INSERT INTO Employee VALUES (3, 'Carol', 5500);
INSERT INTO Employee VALUES (4, 'David', 6000);
INSERT INTO Employee VALUES (5, 'Eva', 4800);
COMMIT;

select * from Employee;


select * from Employee;