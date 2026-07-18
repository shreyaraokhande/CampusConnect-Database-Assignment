PRAGMA foreign_keys = ON;

-- ==========================================================
-- Query 1: Using IN
-- Find students belonging to CSE or AI departments.
-- ==========================================================
SELECT *
FROM Students
WHERE department IN ('CSE', 'AI');


-- ==========================================================
-- Query 2: Using BETWEEN
-- Display courses having credits between 3 and 4.
-- ==========================================================
SELECT *
FROM Courses
WHERE credits BETWEEN 3 AND 4;


-- ==========================================================
-- Query 3: Using IS NULL
-- Display enrollments where grade has not yet been assigned.
-- ==========================================================
SELECT *
FROM Enrollments
WHERE grade IS NULL;


-- ==========================================================
-- Query 4: GROUP BY with HAVING
-- Count students enrolled in each course where enrollment is
-- greater than or equal to 1.
-- ==========================================================
SELECT
    course_id,
    COUNT(*) AS total_students
FROM Enrollments
GROUP BY course_id
HAVING COUNT(*) >= 1;


-- ==========================================================
-- Query 5: INNER JOIN
-- Display student names with their enrolled course names.
-- ==========================================================
SELECT
    s.student_name,
    c.course_name
FROM Students s
INNER JOIN Enrollments e
ON s.student_id = e.student_id
INNER JOIN Courses c
ON e.course_id = c.course_id;


-- ==========================================================
-- Query 6: LEFT JOIN
-- Display all students along with their courses.
-- Students without enrollments will also appear.
-- ==========================================================
SELECT
    s.student_name,
    c.course_name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id;


-- ==========================================================
-- Query 7: Simulating FULL OUTER JOIN
-- SQLite does not support FULL OUTER JOIN.
-- UNION of LEFT JOINs is used instead.
-- ==========================================================
SELECT
    s.student_name,
    c.course_name
FROM Students s
LEFT JOIN Enrollments e
ON s.student_id = e.student_id
LEFT JOIN Courses c
ON e.course_id = c.course_id

UNION

SELECT
    s.student_name,
    c.course_name
FROM Courses c
LEFT JOIN Enrollments e
ON c.course_id = e.course_id
LEFT JOIN Students s
ON e.student_id = s.student_id;


-- ==========================================================
-- Query 8: Scalar Subquery
-- Find the student having the minimum Student ID.
-- ==========================================================
SELECT student_name
FROM Students
WHERE student_id =
(
    SELECT MIN(student_id)
    FROM Students
);


-- ==========================================================
-- Query 9: Correlated Subquery
-- Find students enrolled in at least one course.
-- ==========================================================
SELECT student_name
FROM Students s
WHERE EXISTS
(
    SELECT 1
    FROM Enrollments e
    WHERE e.student_id = s.student_id
);


-- ==========================================================
-- Query 10: EXISTS
-- Display courses having at least one enrolled student.
-- ==========================================================
SELECT course_name
FROM Courses c
WHERE EXISTS
(
    SELECT *
    FROM Enrollments e
    WHERE e.course_id = c.course_id
);


-- ==========================================================
-- Query 11: UNION
-- Combine student names and instructor names.
-- ==========================================================
SELECT student_name AS Name
FROM Students

UNION

SELECT instructor_name
FROM Instructors;


-- ==========================================================
-- Query 12: Window Function
-- Assign row numbers within each department.
-- ==========================================================
SELECT
    student_name,
    department,
    ROW_NUMBER()
    OVER
    (
        PARTITION BY department
        ORDER BY student_name
    ) AS Row_Number
FROM Students;
