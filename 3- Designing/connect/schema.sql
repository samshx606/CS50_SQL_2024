CREATE TABLE "Users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founding_date" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "Connections_with_people" (
    "id" INTEGER,
    "user1_id" INTEGER,
    "user2_id" INTEGER CHECK("user1_id" != "user2_id"),
    PRIMARY KEY("id"),
    FOREIGN KEY("user1_id") REFERENCES "USERS"("id"),
    FOREIGN KEY("user2_id") REFERENCES "USERS"("id")
);

CREATE TABLE "Connections_with_schools" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "type" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "USERS"("id"),
    FOREIGN KEY("school_id") REFERENCES "Schools"("id")
);

CREATE TABLE "Connections_with_companies" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "USERS"("id"),
    FOREIGN KEY("company_id") REFERENCES "Companies"("id")
);
