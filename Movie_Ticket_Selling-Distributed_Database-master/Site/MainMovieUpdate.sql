set serveroutput on
set verify off

declare
	y Movies.m_name%type;
begin
	y:=&MovieName;
	MovieUpdate(y);
	
end;
/