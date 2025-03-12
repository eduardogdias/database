set serveroutput on
 
declare
    -- variavel que ira armazenar o employee_id
    v_employee_id employees.employee_id%type;
    -- variavel que ira armazenar um registro inteiro (buscando da tabela JOBS)
    v_jobs jobs%rowtype;
 
begin
 
    -- armazenar o maior valor de employee_id na variavel
    select max(employee_id)
    into v_employee_id
    from employees;
    dbms_output.put_line(v_employee_id);

    -- armazenar na variavel o registro da JOBS que tenha a maior faixa salarial
    select *
    into v_jobs
    from jobs 
    where max_salary = (select max(max_salary) from jobs);
    dbms_output.put_line('Codigo: ' || v_jobs.job_id || ' Cargo: ' || v_jobs.job_title);
 
end;
 