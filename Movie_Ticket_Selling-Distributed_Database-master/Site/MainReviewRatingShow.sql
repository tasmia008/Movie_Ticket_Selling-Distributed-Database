set serveroutput on
set verify off

declare
	y Movies.m_name%type;
begin
	y:=&MovieName;
	ReviewShow(y);
	dbms_output.put_line(RatingShow(y));
	
end;
/