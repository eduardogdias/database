set serveroutput on

declare
    -- %type para quando eu saber o tipo daquela coluna
    -- se o tipo da coluna for alterada, minha variavel com %type vai continuar funcionando
    v_salario employees.salary%type;
begin
    select salary into v_salario from employees where employee_id = 110;
    dbms_output.put_line(v_salario);
end;


--select * from employees where employee_id = 110
