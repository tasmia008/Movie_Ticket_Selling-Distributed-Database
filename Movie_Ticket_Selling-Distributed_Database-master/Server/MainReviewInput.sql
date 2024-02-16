set serveroutput on
set verify off

declare
	user_name Customers.u_name%type;
	movie_name Movies.m_name%type;
	review Reviews.re_description%type;
begin
	user_name:=&User_name;
	movie_name:=&Movie_name;
	review:=&Review;
	Reviewinput(review,movie_name,user_name);
	
end;
/