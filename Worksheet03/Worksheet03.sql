SET SQL_SAFE_UPDATES = 0;   # I got an error while applying Update function in MySQL Workbench. That's why i added this line.

create database University;         # Firstly, i created the database called University.
use University;                     # Operations will be on University Database. That's why i select it.

# Our first table in this databe.
# It represents the instructors who give lesson
# It has 3 attributes.
create table Instructors(
ins_id int NOT NULL AUTO_INCREMENT, # It represents instructor's id which is unique.It will be increased automatically.
name varchar(10),                   # It represents instructor's name Whose length can be max 10.
surname varchar(20),                # It represents instructor's surname Whose length can be max 20.
Primary Key(ins_id)                 # Instuctor's id is primary key. Because it must be unique.
);

# Our second table in this databe.
# It represents the lectures which are given by Instructors
# It has 5 attributes.
create table Lectures(
lec_id int NOT NULL AUTO_INCREMENT, # It represents the lecture's id which is unique. It will be increased automatically 
name varchar(30),                   # It represents the lecture's name Whose length can be max 30.
dept varchar(50),                   # It represents that under what department that lecture is given. Length can be max 50.
code int,                           # Lecture's code
ins_id int,                         # It represents that which instructor gives that lecture. It is also foreign key.
Primary Key(lec_id),                # Lecture's id is primary key. Because it must be unique.
Foreign Key(ins_id) References Instructors(ins_id)   # ins_id refers to ins_id in table of Instructors.
);


# Our third table in this databe.
# It represents the classes where lectures are handled.
# It has 4 attributes.
create table Classes(
class_id int NOT NULL AUTO_INCREMENT, # It represents the class's id which is unique. It will be increased automatically
day varchar(10),                      # It represents that on what day lecture is handled in that class.
hour time,                            # It represents the lecture's hour in that class.
lec_id int,                           # It represents the lecture that has been given in that day and time. It is also foreign key.
Primary Key(class_id),                # Class's id is primary key. Because it must be unique.
Foreign Key(lec_id) References Lectures(lec_id)  # lec_id refers to lec_id in table of Lectures.
);

# Observe the attributes in tables by DESCRIBE [table name].

describe Instructors;
describe Lectures;
describe Classes;

# Populate all tables with at least 3 record.

# Instructors
INSERT INTO Instructors(name,surname) VALUES("Tuğba","Dalyan");
INSERT INTO Instructors(name,surname) VALUES("Hakan","Ayral");
INSERT INTO Instructors(name,surname) VALUES("Murat","Orhun");

# Lectures
INSERT INTO Lectures(name,dept,code,ins_id) VALUES("Introduction to Computing","Computer Engineering",204,1);
INSERT INTO Lectures(name,dept,code,ins_id) VALUES("Data Structures and Algorithms","Computer Engineering",201,2);
INSERT INTO Lectures(name,dept,code,ins_id) VALUES("Large Scale Programming","Computer Engineering",301,3);

# Classes
INSERT INTO Classes(day,hour,lec_id) VALUES("Wednesday",'09:00:00',1);
INSERT INTO Classes(day,hour,lec_id) VALUES("Thursday",'12:00:00',3);
INSERT INTO Classes(day,hour,lec_id) VALUES("Tuesday",'09:00:00',2);

# Update instructor of a lecture
# I have chosen lecture of Large Scale Programming. It was given by Murat Orhun. Now, It will be given by Tuğba Dalyan.
Update Lectures Set ins_id = 1 where ins_id = 3;