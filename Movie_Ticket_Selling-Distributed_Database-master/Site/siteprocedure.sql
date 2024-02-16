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



create or replace procedure ReviewShow(n in Movies.m_name%type)
	is 
x Reviews.re_description%type;
CURSOR Hello1 IS 
	select re_description from Reviews@site_link where m_id=(select m_id from Movies@site_link where m_name=n);
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


create or replace procedure MovieUpdate(n in Movies.m_name%type)
	is 
	
begin 
	update Movies set m_running=0 where m_name=n;
end MovieUpdate;
/



