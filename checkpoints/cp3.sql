set serveroutput on;
declare
    cursor c_pacientes is
        select p.id_paciente, p.diagnostico_inicial, d.diagnostico_final
        from pacientes p
        join diagnosticos d on p.id_paciente = d.id_paciente;
    
    v_total_pacientes number := 0;
    v_erros_diagnosticos number := 0;
    v_porcentagem_erro number := 0;
    
    v_id_paciente pacientes.id_paciente%type;
    v_diagnostico_inicial pacientes.diagnostico_inicial%type;
    v_diagnostico_final diagnosticos.diagnostico_final%type;
    
    no_data_found_exc exception;
    
begin
    v_total_pacientes := 0;
    v_erros_diagnosticos := 0;
    
    for paciente in c_pacientes loop  -- contador de pacientes
        v_total_pacientes := v_total_pacientes + 1;
        
        -- verificando se os diagnosticos são diferentes
        if paciente.diagnostico_inicial != paciente.diagnostico_final then 
            v_erros_diagnosticos := v_erros_diagnosticos + 1;
            
            dbms_output.put_line('Erro no diagnóstico do paciente ' || paciente.id_paciente || ': ' || paciente.diagnostico_inicial || ' != ' || paciente.diagnostico_final);
        end if;
    end loop;

    -- calculando a porcentagem de erros
    if v_total_pacientes > 0 then
        v_porcentagem_erro := (v_erros_diagnosticos / v_total_pacientes) * 100;
        dbms_output.put_line('Porcentagem de erros de diagnóstico: ' || v_porcentagem_erro || '%');
    else
        dbms_output.put_line('Nenhum paciente encontrado.');
    end if;

exception
    when no_data_found then
        dbms_output.put_line('Nenhum dado encontrado para os pacientes ou diagnósticos.');
    when others then
        dbms_output.put_line('Erro inesperado: ' || sqlerrm);
end;
