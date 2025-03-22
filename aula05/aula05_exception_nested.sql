
set serveroutput on;


-- select sysdate ,current_date from employees;
-- data e hora do servidor e do cliente, respectivamente

-----------------------------------------------------

/*
select sysdate,
        to_char(current_date, 'DD/MM/YYYY HH24:MI:SS')
from employees;



begin
    dbms_output.put_line(to_char(current_date, 'DD/MM/YYYY HH24:MI:SS'));

end;
*/

-----------------------------------------------------

/*
declare 
    v_salario employees.salary%type;
    
begin
    select salary
    into v_salario 
    from employees 
    --where employee_id = 100;
    where 1=0;
    
    dbms_output.put_line(v_salario);
    

exception
    when no_data_found then dbms_output.put_line('Nao foram encontrados registros');
end;

*/

-----------------------------------------------------
-- NESTED
declare 
    v_salario employees.salary%type;
    v_nome_externo employees.first_name%type;
begin

    <<bloco_interno>> --alias (apelido do bloco interno)
    declare
        v_nome employees.first_name%type;
    begin
        select salary, first_name
        into v_salario, v_nome
        from employees 
        where employee_id = 100;
        dbms_output.put_line(v_salario || v_nome);
        
        v_nome_externo := v_nome; -- atribuindo valor a variavel externa
    end;
    
    dbms_output.put_line(v_salario || v_nome_externo);
    
exception
    when no_data_found then dbms_output.put_line('Nao foram encontrados registros');
    when too_many_rows then dbms_output.put_line('Foram encontrados muito registros');
end;

