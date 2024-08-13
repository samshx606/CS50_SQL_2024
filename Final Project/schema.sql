-- Create students table
CREATE TABLE IF NOT EXISTS "students"(
    "id" INT PRIMARY KEY,
    "name" TEXT NOT NULL,
    "major" TEXT NOT NULL,
    "join_year" INT NOT NULL
);
-- Create courses table
CREATE TABLE IF NOT EXISTS "courses"(
    "id" INT PRIMARY KEY,
    "title" TEXT NOT NULL,
    "department" TEXT NOT NULL,
    "number" INT NOT NULL
);
-- Create enrollments table
CREATE TABLE IF NOT EXISTS "enrollments"(
    "id" INT PRIMARY KEY,
    "student_id" INT,
    "course_id" INT,
    FOREIGN KEY("student_id") REFERENCES "students"("id"),
    FOREIGN KEY("course_id") REFERENCES "courses"("id")
);
-- Create requirements table
CREATE TABLE IF NOT EXISTS "requirements"(
    "id" INT PRIMARY KEY,
    "name" TEXT NOT NULL
);
-- Create satisfies table
CREATE TABLE IF NOT EXISTS "satisfies"(
    "id" INT PRIMARY KEY,
    "course_id" INT,
    "requirement_id" INT,
    FOREIGN KEY("course_id") REFERENCES "courses"("id"),
    FOREIGN KEY("requirement_id") REFERENCES "requirements"("id")
);

-- Create a view to list all students with courses they are enrolled in
CREATE VIEW IF NOT EXISTS "list_of_enrollments" AS
SELECT "students"."name" , "courses"."title"
FROM "enrollments"
JOIN "students" ON "enrollments"."student_id" = "students"."id"
JOIN "courses" ON "enrollments"."course_id" = "courses"."id";
-- Create a view to list all courses along with requirements for those courses
CREATE VIEW IF NOT EXISTS "list_of_satisfies" AS
SELECT "courses"."title" , "requirements"."name"
FROM "satisfies"
JOIN "courses" ON "satisfies"."course_id" = "courses"."id"
JOIN "requirements" ON "satisfies"."requirement_id" = "requirements"."id";

-- Create indices to optimize queries
CREATE INDEX IF NOT EXISTS "search_courses_by_title" ON "courses"("title");
CREATE INDEX IF NOT EXISTS "search_courses_by_department" ON "courses"("department");
CREATE INDEX IF NOT EXISTS "search_enrollments_by_student_id" ON "enrollments"("student_id");
CREATE INDEX IF NOT EXISTS "search_satisfies_by_course_id" ON "satisfies"("course_id");
