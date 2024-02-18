CREATE DATABASE xyz;
USE xyz;
CREATE TABLE Course (
CrsCode varchar(7),
DeptId varchar(3),
CrsName varchar(30),
Descr varchar(100),
PRIMARY KEY (CrsCode),
UNIQUE (DeptId, CrsName)
);
desc Course;

INSERT INTO Course VALUES('CSCI001', 'CS', 'BIG DATA I', 'Introduction to Big Data');
INSERT INTO Course VALUES('CSCI002', 'CS', 'Programming Languages', 'Formal definition of programming languages');

SELECT * FROM Course;

CREATE TABLE Professor (
Id integer PRIMARY KEY,
Name varchar(25),
DeptId varchar(3)
);
desc Professor;

INSERT INTO Professor VALUES (1, 'Weitian Tong', 'CS');

SELECT * FROM Professor;

CREATE TABLE Teaching (
ProfId integer,
CrsCode varchar(7),
Semester varchar(6),
PRIMARY KEY (CrsCode, Semester),
FOREIGN KEY (CrsCode) REFERENCES Course (CrsCode),
FOREIGN KEY (ProfId) REFERENCES Professor (Id)
);
desc Teaching;

INSERT INTO Teaching VALUES(1, 'CSCI001', 'S2023');

SELECT * FROM Teaching;

/*New info*/
INSERT INTO Professor VALUES (2, 'Valentina Silveira', 'CS');
INSERT INTO Professor VALUES (3, 'Josefina Silveira', 'CS');

INSERT INTO Course VALUES('CSCI003', 'CS', 'Database Systems', 'Introduction to database systems');
INSERT INTO Course VALUES('CSCI004', 'CS', 'Algorithm', 'Algorithm Design and Analysis');

INSERT INTO Teaching VALUES(2, 'CSCI002', 'F2024');
INSERT INTO Teaching VALUES(3, 'CSCI003', 'F2024');

/*Violating primary key constrains*/
INSERT INTO Professor VALUES (1, 'Weitang Tong', 'CS');
INSERT INTO Course VALUES('CSCI001', 'CS', 'BIG DATA I', 'Introduction to Big Data');
INSERT INTO Teaching VALUES(1, 'CSCI001', 'S2023');

/*Violating foreign key contrain*/
INSERT INTO Teaching VALUES(1, 'NonExistingCourse', 'F2023');
INSERT INTO teaching VALUES(11, 'CS 112', 'S2023');


