set serveroutput on
set verify off

declare
	y Movies.m_name%type;
begin

	y:=&Movie_Name;
	MoviesInput(y);
	
end;
/