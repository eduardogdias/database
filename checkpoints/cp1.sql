
/*
-- 1 -----------------------------------------------------------------
create table AUDIT_EMPLOYEES as select * from employees where 1 = 0;

alter table AUDIT_EMPLOYEES 
add AUDIT_USER varchar(30) not null
add AUDIT_ACTION char(1) not null
add AUDIT_DATE timestamp default current_timestamp not null;
*/



/*
-- 2 -----------------------------------------------------------------
insert into employees values(
(select max(employee_id) + 1 from employees),
'Eduardo', 
'Dias', 
'rm557886@fiap.com.br',
'11990087766',
'25-02-02',
'IT_PROG',
8500.50,
null,
(select employee_id from employees where job_id = 'AD_PRES'),
(select department_id from departments where manager_id = (select employee_id from employees where job_id = 'AD_PRES'))
);
*/



/*
-- 3 -----------------------------------------------------------------

declare
    registro employees%rowtype;
begin
    -- Questão a)
    select * into registro from employees where employee_id = (select max(employee_id) from employees);
    
    
    -- Questão b)
    insert into AUDIT_EMPLOYEES values (
        registro.employee_id, 
        registro.first_name, 
        registro.last_name, 
        registro.email, 
        registro.phone_number, 
        registro.hire_date, 
        registro.job_id, 
        registro.salary, 
        registro.commission_pct, 
        registro.manager_id, 
        registro.department_id, 
        '557886',  
        'I',        
        default  
        --ou sysdate
    );

end;
*/








