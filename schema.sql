DROP DATABASE IF EXISTS schedule;
CREATE DATABASE schedule;

\connect schedule

CREATE TABLE Lecturers (
    name VARCHAR(80) PRIMARY KEY NOT NULL,
    url VARCHAR(200)
);

CREATE TYPE CAMPUS_ENUM AS ENUM ('Taradale','Tairawhiti');

CREATE TABLE Courses (
    name VARCHAR(160) NOT NULL,
    campus CAMPUS_ENUM NOT NULL,
    code VARCHAR(15) NOT NULL DEFAULT 'XXX.XXX',
    lecturername varchar(80) REFERENCES Lecturers(name),
    PRIMARY KEY (name, campus)
);

CREATE TYPE WEEKDAY_ENUM AS ENUM ('mon','tue','wed','thu','fri','sat','sun');

CREATE TABLE Slots (
    slotID SERIAL PRIMARY KEY NOT NULL,
    courseName varchar(160) NOT NULL,
    campus CAMPUS_ENUM NOT NULL,
    day WEEKDAY_ENUM NOT NULL,
    slotTime NUMERIC(4,1) NOT NULL,
    slotLength NUMERIC(2,1) NOT NULL,
    room VARCHAR(15),
    FOREIGN KEY (courseName, campus) REFERENCES Courses (name, campus)
);

CREATE TABLE Sessions (
    sessionID SERIAL PRIMARY KEY NOT NULL,
    slotID INT REFERENCES Slots(slotID) NOT NULL,
    week INT NOT NULL
);
