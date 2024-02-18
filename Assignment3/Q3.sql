CREATE DATABASE University;
USE University;

CREATE TABLE Student (
  sid INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  address VARCHAR(20) NOT NULL,
  major CHAR(2)
);

CREATE TABLE Professor (
  pid INT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  department VARCHAR(10) NOT NULL
);

CREATE TABLE Course (
  cid INT PRIMARY KEY,
  title VARCHAR(20) NOT NULL UNIQUE,
  credits INT NOT NULL,
  area VARCHAR(5) NOT NULL
);

CREATE TABLE Transcript (
  sid INT,
  cid INT,
  pid INT,
  semester VARCHAR(9),
  year YEAR,
  grade CHAR(1) NOT NULL,
  PRIMARY KEY (sid, cid, semester, year),
  FOREIGN KEY (sid) REFERENCES Student (sid),
  FOREIGN KEY (cid) REFERENCES Course (cid),
  FOREIGN KEY (pid) REFERENCES Professor (pid)
);


INSERT INTO Student (sid, name, address, major) VALUES (101, 'Nathan', 'Edinburg', 'CS');
INSERT INTO Student (sid, name, address, major) VALUES (105, 'Hussein', 'Edinburg', 'IT');
INSERT INTO Student (sid, name, address, major) VALUES (103, 'Jose', 'McAllen', 'CE');
INSERT INTO Student (sid, name, address, major) VALUES (102, 'Wendy', 'Mission', 'CS');
INSERT INTO Student (sid, name, address, major) VALUES (104, 'Maria', 'Pharr', 'CS');
INSERT INTO Student (sid, name, address, major) VALUES (106, 'Mike', 'Edinburg', 'CE');
INSERT INTO Student (sid, name, address, major) VALUES (107, 'Lily', 'McAllen', NULL);


INSERT INTO Professor (pid, name, department) VALUES (201, 'Artem', 'CS');
INSERT INTO Professor (pid, name, department) VALUES (203, 'John', 'CS');
INSERT INTO Professor (pid, name, department) VALUES (202, 'Virgil', 'MATH');
INSERT INTO Professor (pid, name, department) VALUES (204, 'Pearl', 'CS');
INSERT INTO Professor (pid, name, department) VALUES (205, 'Christine', 'CS');


INSERT INTO Course (cid, title, credits, area) VALUES (4333, 'Database', 3, 'DB');
INSERT INTO Course (cid, title, credits, area) VALUES (1201, 'Comp literacy', 2, 'INTRO');
INSERT INTO Course (cid, title, credits, area) VALUES (6333, 'Advanced Database', 3, 'DB');
INSERT INTO Course (cid, title, credits, area) VALUES (6315, 'Applied Database', 3, 'DB');
INSERT INTO Course (cid, title, credits, area) VALUES (3326, 'Java', 3, 'PL');
INSERT INTO Course (cid, title, credits, area) VALUES (1370, 'CS I', 4, 'INTRO');


INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (101, 4333, 201, 'Spring', '2009', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (101, 6333, 201, 'Fall', '2009', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (101, 6315, 201, 'Fall', '2009', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (103, 4333, 203, 'Summer I', '2010', 'B');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (102, 4333, 201, 'Fall', '2009', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (103, 3326, 204, 'Spring', '2008', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (104, 1201, 205, 'Fall', '2009', 'B');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (104, 1370, 203, 'Summer II', '2010', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (106, 1201, 205, 'Fall', '2009', 'C');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (106, 1370, 203, 'Summer II', '2010', 'C');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (105, 3326, 204, 'Spring', '2001', 'A');
INSERT INTO Transcript (sid, cid, pid, semester, year, grade) VALUES (105, 6315, 203, 'Fall', '2008', 'A');

-- Find all CS students who live in Edinburg
SELECT * FROM Student WHERE major = 'CS' AND address = 'Edinburg';

-- Find all possible pairs (combinations) of students and professors
SELECT s.NAME AS studname, p.NAME AS profname FROM Student s, Professor p; 

-- Find all possible pairs (combinations) of CS and CE students
SELECT stud1.NAME AS CSStud, stud2.NAME AS CEStud FROM Student stud1, Student stud2 Where stud1.major = 'CS' and stud2.major = 'CE';

-- Find identifiers of all courses taken by the student named Nathan
SELECT t.cid FROM Transcript t, Student s WHERE t.sid=s.sid AND s.NAME = 'Nathan';

-- Find titles of all courses taken by the student named Nathan
SELECT c.title FROM Student s, Transcript t, Course c WHERE t.sid=s.sid AND t.cid=c.cid AND s.NAME = 'Nathan';

-- Find course titles and professor names for courses taken by the student named Nathan
SELECT c.title AS CorsesTaken, p.NAME AS ProfName FROM Transcript t, Professor p, Student s, Course c WHERE t.sid=s.sid AND t.cid=c.cid AND t.pid=p.pid AND s.NAME = 'Nathan';

-- Find names of students who took a course taught by Artem
SELECT s.NAME FROM Student s, Professor p, Transcript t WHERE t.sid =s.sid AND t.pid =p.pid AND p.NAME = 'Artem';

-- Find names of professors who taught a course
SELECT DISTINCT p.NAME FROM Professor p, Transcript t WHERE p.pid=t.pid;

-- Find ALL CS and all IT students
SELECT * FROM Student WHERE major IN ('CS','IT');

-- Find the total number of credits completed by student with id 101.
SELECT sum(credits) AS TotalCredits FROM Course c, Transcript t  WHERE t.cid =c.cid AND t.sid=101;

SELECT * FROM  Student;
SELECT * FROM  Professor;
SELECT * FROM  Course;
SELECT * FROM Transcript;