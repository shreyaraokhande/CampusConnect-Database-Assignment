PRAGMA foreign_keys = ON;

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    department TEXT NOT NULL
);

CREATE TABLE Instructors (
    instructor_id INTEGER PRIMARY KEY,
    instructor_name TEXT NOT NULL,
    designation TEXT NOT NULL
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits INTEGER NOT NULL,
    available_seats INTEGER DEFAULT 30,
    instructor_id INTEGER NOT NULL,
    FOREIGN KEY (instructor_id)
        REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    grade TEXT,
    FOREIGN KEY(student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY(course_id)
        REFERENCES Courses(course_id)
);
