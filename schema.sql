-- Create Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(50),
    age INT
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Create Marks Table
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert Students
INSERT INTO Students VALUES
(1, 'Rahul', 'CSE', 20),
(2, 'Ankit', 'AIML', 21),
(3, 'Priya', 'ECE', 19);

-- Insert Courses
INSERT INTO Courses VALUES
(101, 'DBMS'),
(102, 'Python'),
(103, 'Computer Networks');

-- Insert Marks
INSERT INTO Marks VALUES
(1, 1, 101, 85),
(2, 2, 102, 90),
(3, 3, 103, 88);

-- View data
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Marks;

-- JOIN query
SELECT 
    Students.student_name,
    Courses.course_name,
    Marks.marks
FROM Marks
JOIN Students ON Marks.student_id = Students.student_id
JOIN Courses ON Marks.course_id = Courses.course_id;

-- UPDATE example
UPDATE Students
SET age = 22
WHERE student_id = 2;

-- DELETE (IMPORTANT FIXED ORDER)
-- Step 1: delete child table first
DELETE FROM Marks WHERE student_id = 3;

-- Step 2: delete parent table
DELETE FROM Students WHERE student_id = 3;