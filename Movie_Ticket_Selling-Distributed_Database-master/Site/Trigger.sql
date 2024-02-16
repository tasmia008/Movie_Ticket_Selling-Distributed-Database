

create or replace trigger addMoviesTrigger
after insert on Movies
begin
	dbms_output.put_line('Movie added.');
end;
/

create or replace trigger updateMoviesTrigger
after update on Movies
begin
	dbms_output.put_line('Movie updated.');
end;
/

create or replace trigger updateSeatDay1Trigger
after update on SeatDay1
begin
	dbms_output.put_line('Seat Updated.');
end;
/

