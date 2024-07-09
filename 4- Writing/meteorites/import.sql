-- Creating tables
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER PRIMARY KEY,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);
CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

--Importing csv file to table
.import --csv --skip 1 meteorites.csv meteorites_temp

--Write SQL statements to clean the imported data
--First clean
UPDATE "meteorites_temp" SET "mass" = NULL WHERE "mass" = '';
UPDATE "meteorites_temp" SET "year" = NULL WHERE "year" = '';
UPDATE "meteorites_temp" SET "long" = NULL WHERE "long" = '';
UPDATE "meteorites_temp" SET "lat" = NULL WHERE "lat" = '';
--Second clean
UPDATE "meteorites_temp" SET "mass" = ROUND("mass" , 2);
UPDATE "meteorites_temp" SET "long" = ROUND("long" , 2);
UPDATE "meteorites_temp" SET "lat" = ROUND("lat" , 2);

--Transfer the data from your temporary table into a meteorites table
INSERT INTO "meteorites" ("name" , "class" , "mass" , "discovery" , "year" , "lat" , "long")
    SELECT "name" , "class" , "mass" , "discovery" , "year" , "lat" , "long" FROM "meteorites_temp"
        WHERE "nametype" != 'Relict' ORDER BY "year" , "name";

--Dropping temporary table
DROP TABLE "meteorites_temp";
