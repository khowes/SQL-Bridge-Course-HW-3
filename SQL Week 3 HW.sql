/*
Project: Building a Relational Database Management System
Author:	Ken Howes
SQL Bridge Course Week 3 Assignment
*/

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS rooms;

CREATE TABLE users 
(
	user_id		int PRIMARY KEY,
	user_name	varchar(15) NOT NULL ,
    group_id	int NULL REFERENCES groups
);

INSERT INTO users ( user_id, user_name, group_id ) VALUES ( 1, 'Modesto', 1);
INSERT INTO users ( user_id, user_name, group_id ) VALUES ( 2, 'Ayine', 1);
INSERT INTO users ( user_id, user_name, group_id ) VALUES ( 3, 'Christopher', 2);
INSERT INTO users ( user_id, user_name, group_id ) VALUES ( 4, 'Cheong woo', 2);
INSERT INTO users ( user_id, user_name, group_id ) VALUES ( 5, 'Saulat', 3);
INSERT INTO users ( user_id, user_name, group_id ) VALUES ( 6, 'Heidy', NULL);

SELECT * from users;

CREATE TABLE groups 
(
	group_id	int PRIMARY KEY,
	group_name	varchar(15) NOT NULL 
);

INSERT INTO groups ( group_id, group_name ) VALUES ( 1, 'IT');
INSERT INTO groups ( group_id, group_name ) VALUES ( 2, 'Sales');
INSERT INTO groups ( group_id, group_name ) VALUES ( 3, 'Admin');
INSERT INTO groups ( group_id, group_name ) VALUES ( 4, 'Operations');

SELECT * from groups;

CREATE TABLE rooms 
(
	room_id		int PRIMARY KEY,
	room_name	varchar(5) NOT NULL,
    group_id	int REFERENCES groups
);

INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 1, '101', 1);
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 2, '102', 1);
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 3, '102', 2);
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 4, 'Aud A', 2);
INSERT INTO rooms ( room_id, room_name, group_id ) VALUES ( 5, 'Aud B', NULL);

SELECT * from rooms;

-- Select all groups and the users in each group.  
-- A group should appear even if there are no isers in that group.

SELECT g.group_name, u.user_name from groups g
LEFT JOIN users u
on g.group_id = u.group_id;
 
-- Select all rooms and the groups assigned ot those rooms.
-- The room should appear even if no groups have been assigned to them

SELECT r.room_name, g.group_name from rooms r
LEFT JOIN groups g
on r.group_id = g.group_id;

-- Select all users, the groups they belong to and the rooms to which they are assigned
-- They should be sorted alphabetically by user, then group, then by room

SELECT u.user_name, g.group_name, r.room_name FROM users u
LEFT JOIN groups g
on u.group_id = g.group_id
LEFT JOIN rooms r 
on u.group_id = r.group_id
ORDER BY u.user_name, g.group_name, r.room_name 
