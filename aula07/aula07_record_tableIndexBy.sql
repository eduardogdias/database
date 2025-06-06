-- armazene o primeiro e ultimo nome em duas variaveis escalares do funcionario de id 100
-----------------------------
-- Trabalhando com uma RECORD
-----------------------------
set serveroutput on;

declare
    --v_firstName employees.first_name%type;
    --v_lastName employees.last_name%type;
    
    type t_emp is record(
        v_firstName employees.first_name%type,
        v_lastName employees.last_name%type
    );
    
    v_emp t_emp;

begin 
    select first_name,last_name 
    into v_emp.v_firstName, v_emp.v_lastName 
    from employees 
    where employee_id = 100;
    dbms_output.put_line(v_emp.v_firstName || ' - ' || v_emp.v_lastName);

end;

------------------------------



--****************************************************
-- ATUALIZANDO DADOS USANDO UMA RECORD (%rowtype)
--****************************************************
DECLARE
	
	-- variável para receber o funcionario
	v_funcionario employees%ROWTYPE;

BEGIN
	
	-- OBTEM OS DADOS DE UM COLABORADOR E ARMAZENA EM UMA RECORD
	SELECT 	*
	INTO	v_funcionario
	FROM 	EMPLOYEES
	WHERE	EMPLOYEE_ID = 198;
	
	--ATUALIZA UM VALOR DA RECORD
	v_funcionario.commission_pct := 0.1;

	-- ATUALIZA A LINHA INTEIRA
	UPDATE EMPLOYEES
	SET ROW = v_funcionario
	WHERE	EMPLOYEE_ID = 198;
	
	COMMIT;
	
END;


select * from employees


------------------------------------




--******************************************
-- OUTRO EXEMPLO DE TABELA INDEX-BY
--******************************************

DECLARE

  -- Define uma tabela indexada de strings
  TYPE employee_table IS TABLE OF 
  VARCHAR2(100) 
  INDEX BY PLS_INTEGER;
  employees employee_table; -- Instância da tabela

BEGIN
  -- Insere valores na tabela
  employees(1) := 'Ana Silva';
  employees(2) := 'Carlos Santos';
  employees(3) := 'Beatriz Costa';

  -- Acessa e exibe os valores da tabela
  FOR i IN employees.FIRST .. employees.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Índice: ' || i || ', Valor: ' || employees(i));
  END LOOP;

END;



--******************************************
-- OUTRO EXEMPLO DE TABELA INDEX-BY
--******************************************

DECLARE
	-- Define uma tabela indexada que armazena registros do tipo da tabela EMPLOYEES
	TYPE employees_table IS TABLE OF employees%ROWTYPE INDEX BY PLS_INTEGER;
	employees_data employees_table; -- Instância da tabela
	i PLS_INTEGER;

BEGIN
	-- Insere registros na tabela indexada
	FOR emp IN (SELECT * FROM employees) LOOP			
		employees_data(emp.employee_id) := emp; -- Usa o employee_id como índice
	END LOOP;

	-- Acessa e exibe os dados da tabela indexada
	i := employees_data.FIRST; -- Obtem o primeiro índice válido

	WHILE i IS NOT NULL LOOP
		DBMS_OUTPUT.PUT_LINE('ID: ' || employees_data(i).employee_id || 
							', Nome: ' || employees_data(i).first_name || 
							', Sobrenome: ' || employees_data(i).last_name);
		
		i := employees_data.NEXT(i); -- Passa para o próximo índice
	
	END LOOP;

END;


select rowid, employee_id
from employees;

