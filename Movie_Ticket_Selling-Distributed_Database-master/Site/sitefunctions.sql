create or replace function AvailableSeatCount(y in Theatres.t_name%type, z in ShowtimeDay1.st1_timestart%type,a in SeattypeDay1.stt1_name%type) 
	return number
	is 
	
id number;

begin 
	select count(seat1_id) into id from SeatDay1 where seat1_occupied=0 and stt1_id = (
	select stt1_id from SeattypeDay1 where stt1_name=a and st1_id=(
	select st1_id from ShowtimeDay1 where st1_timestart=z and t_id=(
	select t_id from Theatres where t_name=y)));
	
	return id;
	
end; 
/


create or replace function RatingShow(n in Movies.m_name%type)
	return number
	is 
x float;
	
begin 
	select avg(ra_scale) into x from Ratings where m_id=(select m_id from Movies where m_name=n);
	return x;
end;
/

