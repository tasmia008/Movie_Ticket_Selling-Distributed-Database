create or replace procedure AllMovie(n in number)
	is 
x Movies.m_name%type;
CURSOR Hello IS select m_name from(select * from Movies where m_running=n UNION select * from Movies@site_link where m_running=n);
begin 
	OPEN Hello;
		LOOP
			FETCH Hello INTO x;
			EXIT WHEN Hello%notfound;
			DBMS_OUTPUT.PUT_LINE(x);
		END LOOP;
	CLOSE Hello;
	
end	AllMovie;
/

create or replace procedure TheatreCheck(n in number)
	is 
x Theatres.t_name%type;
CURSOR Hello1 IS 
	select t_name from Theatres@site_link;
begin 
	OPEN Hello1;
		LOOP
			FETCH Hello1 INTO x;
			EXIT WHEN Hello1%notfound;
			DBMS_OUTPUT.PUT_LINE(x);
		END LOOP;
	CLOSE Hello1;
	
end	TheatreCheck;
/


create or replace procedure MoviesInput(name in Movies.m_name%type) 
	is 
x Movies.m_id%type;
z Movies.m_running%type:=1;
begin 
	dbms_output.put_line(name);
	select max(m_id) into x from Movies;
	x:=x+1;
	
	Insert Into Movies Values(x,name,z);
	
end	MoviesInput; 
/

create or replace procedure UserInput(u_name in Customers.u_name%type,u_age in Customers.u_age%type,u_address in Customers.u_address%type,u_phone in Customers.u_phone%type,u_email in Customers.u_email%type,u_password in Customers.u_password%type) 
	is 
a Customers.u_id%type;

begin 
	dbms_output.put_line(u_name);
	select max(u_id) into a from Customers;
	a:=a+1;
	
	Insert Into Customers Values(a,u_name,u_age,u_address, u_phone, u_email,u_password);
	
end	UserInput; 
/



create or replace procedure ReviewShow(n in Movies.m_name%type)
	is 
x Reviews.re_description%type;
CURSOR Hello1 IS 
	select re_description from Reviews where m_id=(select m_id from Movies where m_name=n);
begin 
	OPEN Hello1;
		LOOP
			FETCH Hello1 INTO x;
			EXIT WHEN Hello1%notfound;
			DBMS_OUTPUT.PUT_LINE(x);
		END LOOP;
	CLOSE Hello1;
	
end	ReviewShow;
/

create or replace procedure ReviewInput(a in Reviews.re_description%type, b in Movies.m_name%type,c in Customers.u_name%type) 
	is 
x Reviews.re_id%type;
d Customers.u_id%type;
e Movies.m_id%type;

begin 
	select m_id into e from Movies where m_name=b;
	select u_id into d from Customers where u_name=c;
	select max(re_id) into x from Reviews;
	x:=x+1;
	
	Insert Into Reviews Values(x,a,d,e);
	
end	ReviewInput; 
/

create or replace procedure RatingInput(a in Ratings.ra_scale%type, b in Movies.m_name%type,c in Customers.u_name%type) 
	is 
x Ratings.ra_id%type;
d Customers.u_id%type;
e Movies.m_id%type;

begin 
	select m_id into e from Movies where m_name=b;
	select u_id into d from Customers where u_name=c;
	select max(re_id) into x from Reviews;
	x:=x+1;
	
	Insert Into Ratings Values(x,a,d,e);
	
end	RatingInput; 
/

create or replace procedure MovieUpdate(n in Movies.m_name%type)
	is 
	
begin 
	update Movies set m_running=0 where m_name=n;
end MovieUpdate;
/



