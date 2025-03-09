set serveroutput on

declare
    -- pega o registro inteiro que vai vim do select
    v_registro employees%rowtype;
    
begin
    select * into v_registro from employees where employee_id = 110;
    
    -- o dmbs não suportar printar o registro inteiro, então temos que falar qual
    -- coluna do registro queremos printar, ou ir printando todas uma por uma
    dbms_output.put_line(v_registro.salary);
end;

