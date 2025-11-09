Create Database UniDB;
use uniDB;
Create table Department (
DeptID INT Primary Key,
DeptName varchar(15));
Create table Student (
USN varchar(20) Primary key,
SName varchar(50) not null,
DeptID INT,
DOB date,
foreign key (DeptID) references Department(DeptID));
show databases;
Desc Department;
Desc student;
create table coursereg(
USN varchar(20),
courseid varchar(10),
primary key (USN, courseid));
Alter table coursereg
add column semester INT;

alter table coursereg
add constraint foreign key(USN) references Student(USN);

alter table coursereg
add constraint foreign key(courseid) references Course(courseid);
Create table marks(
USN varchar(20),
CourseID varchar(10),
score INT,    
foreign key (USN) references Student(USN),
foreign key (courseid) references course(courseid));
create table Course (
CourseID  varchar(10) Primary Key,
CourseName varchar(20) not null,
Credits int,
DeptID int,
foreign key (DeptID) references Department(DeptID));
INSERT INTO Department VALUES
(1,'Phy'),
(2,'CS');
INSERT INTO Student VALUES
('24BSC101','Ravi Kumar',1,'2002-05-12'),
('24BSC102','Anitha Sharma',1,'2003-11-23');
INSERT INTO Course VALUES
('CS201','Quantum Mechanics',4,1),
('CS202','Database systems',3,2);
INSERT INTO courseReg VALUES
('24BSC101','CS201',1),
('24BSC102','CS202',1);
desc courseReg;
INSERT INTO marks VALUES
('24BSC101','CS201',87),
('24BSC131','CS201',87);
select * from student;
select * from course;
select * from coursereg;
select * from department;
select * from marks;








                                                                                                       