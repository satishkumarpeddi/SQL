-- Create the employees table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER(8, 2),
    department_id NUMBER
);

-- Insert some sample data
INSERT INTO employees VALUES (1, 'Alice', 60000.00, 10);
INSERT INTO employees VALUES (2, 'Bob', 75000.00, 20);
INSERT INTO employees VALUES (3, 'Charlie', 55000.00, 10);
INSERT INTO employees VALUES (4, 'David', 80000.00, 30);
INSERT INTO employees VALUES (5, 'Eve', 70000.00, 20);

COMMIT;

declare
    v_employee_id number;
    v_name varchar2(50);
    v_salary number;
    v_dept_id  number:= &v_dept_id;
  cursor employees_info is select employee_id,name,salary from employees where department_id = v_dept_id for update;
begin
  open employees_info;
  loop
    fetch employees_info into v_employee_id,v_name,v_salary;
    exit when employees_info%notfound;
    if v_salary > 75000 then
        DBMS_OUTPUT.PUT_LINE('High Salary Employee: ID=' || v_employee_id || ', Name=' || v_name || ', Salary=' || v_salary);
    else 
         DBMS_OUTPUT.PUT_LINE('Low Salary Employee: ID=' || v_employee_id || ', Name=' || v_name || ', Salary=' || v_salary);
    end if;
    update employees set salary = v_salary+500 where employee_id = v_employee_id;
  end loop;
    close employees_info;
end;
/