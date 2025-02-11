INSERT INTO Lecturers (name,url) VALUES
('Daniel Dang', 'https://www.eit.ac.nz/staff/daniel-dang/'),
('Emre Erturk', 'https://www.eit.ac.nz/staff/emre-erturk/'),
('Graham Ward', 'https://www.eit.ac.nz/staff/graham-ward/'),
('Ian Purdon', 'https://www.eit.ac.nz/staff/ian-purdon/'),
('Istvan Lengyel', 'https://www.eit.ac.nz/staff/istvan-lengyel/'),
('John Jamieson', 'https://www.eit.ac.nz/staff/john-jamieson/'),
('Karam Khokra', 'https://www.eit.ac.nz/staff/karam-khokra/'),
('Noor Alani', 'https://www.eit.ac.nz/staff/noor-alani/'),
('Ian Allan', 'https://www.eit.ac.nz/staff/ian-allan/'),
('Neema Joseph', NULL),
('Anastasia Mozhaeva', 'https://www.eit.ac.nz/staff/anastasia-mozhaeva/'),
('Damith Wijewardana', NULL);

INSERT INTO Courses (name, campus,lecturerName) VALUES
('Advanced Object-Oriented Programming', 'Taradale', 'Daniel Dang'),
('Agile Projects', 'Taradale', 'Noor Alani'),
('Agile Projects', 'Tairawhiti', 'Anastasia Mozhaeva'),
('Data Analytics', 'Taradale', 'Noor Alani'),
('Data Analytics', 'Tairawhiti', 'Damith Wijewardana'),
('Digital Forensics Fundamentals', 'Taradale', 'John Jamieson'),
('Digital Forensics Fundamentals', 'Tairawhiti', 'Damith Wijewardana'),
('Electronics and Internet of Things Technology', 'Taradale', 'Istvan Lengyel'),
('Electronics and Internet of Things Technology', 'Tairawhiti', 'Neema Joseph'),
('Enterprise Support and Infrastructure', 'Taradale', 'Karam Khokra'),
('Information Systems', 'Taradale', 'Ian Purdon'),
('Information Systems', 'Tairawhiti', 'Neema Joseph'),
('Internship', 'Taradale', 'Ian Purdon'),
('Internship', 'Tairawhiti', 'Ian Allan'),
('Introduction to Data Concepts', 'Taradale', 'Daniel Dang'),
('Introduction to Data Concepts', 'Tairawhiti', 'Damith Wijewardana'),
('Knowledge Management', 'Taradale', 'Emre Erturk'),
('Machine Learning and Artificial Intelligence', 'Taradale', 'Istvan Lengyel'),
('Machine Learning and Artificial Intelligence', 'Tairawhiti', 'Anastasia Mozhaeva'),
('Project Management', 'Taradale', 'Karam Khokra'),
('Project Management', 'Tairawhiti', 'Ian Allan'),
('Special Topic', 'Taradale', 'Emre Erturk'),
('Special Topic', 'Tairawhiti', NULL),
('Systems Analysis', 'Taradale', 'Emre Erturk'),
('Systems Analysis', 'Tairawhiti', NULL),
('UX and UI Fundamentals', 'Taradale', 'Graham Ward'),
('UX and UI Fundamentals', 'Tairawhiti', 'Ian Allan'),
('Web Application Programming', 'Taradale', 'Daniel Dang');

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (1,'Advanced Object-Oriented Programming','Taradale','tue',13,2,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (1,8),
    (1,9),
    (1,10),
    (1,11),
    (1,12),
    (1,13),
    (1,14),
    (1,15),
    (1,18),
    (1,19),
    (1,20),
    (1,21),
    (1,22),
    (1,23),
    (1,24),
    (1,25),
    (1,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (2,'Advanced Object-Oriented Programming','Taradale','wed',13,2,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (2,8),
    (2,9),
    (2,10),
    (2,11),
    (2,12),
    (2,13),
    (2,14),
    (2,15),
    (2,18),
    (2,19),
    (2,20),
    (2,21),
    (2,22),
    (2,23),
    (2,24),
    (2,25),
    (2,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (3,'Agile Projects','Taradale','tue',13,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (3,8),
    (3,9),
    (3,10),
    (3,11),
    (3,12),
    (3,13),
    (3,14),
    (3,15),
    (3,18),
    (3,19),
    (3,20),
    (3,21),
    (3,22),
    (3,23),
    (3,24),
    (3,25),
    (3,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (4,'Agile Projects','Taradale','wed',10,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (4,8),
    (4,9),
    (4,10),
    (4,11),
    (4,12),
    (4,13),
    (4,14),
    (4,15),
    (4,18),
    (4,19),
    (4,20),
    (4,21),
    (4,22),
    (4,23),
    (4,24),
    (4,25),
    (4,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (5,'Agile Projects','Tairawhiti','mon',13,2,'PM131')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (5,8),
    (5,9),
    (5,10),
    (5,11),
    (5,12),
    (5,13),
    (5,14),
    (5,15),
    (5,18),
    (5,19),
    (5,20),
    (5,21),
    (5,22),
    (5,23),
    (5,24),
    (5,25),
    (5,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (6,'Agile Projects','Tairawhiti','tue',13,2,'PB101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (6,8),
    (6,9),
    (6,10),
    (6,11),
    (6,12),
    (6,13),
    (6,14),
    (6,15),
    (6,18),
    (6,19),
    (6,20),
    (6,21),
    (6,22),
    (6,23),
    (6,24),
    (6,25),
    (6,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (7,'Data Analytics','Taradale','mon',13,3,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (7,8),
    (7,9),
    (7,10),
    (7,11),
    (7,12),
    (7,13),
    (7,14),
    (7,15),
    (7,18),
    (7,19),
    (7,20),
    (7,21),
    (7,22);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (8,'Data Analytics','Taradale','wed',9,1,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (8,8),
    (8,9),
    (8,10),
    (8,11),
    (8,12),
    (8,13),
    (8,14),
    (8,15),
    (8,18),
    (8,19),
    (8,20),
    (8,21),
    (8,22),
    (8,24),
    (8,25),
    (8,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (9,'Data Analytics','Tairawhiti','mon',13,3,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (9,8),
    (9,9),
    (9,10),
    (9,11),
    (9,12),
    (9,13),
    (9,14),
    (9,15),
    (9,18),
    (9,19),
    (9,20),
    (9,21),
    (9,22),
    (9,23),
    (9,24),
    (9,25),
    (9,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (10,'Data Analytics','Tairawhiti','wed',9,1,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (10,8),
    (10,9),
    (10,10),
    (10,11),
    (10,12),
    (10,13),
    (10,14),
    (10,15),
    (10,18),
    (10,19),
    (10,20),
    (10,21),
    (10,22),
    (10,23),
    (10,24),
    (10,25),
    (10,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (11,'Digital Forensics Fundamentals','Taradale','mon',11,1,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (11,8),
    (11,9),
    (11,10),
    (11,11),
    (11,12),
    (11,13),
    (11,14),
    (11,15),
    (11,18),
    (11,19),
    (11,20),
    (11,21),
    (11,22),
    (11,24),
    (11,25),
    (11,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (12,'Digital Forensics Fundamentals','Taradale','thu',13,3,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (12,8),
    (12,9),
    (12,10),
    (12,11),
    (12,12),
    (12,13),
    (12,14),
    (12,15),
    (12,18),
    (12,19),
    (12,20),
    (12,21),
    (12,22),
    (12,23),
    (12,24),
    (12,25),
    (12,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (13,'Digital Forensics Fundamentals','Tairawhiti','mon',11,1,'PA105')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (13,8),
    (13,9),
    (13,10),
    (13,11),
    (13,12),
    (13,13),
    (13,14),
    (13,15),
    (13,18),
    (13,19),
    (13,20),
    (13,21),
    (13,22),
    (13,24),
    (13,25),
    (13,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (14,'Digital Forensics Fundamentals','Tairawhiti','thu',13,3,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (14,8),
    (14,9),
    (14,10),
    (14,11),
    (14,12),
    (14,13),
    (14,14),
    (14,15),
    (14,18),
    (14,19),
    (14,20),
    (14,21),
    (14,22),
    (14,23),
    (14,24),
    (14,25),
    (14,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (15,'Electronics and Internet of Things Technology','Taradale','mon',13,4,'G122A')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (15,8),
    (15,9),
    (15,10),
    (15,11),
    (15,12),
    (15,13),
    (15,14),
    (15,15),
    (15,18),
    (15,19),
    (15,20),
    (15,21),
    (15,22),
    (15,24),
    (15,25),
    (15,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (16,'Electronics and Internet of Things Technology','Tairawhiti','mon',13,2,'PB101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (16,8),
    (16,9),
    (16,10),
    (16,11),
    (16,12),
    (16,13),
    (16,14),
    (16,15),
    (16,18),
    (16,19),
    (16,20),
    (16,21),
    (16,22),
    (16,24),
    (16,25),
    (16,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (17,'Electronics and Internet of Things Technology','Tairawhiti','wed',10,2,'PB101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (17,8),
    (17,9),
    (17,10),
    (17,11),
    (17,12),
    (17,13),
    (17,14),
    (17,15),
    (17,18),
    (17,19),
    (17,20),
    (17,21),
    (17,22),
    (17,23),
    (17,24),
    (17,25),
    (17,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (18,'Enterprise Support and Infrastructure','Taradale','mon',9,2,'C320')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (18,8),
    (18,9),
    (18,10),
    (18,11),
    (18,12),
    (18,13),
    (18,14),
    (18,15),
    (18,18),
    (18,19),
    (18,20),
    (18,21),
    (18,22),
    (18,24),
    (18,25),
    (18,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (19,'Enterprise Support and Infrastructure','Taradale','wed',13,2,'C320')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (19,8),
    (19,9),
    (19,10),
    (19,11),
    (19,12),
    (19,13),
    (19,14),
    (19,15),
    (19,18),
    (19,19),
    (19,20),
    (19,21),
    (19,22),
    (19,23),
    (19,24),
    (19,25),
    (19,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (20,'Information Systems','Taradale','mon',10,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (20,8),
    (20,9),
    (20,10),
    (20,11),
    (20,12),
    (20,13),
    (20,14),
    (20,15),
    (20,18),
    (20,19),
    (20,20),
    (20,21),
    (20,22),
    (20,24),
    (20,25),
    (20,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (21,'Information Systems','Taradale','wed',13,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (21,8),
    (21,9),
    (21,10),
    (21,11),
    (21,12),
    (21,13),
    (21,14),
    (21,15),
    (21,18),
    (21,19),
    (21,20),
    (21,21),
    (21,22),
    (21,23),
    (21,24),
    (21,25),
    (21,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (22,'Information Systems','Tairawhiti','mon',10,2,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (22,8),
    (22,9),
    (22,10),
    (22,11),
    (22,12),
    (22,13),
    (22,14),
    (22,15),
    (22,18),
    (22,19),
    (22,20),
    (22,21),
    (22,22),
    (22,24),
    (22,25),
    (22,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (23,'Information Systems','Tairawhiti','tue',10,2,'PM112')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (23,8),
    (23,9),
    (23,10),
    (23,11),
    (23,12),
    (23,13),
    (23,14),
    (23,15),
    (23,18),
    (23,19),
    (23,20),
    (23,21),
    (23,22),
    (23,23),
    (23,24),
    (23,25),
    (23,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (24,'Internship','Taradale','thu',10,1,'A113')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (24,8),
    (24,9),
    (24,10),
    (24,11),
    (24,12),
    (24,13),
    (24,14),
    (24,15),
    (24,18),
    (24,19),
    (24,20),
    (24,21),
    (24,22),
    (24,23),
    (24,24),
    (24,25),
    (24,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (25,'Internship','Tairawhiti','mon',11,1,'PM131')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (25,8),
    (25,9),
    (25,10),
    (25,11),
    (25,12),
    (25,13),
    (25,14),
    (25,15),
    (25,18),
    (25,19),
    (25,20),
    (25,21),
    (25,22),
    (25,24),
    (25,25),
    (25,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (26,'Introduction to Data Concepts','Taradale','mon',13,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (26,8),
    (26,9),
    (26,10),
    (26,11),
    (26,12),
    (26,13),
    (26,14),
    (26,15),
    (26,18),
    (26,19),
    (26,20),
    (26,21),
    (26,22),
    (26,24),
    (26,25),
    (26,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (27,'Introduction to Data Concepts','Taradale','thu',10,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (27,8),
    (27,9),
    (27,10),
    (27,11),
    (27,12),
    (27,13),
    (27,14),
    (27,15),
    (27,18),
    (27,19),
    (27,20),
    (27,21),
    (27,22),
    (27,23),
    (27,24),
    (27,25),
    (27,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (28,'Introduction to Data Concepts','Tairawhiti','wed',13,2,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (28,8),
    (28,9),
    (28,10),
    (28,11),
    (28,12),
    (28,13),
    (28,14),
    (28,15),
    (28,18),
    (28,19),
    (28,20),
    (28,21),
    (28,22),
    (28,24),
    (28,25),
    (28,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (29,'Introduction to Data Concepts','Tairawhiti','thu',10,2,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (29,8),
    (29,9),
    (29,10),
    (29,11),
    (29,12),
    (29,13),
    (29,14),
    (29,15),
    (29,18),
    (29,19),
    (29,20),
    (29,21),
    (29,22),
    (29,23),
    (29,24),
    (29,25),
    (29,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (30,'Knowledge Management','Taradale','mon',13,2,'C113')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (30,8),
    (30,9),
    (30,10),
    (30,11),
    (30,12),
    (30,13),
    (30,14),
    (30,15),
    (30,18),
    (30,19),
    (30,20),
    (30,21),
    (30,22),
    (30,24),
    (30,25),
    (30,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (31,'Knowledge Management','Taradale','thu',10,2,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (31,8),
    (31,9),
    (31,10),
    (31,11),
    (31,12),
    (31,13),
    (31,14),
    (31,15),
    (31,18),
    (31,19),
    (31,20),
    (31,21),
    (31,22),
    (31,23),
    (31,24),
    (31,25),
    (31,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (32,'Machine Learning and Artificial Intelligence','Taradale','tue',9,4,'G122A')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (32,8),
    (32,9),
    (32,10),
    (32,11),
    (32,12),
    (32,13),
    (32,14),
    (32,15),
    (32,18),
    (32,19),
    (32,20),
    (32,21),
    (32,22),
    (32,23),
    (32,24),
    (32,25),
    (32,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (33,'Machine Learning and Artificial Intelligence','Tairawhiti','mon',9,2,'PB101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (33,8),
    (33,9),
    (33,10),
    (33,11),
    (33,12),
    (33,13),
    (33,14),
    (33,15),
    (33,18),
    (33,19),
    (33,20),
    (33,21),
    (33,22),
    (33,24),
    (33,25),
    (33,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (34,'Machine Learning and Artificial Intelligence','Tairawhiti','tue',10,2,'PB101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (34,8),
    (34,9),
    (34,10),
    (34,11),
    (34,12),
    (34,13),
    (34,14),
    (34,15),
    (34,18),
    (34,19),
    (34,20),
    (34,21),
    (34,22),
    (34,23),
    (34,24),
    (34,25),
    (34,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (35,'Project Management','Taradale','tue',15,2,'C218')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (35,8),
    (35,9),
    (35,10),
    (35,11),
    (35,12),
    (35,13),
    (35,14),
    (35,15),
    (35,18),
    (35,19),
    (35,20),
    (35,21),
    (35,22),
    (35,23),
    (35,24),
    (35,25),
    (35,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (36,'Project Management','Taradale','wed',10,2,'C218')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (36,8),
    (36,9),
    (36,10),
    (36,11),
    (36,12),
    (36,13),
    (36,14),
    (36,15),
    (36,18),
    (36,19),
    (36,20),
    (36,21),
    (36,22),
    (36,23),
    (36,24),
    (36,25),
    (36,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (37,'Project Management','Tairawhiti','tue',10,2,'PA105')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (37,8),
    (37,9),
    (37,10),
    (37,11),
    (37,12),
    (37,13),
    (37,14),
    (37,15),
    (37,18),
    (37,19),
    (37,20),
    (37,21),
    (37,22),
    (37,23),
    (37,24),
    (37,25),
    (37,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (38,'Project Management','Tairawhiti','thu',10,2,'PA105')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (38,8),
    (38,9),
    (38,10),
    (38,11),
    (38,12),
    (38,13),
    (38,14),
    (38,15),
    (38,18),
    (38,19),
    (38,20),
    (38,21),
    (38,22),
    (38,23),
    (38,24),
    (38,25),
    (38,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (39,'Special Topic','Taradale','thu',9,1,'A113')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (39,8),
    (39,9),
    (39,10),
    (39,11),
    (39,12),
    (39,13),
    (39,14),
    (39,15),
    (39,18),
    (39,19),
    (39,20),
    (39,21),
    (39,22),
    (39,23),
    (39,24),
    (39,25),
    (39,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (40,'Special Topic','Tairawhiti','thu',9,1,'PM108')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (40,8),
    (40,9),
    (40,10),
    (40,11),
    (40,12),
    (40,13),
    (40,14),
    (40,15),
    (40,18),
    (40,19),
    (40,20),
    (40,21),
    (40,22),
    (40,23),
    (40,24),
    (40,25),
    (40,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (41,'Systems Analysis','Taradale','mon',9,2,'A113')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (41,8),
    (41,9),
    (41,10),
    (41,11),
    (41,12),
    (41,13),
    (41,14),
    (41,15),
    (41,18),
    (41,19),
    (41,20),
    (41,21),
    (41,22),
    (41,24),
    (41,25),
    (41,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (42,'Systems Analysis','Taradale','tue',10,2,'C312')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (42,8),
    (42,9),
    (42,10),
    (42,11),
    (42,12),
    (42,13),
    (42,14),
    (42,15),
    (42,18),
    (42,19),
    (42,20),
    (42,21),
    (42,22),
    (42,23),
    (42,24),
    (42,25),
    (42,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (43,'Systems Analysis','Tairawhiti','mon',9,2,'PM131')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (43,8),
    (43,9),
    (43,10),
    (43,11),
    (43,12),
    (43,13),
    (43,14),
    (43,15),
    (43,18),
    (43,19),
    (43,20),
    (43,21),
    (43,22),
    (43,24),
    (43,25),
    (43,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (44,'Systems Analysis','Tairawhiti','wed',13,2,'PA104')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (44,8),
    (44,9),
    (44,10),
    (44,11),
    (44,12),
    (44,13),
    (44,14),
    (44,15),
    (44,18),
    (44,19),
    (44,20),
    (44,21),
    (44,22),
    (44,23),
    (44,24),
    (44,25),
    (44,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (45,'UX and UI Fundamentals','Taradale','tue',10,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (45,8),
    (45,9),
    (45,10),
    (45,11),
    (45,12),
    (45,13),
    (45,14),
    (45,15),
    (45,18),
    (45,19),
    (45,20),
    (45,21),
    (45,22),
    (45,23),
    (45,24),
    (45,25),
    (45,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (46,'UX and UI Fundamentals','Taradale','thu',13,2,'C214/C215')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (46,8),
    (46,9),
    (46,10),
    (46,11),
    (46,12),
    (46,13),
    (46,14),
    (46,15),
    (46,18),
    (46,19),
    (46,20),
    (46,21),
    (46,22),
    (46,23),
    (46,24),
    (46,25),
    (46,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (47,'UX and UI Fundamentals','Tairawhiti','wed',10,2,'PC101')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (47,8),
    (47,9),
    (47,10),
    (47,11),
    (47,12),
    (47,13),
    (47,14),
    (47,15),
    (47,18),
    (47,19),
    (47,20),
    (47,21),
    (47,22),
    (47,23),
    (47,24),
    (47,25),
    (47,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (48,'UX and UI Fundamentals','Tairawhiti','thu',13,2,'PA105')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (48,8),
    (48,9),
    (48,10),
    (48,11),
    (48,12),
    (48,13),
    (48,14),
    (48,15),
    (48,18),
    (48,19),
    (48,20),
    (48,21),
    (48,22),
    (48,23),
    (48,24),
    (48,25),
    (48,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (49,'Web Application Programming','Taradale','wed',10,2,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (49,8),
    (49,9),
    (49,10),
    (49,11),
    (49,12),
    (49,13),
    (49,14),
    (49,15),
    (49,18),
    (49,19),
    (49,20),
    (49,21),
    (49,22),
    (49,23),
    (49,24),
    (49,25),
    (49,26);

INSERT INTO Slots (slotID,courseName,campus,day,slotTime,slotLength,room)
VALUES (50,'Web Application Programming','Taradale','fri',10,2,'C316')
RETURNING Slots.slotID INTO retslotid;

INSERT INTO Sessions (slotID,week) VALUES
    (50,8),
    (50,9),
    (50,10),
    (50,11),
    (50,12),
    (50,13),
    (50,14),
    (50,15),
    (50,18),
    (50,19),
    (50,20),
    (50,21),
    (50,22),
    (50,23),
    (50,24),
    (50,26);

