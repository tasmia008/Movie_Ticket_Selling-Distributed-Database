set serveroutput on
set verify off

declare
	id number;
	b Theatres.t_name%type:='Exposure';
	c ShowtimeDay1.st1_timestart%type:='01:40';
	d SeattypeDay1.stt1_name%type:='Premium';
	e SeatDay1.seat1_number%type:=34;
begin
	id:=SeatCount(b,c,d,e);
	dbms_output.put_line(id);
	
end;
/