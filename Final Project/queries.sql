-- Some generated queries for insertion

-- students
INSERT INTO students (id, name, major, join_year) VALUES (1, 'Alice Johnson', 'Computer Science', 2022);
INSERT INTO students (id, name, major, join_year) VALUES (2, 'Bob Smith', 'Mathematics', 2021);
INSERT INTO students (id, name, major, join_year) VALUES (3, 'Charlie Brown', 'Physics', 2023);
INSERT INTO students (id, name, major, join_year) VALUES (4, 'Diana Prince', 'Engineering', 2022);
INSERT INTO students (id, name, major, join_year) VALUES (5, 'Edward Elric', 'Alchemy', 2020);
INSERT INTO students (id, name, major, join_year) VALUES (6, 'Fiona Apple', 'Music', 2023);
INSERT INTO students (id, name, major, join_year) VALUES (7, 'George Clark', 'History', 2022);
INSERT INTO students (id, name, major, join_year) VALUES (8, 'Hannah Lee', 'Biology', 2021);
INSERT INTO students (id, name, major, join_year) VALUES (9, 'Ian Green', 'Economics', 2023);
INSERT INTO students (id, name, major, join_year) VALUES (10, 'Jessica Fox', 'Philosophy', 2022);

-- courses
INSERT INTO courses (id, title, department, number) VALUES (1, 'Intro to Computer Science', 'Computer Science', 101);
INSERT INTO courses (id, title, department, number) VALUES (2, 'Calculus I', 'Mathematics', 201);
INSERT INTO courses (id, title, department, number) VALUES (3, 'Quantum Mechanics', 'Physics', 301);
INSERT INTO courses (id, title, department, number) VALUES (4, 'Thermodynamics', 'Engineering', 401);
INSERT INTO courses (id, title, department, number) VALUES (5, 'Transmutation Basics', 'Alchemy', 501);
INSERT INTO courses (id, title, department, number) VALUES (6, 'Music Theory', 'Music', 601);
INSERT INTO courses (id, title, department, number) VALUES (7, 'Ancient Civilizations', 'History', 701);
INSERT INTO courses (id, title, department, number) VALUES (8, 'Genetics', 'Biology', 801);
INSERT INTO courses (id, title, department, number) VALUES (9, 'Macro Economics', 'Economics', 901);
INSERT INTO courses (id, title, department, number) VALUES (10, 'Ethics', 'Philosophy', 1001);

-- enrollments
INSERT INTO enrollments (id, student_id, course_id) VALUES (1, 1, 1);
INSERT INTO enrollments (id, student_id, course_id) VALUES (2, 2, 2);
INSERT INTO enrollments (id, student_id, course_id) VALUES (3, 3, 3);
INSERT INTO enrollments (id, student_id, course_id) VALUES (4, 4, 4);
INSERT INTO enrollments (id, student_id, course_id) VALUES (5, 5, 5);
INSERT INTO enrollments (id, student_id, course_id) VALUES (6, 6, 6);
INSERT INTO enrollments (id, student_id, course_id) VALUES (7, 7, 7);
INSERT INTO enrollments (id, student_id, course_id) VALUES (8, 8, 8);
INSERT INTO enrollments (id, student_id, course_id) VALUES (9, 9, 9);
INSERT INTO enrollments (id, student_id, course_id) VALUES (10, 10, 10);

-- requirements
INSERT INTO requirements (id, name) VALUES (1, 'General Education');
INSERT INTO requirements (id, name) VALUES (2, 'Major Requirement');
INSERT INTO requirements (id, name) VALUES (3, 'Elective');
INSERT INTO requirements (id, name) VALUES (4, 'Core Course');
INSERT INTO requirements (id, name) VALUES (5, 'Capstone Project');
INSERT INTO requirements (id, name) VALUES (6, 'Internship');
INSERT INTO requirements (id, name) VALUES (7, 'Thesis');
INSERT INTO requirements (id, name) VALUES (8, 'Lab Course');
INSERT INTO requirements (id, name) VALUES (9, 'Workshop');
INSERT INTO requirements (id, name) VALUES (10, 'Seminar');

-- satisfies
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (1, 1, 1);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (2, 2, 2);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (3, 3, 3);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (4, 4, 4);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (5, 5, 5);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (6, 6, 6);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (7, 7, 7);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (8, 8, 8);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (9, 9, 9);
INSERT INTO satisfies (id, course_id, requirement_id) VALUES (10, 10, 10);

-- Gets course titles for student with ID 4.
SELECT "courses"."title"
FROM "enrollments"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id"
WHERE "students"."id" = 4;

-- Fetches department, number, and title of the course named "operating system".
SELECT "department", "number", "title"
FROM "courses"
WHERE "title" = 'Ethics';

-- Finds the requirement names for the course titled "operating research".
SELECT "requirements"."name"
FROM "requirements"
WHERE "requirements"."id" = (
    SELECT "requirement_id"
    FROM "satisfies"
    WHERE "course_id" = (
        SELECT "id"
        FROM "courses"
        WHERE "title" = 'Music Theory'
    )
);
-- Retrieves course titles, numbers, and departments for courses in the "Computer Science" department.
SELECT "courses"."title", "courses"."number", "courses"."department"
FROM "courses"
WHERE "courses"."department" = 'Computer Science';
