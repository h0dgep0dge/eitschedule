DROP DATABASE IF EXISTS schedule;
CREATE DATABASE schedule;

\connect schedule

CREATE TABLE Lecturers (
    name VARCHAR(80) PRIMARY KEY NOT NULL,
    url VARCHAR(200)
);

CREATE TABLE Courses (
    name VARCHAR(160) PRIMARY KEY NOT NULL,
    code VARCHAR(15) NOT NULL DEFAULT 'XXX.XXX',
    lecturername varchar(80) REFERENCES Lecturers(name) NOT NULL
);

CREATE TYPE WEEKDAY AS ENUM ('mon','tue','wed','thu','fri','sat','sun');

CREATE TABLE Slots (
    slotID SERIAL PRIMARY KEY NOT NULL,
    courseName varchar(160) REFERENCES Courses(name) NOT NULL,
    day WEEKDAY NOT NULL,
    slotTime NUMERIC(4,1) NOT NULL,
    slotLength NUMERIC(2,1) NOT NULL,
    room VARCHAR(15)
);

CREATE TABLE Sessions (
    sessionID SERIAL PRIMARY KEY NOT NULL,
    slotID INT REFERENCES Slots(slotID) NOT NULL,
    week INT NOT NULL
);
