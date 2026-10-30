CREATE DATABASE StudentManagement;
USE StudentManagement;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20)
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT CHECK (CreditHours > 0)
);

CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE,

    FOREIGN KEY (StudentID)
    REFERENCES Students(StudentID),

    FOREIGN KEY (CourseID)
    REFERENCES Courses(CourseID)
);


INSERT INTO Students
(FirstName, LastName, Email, Phone)
VALUES
('Ali','Ahmed','ali@gmail.com','03001234567'),
('Sara','Khan','sara@gmail.com','03007654321');

INSERT INTO Courses
(CourseName, CreditHours)
VALUES
('Database Systems',3),
('Web Development',4);

INSERT INTO Enrollments
(StudentID, CourseID, EnrollDate)
VALUES
(1,1,'2026-01-10'),
(2,2,'2026-01-11');

INSERT INTO Students
(FirstName, LastName, Email, Phone)
VALUES
('John','Smith','john@gmail.com','03123456789');

SELECT * FROM Students;

UPDATE Students
SET Phone='03211234567'
WHERE StudentID=1;

SELECT * FROM Students;

UPDATE Students
SET Phone='03211234567'
WHERE StudentID=1;

SELECT
s.StudentID,
s.FirstName,
s.LastName,
c.CourseName,
e.EnrollDate
FROM Students s
INNER JOIN Enrollments e
ON s.StudentID = e.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;

