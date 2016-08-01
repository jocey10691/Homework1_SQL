#Homework #3 

#There are six users, and four groups. 
#Modesto and Ayine are in group “I.T.” 
#Christopher and Cheong woo are in group “Sales”. 
#There are four rooms: “101”, “102”, “Auditorium A”, and “Auditorium B”. 
#Saulat is in group “Administration.” 
#Group “Operations” currently doesn’t have any users assigned. 
#I.T. should be able to access Rooms 101 and 102. 
#Sales should be able to access Rooms 102 and Auditorium A. 
#Administration does not have access to any rooms. 
#Heidy is a new employee, who has not yet been assigned to any group

#Groups: I.T, Sales, Operations, Administration
#Users: Modesto, Ayine, Christopher, Cheong Woo, Saulat, Heidy 
#Rooms: 101, 102, Auditorium A, Auditorium B
#GroupID, UserID, RoomID should be three separate tables 



DROP TABLE IF EXISTS Users;
create table Users
( User_Num int Primary key,
	User_Name varchar(100), 
    Group_Num int
    ); 
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 0, 'NULL', 0);
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 1, 'Modesto', 1);
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 2, 'Ayine', 1);
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 3, 'Christopher', 2);
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 4, 'Cheong Woo', 2);
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 5, 'Saulat', 4);
INSERT INTO Users( User_Num, User_Name, Group_Num) VALUES ( 6, 'Heidy', NULL);

DROP TABLE IF EXISTS Groups;
create table Groups
( Group_Num int,
	Group_Name varchar(100), 
    User_Num int
    ); 
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 0, 'NULL', 0);
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 1, 'I.T.', 1);
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 1, 'I.T.', 2);
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 2, 'Sales', 3);
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 2, 'Sales', 4);
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 3, 'Operations', 0);
INSERT INTO Groups( Group_Num, Group_Name, User_Num) VALUES ( 4, 'Administration',5);

DROP TABLE IF EXISTS Rooms;
create table Rooms
( Room_Num int,
	Room_Desc varchar(100), 
    Group_Num int
    ); 
    

INSERT INTO Rooms( Room_Num, Room_Desc, Group_Num) VALUES ( 1, '101',1);
INSERT INTO Rooms( Room_Num, Room_Desc, Group_Num) VALUES ( 2, '102',1);
INSERT INTO Rooms( Room_Num, Room_Desc, Group_Num) VALUES ( 2, '102',2);
INSERT INTO Rooms( Room_Num, Room_Desc, Group_Num) VALUES ( 3, 'Auditorium A',2);
INSERT INTO Rooms( Room_Num, Room_Desc, Group_Num) VALUES ( 4, 'Auditorium B', 0);


#Show all the Groups and Users
select u.*, g.Group_Name
from Users u 
left join Groups g on u.User_Num=g.User_Num

#Show all the Groups and the Rooms 

drop table if exists Temp;
create table temp as 
Select r.Room_Num, r.Room_Desc,g.Group_Num, g.Group_Name, g.User_Num
from Rooms r
right join Groups g on r.Group_Num=g.Group_Num
order by r.Room_Num 

#Show all the Users, the Groups, and the Rooms 
select u.User_Num, u.User_Name, t.Group_Num, t.Group_Name, t.Room_Num, t.Room_Desc
from temp t 
right join Users u on t.User_Num=u.User_Num
order by u.User_Name, t.Group_Name, t.Room_Desc