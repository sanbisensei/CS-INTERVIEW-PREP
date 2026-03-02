set serveroutput on;

declare
    cursor ic is
    select id,name,dept_name,salary
    from instructor;

    idy instructor.id%TYPE;
    namey instructor.name%TYPE;
    depty instructor.dept_name%TYPE;
    salaryy instructor.salary%TYPE;
BEGIN
    open ic;
    
    loop
    fetch ic into idy,namey,depty,salaryy;
    exit when ic%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(idy||namey||depty||salaryy);
    end loop;
close ic;
END;
/