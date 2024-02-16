drop table Moviess cascade constraints;
drop table Theatres cascade constraints;
drop table ShowtimeDay1 cascade constraints;
drop table SeattypeDay1 cascade constraints;
drop table SeatDay1 cascade constraints;



CREATE TABLE Movies (
    m_id number(20),
    m_name varchar(100)  NOT NULL,
	m_running int Not NULL, 
	primary key(m_id)
);

CREATE TABLE Theatres (
    t_id number(20),
    t_name varchar(100)  NOT NULL, 
	primary key(t_id)
);

CREATE TABLE ShowtimeDay1 (
    st1_id number(20),
    st1_timestart varchar(10)  NOT NULL,
	t_id  int  NOT NULL REFERENCES Theatres(t_id),
	primary key(st1_id),
	m_id int REFERENCES Movies(m_id)
);
CREATE TABLE SeattypeDay1 (
    stt1_id number(20),
    stt1_name varchar(50)  NOT NULL,
	primary key(stt1_id),
	st1_id  int  NOT NULL REFERENCES ShowtimeDay1(st1_id)
);
CREATE TABLE SeatDay1 (
    seat1_id number(20),
    seat1_number INTEGER,
	seat1_occupied INTEGER,
	seat_fare INTEGER,
	stt1_id int  NOT NULL REFERENCES SeattypeDay1(stt1_id)
);
CREATE TABLE Reviews (
    re_id number(20),
    re_description varchar(200)  NOT NULL,
	primary key(re_id),
	u_id  int  NOT NULL REFERENCES Customers(u_id), 
	m_id  int  NOT NULL REFERENCES Movies(m_id)
);
CREATE TABLE Ratings (
    ra_id number(20),
    ra_scale int  NOT NULL,
	primary key(ra_id),
	u_id  int  NOT NULL REFERENCES Customers(u_id), 
	m_id  int  NOT NULL REFERENCES Movies(m_id)
);


