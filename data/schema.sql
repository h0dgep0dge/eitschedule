CREATE TABLE Lecturers (
    name VARCHAR(80) PRIMARY KEY NOT NULL,
    url VARCHAR(200)
);

CREATE TABLE Campuses (
    name VARCHAR(20) NOT NULL
);
INSERT INTO Campuses(name) VALUES ('Taradale'),('Tairawhiti');


CREATE TABLE Courses (
    name VARCHAR(160) NOT NULL,
    campus CAMPUS_ENUM NOT NULL,
    code VARCHAR(15) NOT NULL DEFAULT 'XXX.XXX',
    lecturername varchar(80) REFERENCES Lecturers(name),
    PRIMARY KEY (name, campus)
);

CREATE TABLE Weekdays (
    dayName char(3) PRIMARY KEY NOT NULL
);
INSERT INTO Weekdays(dayName) VALUES ('mon'),('tue'),('wed'),('thu'),('fri'),('sat'),('sun');

CREATE TABLE Slots (
    slotID INTEGER PRIMARY KEY NOT NULL,
    courseName varchar(160) NOT NULL,
    campus CAMPUS_ENUM NOT NULL,
    day char(3) REFERENCES Weekdays(dayName) NOT NULL,
    slotTime NUMERIC(4,1) NOT NULL,
    slotLength NUMERIC(2,1) NOT NULL,
    room VARCHAR(15),
    FOREIGN KEY (courseName, campus) REFERENCES Courses (name, campus)
);

CREATE TABLE Sessions (
    sessionID INTEGER PRIMARY KEY NOT NULL,
    slotID INT REFERENCES Slots(slotID) NOT NULL,
    week INT NOT NULL
);

