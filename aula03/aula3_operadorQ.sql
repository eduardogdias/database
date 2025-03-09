set serveroutput on;

declare
    v_aspas varchar(20) := q'[Mother's days]';
    
begin
    dbms_output.put_line(v_aspas);
    
end;
    