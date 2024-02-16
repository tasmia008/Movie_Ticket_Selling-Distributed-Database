set serveroutput on
set verify off

declare
	b Theatres.t_name%type:='Exposure';
	c ShowtimeDay1.st1_timestart%type:='01:40';
	d SeattypeDay1.stt1_name%type:='Premium';
	id number;
begin
	id:=AvailableSeatCount(b,c,d);
	dbms_output.put_line(id);
	
end;
/