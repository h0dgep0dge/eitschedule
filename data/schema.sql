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
    dayname char(3) PRIMARY KEY NOT NULL
);
INSERT INTO Weekdays(dayname) VALUES ('mon'),('tue'),('wed'),('thu'),('fri'),('sat'),('sun');

CREATE TABLE Slots (
    slotid INTEGER PRIMARY KEY NOT NULL,
    coursename varchar(160) NOT NULL,
    campus CAMPUS_ENUM NOT NULL,
    day char(3) REFERENCES Weekdays(dayname) NOT NULL,
    slottime NUMERIC(4,1) NOT NULL,
    slotlength NUMERIC(2,1) NOT NULL,
    room VARCHAR(15),
    FOREIGN KEY (coursename, campus) REFERENCES Courses (name, campus)
);

CREATE TABLE Sessions (
    sessionid INTEGER PRIMARY KEY NOT NULL,
    slotid INT REFERENCES Slots(slotid) NOT NULL,
    week INT NOT NULL
);

