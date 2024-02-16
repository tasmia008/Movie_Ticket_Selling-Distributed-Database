set serveroutput on
set verify off

declare
	j Customers.u_name%type:='Karim';
	k Customers.u_age%type:=20;
	l Customers.u_address%type:='Dhaka';
	m Customers.u_phone%type:='9669898987987';
	n Customers.u_email%type:='karim@gmail.com';
	o Customers.u_password%type:='1234';
begin
	UserInput(j,k,l,m,n,o);
	
end;
/