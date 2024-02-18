CREATE DATABASE xyz;
USE xyz;

-- Drop the tables if they already exist
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Transcript;
DROP TABLE IF EXISTS Teaching;

-- Create the tables using the provided SQL script
CREATE TABLE Student (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Status VARCHAR(255)
);

CREATE TABLE Professor (
    Id INT PRIMARY KEY,
    Name VARCHAR(255),
    DeptId VARCHAR(255)
);

CREATE TABLE Course (
    DeptId VARCHAR(255),
    CrsCode VARCHAR(255) PRIMARY KEY,
    CrsName VARCHAR(255),
    Descr VARCHAR(255),
    UNIQUE (DeptId, CrsName)
);

CREATE TABLE Transcript (
    StudId INT,
    CrsCode VARCHAR(255),
    Semester VARCHAR(255),
    Grade VARCHAR(255),
    PRIMARY KEY (StudId, CrsCode, Semester),
    FOREIGN KEY (StudId) REFERENCES Student(Id),
    FOREIGN KEY (CrsCode) REFERENCES Course(CrsCode)
);

CREATE TABLE Teaching (
    ProfId INT,
    CrsCode VARCHAR(255),
    Semester VARCHAR(255),
    PRIMARY KEY (CrsCode, Semester),
    FOREIGN KEY (ProfId) REFERENCES Professor(Id),
    FOREIGN KEY (CrsCode) REFERENCES Course(CrsCode)
);

-- Add the missing foreign key constraint for Transcript table
ALTER TABLE Transcript
ADD FOREIGN KEY (CrsCode, Semester) REFERENCES Teaching(CrsCode, Semester);

DESC Student;
DESC Professor;
DESC Course;
DESC Transcript;
DESC Teaching;
