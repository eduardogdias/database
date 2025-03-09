--buscar salario do colaborador com id 110

set serveroutput on

declare
    v_salario number(8,2) not null := 0;
begin
    select salary into v_salario from employees where employee_id = 110;
    dbms_output.put_line(v_salario);
end;


--select * from employees where employee_id = 110