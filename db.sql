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

INSERT INTO Lecturers (name,url) VALUES
('Daniel Dang', 'https://www.eit.ac.nz/staff/daniel-dang/'),
('Emre Erturk', 'https://www.eit.ac.nz/staff/emre-erturk/'),
('Graham Ward', 'https://www.eit.ac.nz/staff/graham-ward/'),
('Ian Purdon', 'https://www.eit.ac.nz/staff/ian-purdon/'),
('Istvan Lengyel', 'https://www.eit.ac.nz/staff/istvan-lengyel/'),
('John Jamieson', 'https://www.eit.ac.nz/staff/john-jamieson/'),
('Karam Khokra', 'https://www.eit.ac.nz/staff/karam-khokra/'),
('Noor Alani', 'https://www.eit.ac.nz/staff/noor-alani/');

INSERT INTO Courses (name,lecturerName) VALUES
('Advanced Object-Oriented Programming','Daniel Dang'),
('Agile Projects','Noor Alani'),
('Data Analytics','Noor Alani'),
('Digital Forensics Fundamentals','John Jamieson'),
('Electronics And Internet Of Things','Istvan Lengyel'),
('Enterprise Support And Infrastructure','Karam Khokra'),
('Information Systems','Ian Purdon'),
('Internship','Ian Purdon'),
('Introduction To Data Concepts','Daniel Dang'),
('Knowledge Management','Emre Erturk'),
('Machine Learning And Artificial Intelligence','Istvan Lengyel'),
('Project Management','Karam Khokra'),
('Special Topic','Emre Erturk'),
('Systems Analysis','Emre Erturk'),
('Ux And Ui Fundamentals','Graham Ward'),
('Web Application Programming','Daniel Dang');

DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Enterprise Support And Infrastructure','mon',9,2,'c320')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Digital Forensics Fundamentals','mon',11,1,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Data Analytics','mon',13,3,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Electronics And Internet Of Things','mon',13,4,'g122a')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Information Systems','mon',10,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Knowledge Management','mon',13,2,'c113')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Systems Analysis','mon',9,2,'a113')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26),
    (retslotID,27);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Introduction To Data Concepts','mon',13,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Machine Learning And Artificial Intelligence','tue',9,4,'g122a')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Systems Analysis','tue',10,2,'c312')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Advanced Object-Oriented Programming','tue',13,2,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Project Management','tue',15,2,'c218')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Ux And Ui Fundamentals','tue',10,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Agile Projects','tue',13,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Data Analytics','wed',9,1,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Agile Projects','wed',10,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Information Systems','wed',13,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Project Management','wed',10,2,'c218')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Web Application Programming','wed',10,2,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Advanced Object-Oriented Programming','wed',13,2,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Internship','wed',10,1,'a113')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Introduction To Data Concepts','thu',10,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Digital Forensics Fundamentals','thu',13,3,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Special Topic','thu',9,1,'a113')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Knowledge Management','thu',10,2,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Ux And Ui Fundamentals','thu',13,2,'c214/c215')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,25),
    (retslotID,26);
END $$;
DO $$ 
DECLARE
    retslotID Slots.slotID%TYPE;
BEGIN
    INSERT INTO Slots (courseName,day,slotTime,slotLength,room) 
    VALUES ('Web Application Programming','fri',10,2,'c316')
    RETURNING Slots.slotID into retslotID;
    
    INSERT INTO Sessions (slotID,week) VALUES
    (retslotID,8),
    (retslotID,9),
    (retslotID,10),
    (retslotID,11),
    (retslotID,12),
    (retslotID,13),
    (retslotID,14),
    (retslotID,15),
    (retslotID,18),
    (retslotID,19),
    (retslotID,20),
    (retslotID,21),
    (retslotID,22),
    (retslotID,23),
    (retslotID,24),
    (retslotID,2),
    (retslotID,6);
END $$;

SELECT Courses.name,Slots.room,Slots.day,Slots.slottime FROM Sessions
JOIN Slots ON Sessions.slotID = Slots.slotID
JOIN Courses ON Slots.courseName = Courses.name
WHERE Sessions.week = 8 AND
(Courses.name = 'Digital Forensics Fundamentals' OR
Courses.name = 'Electronics And Internet Of Things' OR
Courses.name = 'Project Management' OR
Courses.name = 'Systems Analysis');