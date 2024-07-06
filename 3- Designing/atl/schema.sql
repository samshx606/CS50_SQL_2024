CREATE TABLE "Passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "Airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL,
    PRIMARY KEY("id")
);
CREATE TABLE "FLIGHTS" (
    "id" INTEGER,
    "airline_id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "departing_from" TEXT NOT NULL,
    "departing_to" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "Airlines"("id")
);
CREATE TABLE "Check-Ins" (
    "id" INTEGER,
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("passenger_id") REFERENCES "Passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "Flights"("id")
);
