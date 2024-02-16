Insert Into Customers Values(10008,'Jack Johnson',21,'Dhaka', '01723423423', 'jack@gmail.com','1234');
Insert Into Customers Values(10002,'Dolly Denver',22,'Dhaka', '01712345678', 'dolly@gmail.com','1234');
Insert Into Customers Values(10003,'Helmut Ziegler',21,'Comilla','01898765432', 'helmut@yahoo.com','1234');
Insert Into Customers Values(10004,'Robert Thompson',24,'Khulna','01808975643', 'robert@gmail.com','1234');
Insert Into Customers Values(10005,'Jeffrey Petersen',23,'Sylhet', '01773439315', 'petersen@yahoo.com','1234');
Insert Into Customers Values(10006,'Jack Pirate',22,'Chittagong','01712321124', 'pirate@gmail.com','1234');
Insert Into Customers Values(10007,'Barb Wire',21, 'Comilla','01709876789','barb@yahoo.com','1234');

Insert Into Movies Values(50001,'Poramon',1);
Insert Into Movies Values(50002,'Dohon',0);
Insert Into Movies Values(50003,'Jodi Ekdin',1);
Insert Into Movies Values(50004,'Avengers End Game',1);

Insert Into Ratings Values(40001,3,10004,50001);
Insert Into Ratings Values(40002,4,10006,50001);
Insert Into Ratings Values(40003,4,10004,50004);

Insert Into Reviews Values(40001,'It is a great movie',10004,50001);
Insert Into Reviews Values(40002,'It is a awesome movie',10006,50001);
Insert Into Reviews Values(40003,'Nice Movie',10004,50004);

Insert Into Orders Values(1000001,2,600,1,10004,50002);
Insert Into Orders Values(1000002,3,1050,1,10003,50002);
Insert Into Orders Values(1000003,2,500,0,10002,50003);


Insert Into Payments Values(1100001,'01773439315','765437842','01/jun/2019',1,600,1000001);
Insert Into Payments Values(1100002,'01773439415','765412842','01/jan/2019',2,1050,1000002);