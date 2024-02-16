drop table Customers  cascade constraints;
drop table Orders  cascade constraints;
drop table Payments  cascade constraints;
drop table Reviews  cascade constraints;
drop table Ratings  cascade constraints;
drop table Movies  cascade constraints;

CREATE TABLE Movies (
    m_id number(20),
    m_name varchar(100)  NOT NULL,
	m_running int Not NULL, 
	primary key(m_id)
);

CREATE TABLE Customers (
    u_id number(20),
    u_name varchar(100)  NOT NULL,
	u_age int  NOT NULL,
	u_address varchar(500)  NOT NULL,
	u_phone varchar(20)  NOT NULL,
	u_email varchar(100)  NOT NULL,
	u_password varchar(100)  NOT NULL,
	primary key(u_id)
);

CREATE TABLE Orders (
    o_id number(20),
    total_seat int  NOT NULL,
	total_amount int NOT NULL,
	o_confirmation int Default 0,
	primary key(o_id),
	u_id  int  NOT NULL REFERENCES Customers(u_id),
	m_id  int  NOT NULL REFERENCES Movies(m_id)
);
CREATE TABLE Payments (
    p_id number(20),
    p_phone varchar(20) Not NULL,
	p_transactionNumber varchar(50) Not Null,
	p_datetime Date,
	p_type int NOT NULL,
	p_amount int NOT NULL,
	o_id  int  NOT NULL REFERENCES Orders(o_id)
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