--select count(*) from user_objects; --168
--select count(*) from all_objects; --86245



--habilitando a saída (print)
set serveroutput on

-----------------------------------

declare
    --declaração da variável (cursor)
    qtd_registros number(3);


begin
    --into joga a quantidade retornada dentro da variável
    --a variável está sendo o cursor que recebe o conjunto de dados que está vindo do select
    select count(*) into qtd_registros from employees;

    --printando:
    --dbms_output = pacote (bibliotea)
    --put_line = método do pacote
    dbms_output.put_line('Quantidade de registros: ' || qtd_registros);
    
end;
