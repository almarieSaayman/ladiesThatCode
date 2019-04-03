CREATE DATABASE School;

SHOW DATABASES;

DROP DATABASE School;

USE School;

SHOW TABLES;

CREATE TABLE Teacher(
	TeacherID int,
	Name varchar(255),
    NumberOfStudents int,
    DateOfEmployment date
);
SELECT * FROM Teacher;

CREATE TABLE Student(
	StudentID int NOT NULL AUTO_INCREMENT,
    Name varchar(225),   
    IDNumber varchar(13),
    Age int DEFAULT 16,
    PRIMARY KEY (StudentID),
    UNIQUE (IDNumber)
);
INSERT INTO Student (Name, IDNumber, Age) VALUES ("mimi", "9403211299181", "24"); 
INSERT INTO Student (Name, IDNumber, Age) VALUES ("almarie", "9503211299181", "27"); 

SELECT * FROM Student;

CREATE TABLE Exam(
	ExamID int NOT NULL AUTO_INCREMENT,
    Marks int,
    StudentID int NOT NULL,
    PRIMARY KEY (ExamID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

# adding data to exam table
INSERT INTO Exam (Marks, StudentID) VALUES ("45", "1"); 
INSERT INTO Exam (Marks, StudentID) VALUES ("82", "3");
SELECT * FROM Exam;

