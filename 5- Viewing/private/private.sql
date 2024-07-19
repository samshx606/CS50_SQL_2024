CREATE TABLE "triplets" (
    "sentence_number" INTEGER,
    "start_char" INTEGER,
    "message_length" INTEGER
);
INSERT INTO "triplets" ("sentence_number", "start_char", "message_length") VALUES
('14' , '98' , '4'),
('114' , '3' , '5'),
('618' , '72' , '9'),
('630' , '7' , '3'),
('932' , '12' , '5'),
('2230' , '50' , '7'),
('2346' , '44' , '10'),
('3041' , '14' , '5');

CREATE VIEW "message" AS
SELECT
    substr("sentences"."sentence", "triplets"."start_char", "triplets".'message_length') AS "phrase"
FROM "triplets" JOIN "sentences"
ON "triplets"."sentence_number" = "sentences"."id";
