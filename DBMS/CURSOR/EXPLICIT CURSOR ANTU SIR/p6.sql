set serveroutput on;

declare
cursor ic is
select id,salary from instructor where salary <60000;

idy instructor.id%TYPE;
salaryy instructor.salary%TYPE;
cnt number :=0;

BEGIN
open ic;
loop
    fetch ic into idy,salaryy;
    exit when ic%NOTFOUND;

    update instructor
    set salary = salary +1000
    where id = idy;
    cnt:= cnt+1;
end loop;
close ic;
    DBMS_OUTPUT.PUT_LINE(cnt);
END;
/