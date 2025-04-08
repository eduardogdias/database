set serveroutput on 

-- laco de repeticao FOR e cursor implicito:
begin

    -- ler o conteudo da tabela employees
    -- cursor implicito sendo lido linha a linha e carregado na variavel registro
    for registro in (select * from employees) loop 
        -- alguma acao
        dbms_output.put_line(registro.employee_id);
    end loop; 
    
    -- sql%rowcount - o nome dee um cursor anonimo por default � 'sql'
    dbms_output.put_line('A query retornou ' || sql%rowcount || ' registros');
    -- nesse caso ele fechou o cursor no for
    
    
end;

--------------------------------------------------

-- correcao cp1

-- ex1:
-- cria com a mesma estrutura, mas sem os dados
create table audit_employees as 
select * 
from employees
where 1=0;

-- adiciona os campos
alter table audit_employees add (
audit_user varchar2(3) not null,
audit_action char(1) not null,
audit_date date default sysdate not null
)


-- ex3:
declare
    v_employees employees%rowtype;
begin
    -- parte a)
    -- o registro com maior employee_id
    select * 
    into v_employees  
    from employees 
    where(select max(employee_id) from employees)
    
    -- parte b)
    insert into audit_employees values(
    ...
    'RM1234',
    'I',
    default);
end;
