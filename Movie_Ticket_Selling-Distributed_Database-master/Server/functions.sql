create or replace function Make_Orders(y in Theatres.t_name%type, z in ShowtimeDay1.st1_timestart%type,a in SeattypeDay1.stt1_name%type,b in SeatDay1.seat1_number%type ) 
	return SeatDay1.seat_fare%type
	is 
	
money SeatDay1.seat_fare%type;

begin 
	select seat_fare into money from SeatDay1@site_link2 where seat1_number=b and seat1_occupied=0 and stt1_id = (
	select stt1_id from SeattypeDay1@site_link2 where stt1_name=a and st1_id=(
	select st1_id from ShowtimeDay1@site_link2 where st1_timestart=z and t_id=(
	select t_id from Theatres@site_link2 where t_name=y)));
	
	Update SeatDay1@site_link2 set seat1_occupied=1 where seat1_number=b;
	
	return money;
exception 
   WHEN no_data_found THEN
      dbms_output.put_line('Seat already booked'); 
      
end; 
/


create or replace function SeatCount(y in Theatres.t_name%type, z in ShowtimeDay1.st1_timestart%type,a in SeattypeDay1.stt1_name%type,b in SeatDay1.seat1_number%type ) 
	return number
	is 
	
id number;

begin 
	select count(seat1_id) into id from SeatDay1@site_link2 where stt1_id = (
	select stt1_id from SeattypeDay1@site_link2 where stt1_name=a and st1_id=(
	select st1_id from ShowtimeDay1@site_link2 where st1_timestart=z and t_id=(
	select t_id from Theatres@site_link2 where t_name=y)));
	
	return id;
	
end; 
/


create or replace function AvailableSeatCount(y in Theatres.t_name%type, z in ShowtimeDay1.st1_timestart%type,a in SeattypeDay1.stt1_name%type) 
	return number
	is 
	
id number;

begin 
	select count(seat1_id) into id from SeatDay1@site_link2 where seat1_occupied=0 and stt1_id = (
	select stt1_id from SeattypeDay1@site_link2 where stt1_name=a and st1_id=(
	select st1_id from ShowtimeDay1@site_link2 where st1_timestart=z and t_id=(
	select t_id from Theatres@site_link2 where t_name=y)));
	
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

