set serveroutput on
set verify off

declare
	user_name Customers.u_name%type;
	movie_name Movies.m_name%type;
	rating Ratings.ra_scale%type;
begin
	user_name:=&User_name;
	movie_name:=&Movie_name;
	rating:=&Rating;
	RatingInput(rating,movie_name,user_name);
	
end;
/