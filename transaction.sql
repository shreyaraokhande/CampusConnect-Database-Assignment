PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Reduce available seats by 1
UPDATE Courses
SET available_seats = available_seats - 1
WHERE course_id = 101
AND available_seats > 0;

-- Enroll a student into the course
INSERT INTO Enrollments (student_id, course_id)
VALUES (2, 101);

COMMIT;

/*
If any statement fails, use:

ROLLBACK;

This ensures both operations either complete together
or are completely undone.
*/
