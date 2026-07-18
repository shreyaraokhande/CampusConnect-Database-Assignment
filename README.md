# CampusConnect-Database-Assignment
SQL Database Assignment

## Database Engine

**Engine Used:** SQLite 3.45

SQLite was chosen because it is lightweight, requires no server setup, and fully supports the SQL features needed for this assignment.

**Important:** SQLite does not enforce foreign key constraints by default.

Therefore, the following command is executed before running the scripts:

```sql
PRAGMA foreign_keys = ON;
```

---

# Schema Design

The database contains four tables:

- Students
- Courses
- Instructors
- Enrollments

Relationships:

- One instructor can teach multiple courses.
- One student can enroll in multiple courses.
- One course can have multiple students.

The **Enrollments** table represents the many-to-many relationship between Students and Courses.

Each table contains:

- A Primary Key
- Appropriate Foreign Keys
- NOT NULL constraints
- DEFAULT values where required

The schema satisfies Third Normal Form (3NF).

---

# Normalization Write-up

## Unnormalized Form (UNF)

Initially, all information could have been stored in a single table such as:

| StudentID | StudentName | Course1 | Course2 | Course3 | InstructorName |
|------------|-------------|----------|----------|----------|----------------|

This design creates repeating groups, duplicated data, and update anomalies.

---

## First Normal Form (1NF)

To satisfy 1NF:

- Removed repeating course columns.
- Stored only atomic values.
- Assigned a unique primary key to every table.

Each enrollment is stored as an individual record.

---

## Second Normal Form (2NF)

To satisfy 2NF:

Partial dependency was removed.

For example, CourseName depends only on CourseID, not on the Enrollment record.

Therefore, course information is stored separately in the Courses table.

---

## Third Normal Form (3NF)

To satisfy 3NF:

Transitive dependency was removed.

Instead of storing InstructorName directly inside the Courses table, an InstructorID foreign key is stored.

Instructor details remain in the Instructors table, reducing redundancy and improving consistency.

---

# Indexing Justification

### Index 1

**idx_course_name**

Used to improve queries that search or sort using the Course Name.

---

### Index 2

**idx_student_course**

Composite index on:

- student_id
- course_id

This speeds up JOIN operations and enrollment lookups where both columns are used together.

---

### Column Not Indexed

The **department** column was intentionally left without an index.

Reason:

- It contains very few distinct values (low cardinality).
- SQLite can scan this column efficiently.
- Creating an index would increase insert and update overhead without significant performance improvement.

---

# Transactions and Isolation

A transaction has been implemented to ensure that enrolling a student and reducing the available seats happen together.

If one operation fails, the entire transaction is rolled back.

### Concurrent Access Scenario

Suppose only one seat is available in a course.

Two students attempt to enroll at the same time.

Without proper isolation:

- Both transactions read the same available seat count.
- Both complete successfully.
- The course becomes overbooked.

This is known as a **Lost Update** problem.

Using the **Serializable** isolation level prevents this issue because transactions are executed as though they occur one after another, ensuring that only one student successfully acquires the final seat.

---

# Files Included

- README.md
- schema.sql
- insert_data.sql
- queries.sql
- indexing.sql
- transaction.sql
