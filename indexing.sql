PRAGMA foreign_keys = ON;

-- Index on course name for faster searching and sorting
CREATE INDEX idx_course_name
ON Courses(course_name);

-- Composite index for student-course lookups
CREATE INDEX idx_student_course
ON Enrollments(student_id, course_id);
