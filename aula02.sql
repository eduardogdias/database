--select count(*) from user_objects; --168
--select count(*) from all_objects; --86245



--habilitando a sa�da (print)
set serveroutput on

-----------------------------------

declare
    --declara��o da vari�vel (cursor)
    qtd_registros number(3);


begin
    --into joga a quantidade retornada dentro da vari�vel
    --a vari�vel est� sendo o cursor que recebe o conjunto de dados que est� vindo do select
    select count(*) into qtd_registros from employees;

    --printando:
    --dbms_output = pacote (bibliotea)
    --put_line = m�todo do pacote
    dbms_output.put_line('Quantidade de registros: ' || qtd_registros);
    
end;
