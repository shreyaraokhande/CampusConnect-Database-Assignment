PRAGMA foreign_keys = ON;

/*
This statement demonstrates a foreign key violation.
Do NOT execute it because it will generate an error.

INSERT INTO Courses VALUES (99,'Cloud Computing',4,20,999);
*/

/* -----------------------
   Insert Instructors
----------------------- */

INSERT INTO Instructors VALUES (1,'Dr. Mehta','Professor');
INSERT INTO Instructors VALUES (2,'Dr. Sharma','Associate Professor');
INSERT INTO Instructors VALUES (3,'Dr. Rao','Assistant Professor');
INSERT INTO Instructors VALUES (4,'Dr. Joshi','Professor');
INSERT INTO Instructors VALUES (5,'Dr. Kulkarni','Professor');
INSERT INTO Instructors VALUES (6,'Dr. Patil','Associate Professor');
INSERT INTO Instructors VALUES (7,'Dr. Singh','Assistant Professor');
INSERT INTO Instructors VALUES (8,'Dr. Khan','Professor');
INSERT INTO Instructors VALUES (9,'Dr. Iyer','Professor');
INSERT INTO Instructors VALUES (10,'Dr. Das','Assistant Professor');

/* -----------------------
   Insert Students
----------------------- */

INSERT INTO Students VALUES (1,'Rahul','rahul@gmail.com','CSE');
INSERT INTO Students VALUES (2,'Sneha','sneha@gmail.com','IT');
INSERT INTO Students VALUES (3,'Amit','amit@gmail.com','AI');
INSERT INTO Students VALUES (4,'Pooja','pooja@gmail.com','CSE');
INSERT INTO Students VALUES (5,'Rohan','rohan@gmail.com','IT');
INSERT INTO Students VALUES (6,'Neha','neha@gmail.com','AI');
INSERT INTO Students VALUES (7,'Priya','priya@gmail.com','CSE');
INSERT INTO Students VALUES (8,'Arjun','arjun@gmail.com','IT');
INSERT INTO Students VALUES (9,'Meera','meera@gmail.com','AI');
INSERT INTO Students VALUES (10,'Karan','karan@gmail.com','CSE');

/* -----------------------
   Insert Courses
----------------------- */

INSERT INTO Courses VALUES (101,'Database Systems',4,25,1);
INSERT INTO Courses VALUES (102,'Operating Systems',4,20,2);
INSERT INTO Courses VALUES (103,'Python Programming',3,30,3);
INSERT INTO Courses VALUES (104,'Java Programming',3,18,4);
INSERT INTO Courses VALUES (105,'Machine Learning',4,15,5);
INSERT INTO Courses VALUES (106,'Data Structures',4,20,6);
INSERT INTO Courses VALUES (107,'Computer Networks',3,16,7);
INSERT INTO Courses VALUES (108,'Cloud Computing',4,12,8);
INSERT INTO Courses VALUES (109,'Cyber Security',3,25,9);
INSERT INTO Courses VALUES (110,'Artificial Intelligence',4,22,10);

/*
This statement demonstrates a foreign key violation.
Do NOT execute it because StudentID 999 does not exist.

INSERT INTO Enrollments VALUES
(100,999,101,'2025-01-01','A');
*/

/* -----------------------
   Insert Enrollments
----------------------- */

INSERT INTO Enrollments VALUES (1,1,101,'2025-01-10','A');
INSERT INTO Enrollments VALUES (2,2,101,'2025-01-10','B');
INSERT INTO Enrollments VALUES (3,3,102,'2025-01-11','A');
INSERT INTO Enrollments VALUES (4,4,103,'2025-01-12',NULL);
INSERT INTO Enrollments VALUES (5,5,104,'2025-01-13','B');
INSERT INTO Enrollments VALUES (6,6,105,'2025-01-13','A');
INSERT INTO Enrollments VALUES (7,7,106,'2025-01-14',NULL);
INSERT INTO Enrollments VALUES (8,8,107,'2025-01-15','A');
INSERT INTO Enrollments VALUES (9,9,108,'2025-01-15','B');
INSERT INTO Enrollments VALUES (10,10,109,'2025-01-16','A');
