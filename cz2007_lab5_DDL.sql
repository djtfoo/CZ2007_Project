use ssp1g3;
GO

--Create Tables--
CREATE TABLE School(
school_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE State
(state_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE City
(city_name VARCHAR(50),
state_name VARCHAR(50),

PRIMARY KEY(city_name, state_name),
FOREIGN KEY (state_name) REFERENCES State(state_name)
ON UPDATE CASCADE  --reject deletion of a State if there are cities
);

CREATE TABLE Address
(person_address VARCHAR(60) PRIMARY KEY,
zip CHAR(6),
city_name VARCHAR(50) DEFAULT 'Singapore',
state_name VARCHAR(50) DEFAULT 'Singapore',

FOREIGN KEY (city_name, state_name) REFERENCES City(city_name, state_name)
ON DELETE SET NULL ON UPDATE CASCADE,
);

CREATE TABLE PersonInUni
(person_ID CHAR(9) PRIMARY KEY,  --NRIC
person_name VARCHAR(50),
person_address VARCHAR(60),
phone CHAR(10),
email VARCHAR(50),

FOREIGN KEY (person_address) REFERENCES Address(person_address)
ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Stakeholder
(person_ID CHAR(9) PRIMARY KEY,
domain VARCHAR(20),

FOREIGN KEY (person_ID) REFERENCES PersonInUni(person_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Comment_Suggestion
(comment_date DATE,
comment_time TIME(0),
person_ID CHAR(9),
Content VARCHAR(100) not null,
topic VARCHAR(50),

PRIMARY KEY(comment_date , comment_time , person_ID ),
FOREIGN KEY (person_ID) REFERENCES Stakeholder(person_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM sys.foreign_keys;
ALTER TABLE Comment_Suggestion
DROP CONSTRAINT FK__Comment_S__perso__0B5CAFEA
ALTER TABLE Comment_Suggestion
ADD FOREIGN KEY (person_ID) REFERENCES Stakeholder(person_ID) ON DELETE CASCADE ON UPDATE CASCADE


CREATE TABLE Course
(course_ID CHAR(6) PRIMARY KEY,
school_name VARCHAR(50),
course_name VARCHAR(50),

FOREIGN KEY (school_name) REFERENCES School(school_name)
ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Person_In_School(
person_ID CHAR(9),
school_name VARCHAR(50),
PRIMARY KEY(person_ID, school_name),
FOREIGN KEY (person_ID) REFERENCES PersonInUni(person_ID)
  ON DELETE CASCADE ON UPDATE CASCADE,  --If person is deleted, delete entries; if person ID is updated, update entries
FOREIGN KEY (school_name) REFERENCES School(school_name)
  ON DELETE CASCADE ON UPDATE CASCADE  --If school is deleted, delete entries; if school name is updated, update entries
);

CREATE TABLE Staff(
person_ID CHAR(9) PRIMARY KEY,
staff_ID CHAR(9) UNIQUE NOT NULL,
position VARCHAR(50),
date_hired DATE NOT NULL,
FOREIGN KEY (person_ID) REFERENCES PersonInUni(person_ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Administrative_Staff(
person_ID CHAR(9) PRIMARY KEY,
department VARCHAR(50),
FOREIGN KEY (person_ID) REFERENCES Staff(person_ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Laboratory
(lab_name VARCHAR(50),
school_name VARCHAR(50),
location VARCHAR(20) not null,
PRIMARY KEY(lab_name, school_name),
FOREIGN KEY (school_name) REFERENCES School(school_name)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);

CREATE TABLE Equipment_Model
(model_no VARCHAR(20) PRIMARY KEY,
equipment_name VARCHAR(50) not null
);

CREATE TABLE Equipment
(equipment_ID VARCHAR(20),
lab_name VARCHAR(50),
school_name VARCHAR(50),
model_no VARCHAR(20),
date_purchased DATE not null,
PRIMARY KEY(equipment_ID, lab_name, school_name),
FOREIGN KEY (lab_name, school_name) REFERENCES Laboratory(lab_name, school_name)
  ON UPDATE CASCADE
  ON DELETE CASCADE,
FOREIGN KEY (model_no) REFERENCES Equipment_Model(model_no)
  ON UPDATE CASCADE
  ON DELETE CASCADE
);

CREATE TABLE Technical_Staff(
person_ID CHAR(9) PRIMARY KEY,
specialisation VARCHAR(50),
lab_name VARCHAR(50),
school_name VARCHAR(50),
FOREIGN KEY (person_ID) REFERENCES Staff(person_ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (lab_name, school_name) REFERENCES Laboratory(lab_name, school_name) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Research_Lab
(Rlab_name VARCHAR(50),
school_name VARCHAR(50),
type VARCHAR(50), --New lab may not need research type yet
PRIMARY KEY (Rlab_name, school_name),
FOREIGN KEY (Rlab_name,school_name) REFERENCES Laboratory(lab_name,school_name)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Teaching_Lab
(Tlab_name VARCHAR(50),
school_name VARCHAR(50),
purpose VARCHAR(50), --new lab doesn't need purpose yet?
PRIMARY KEY (Tlab_name, school_name),
FOREIGN KEY (Tlab_name,school_name) REFERENCES Laboratory(lab_name,school_name)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Student 
(person_ID CHAR(9) PRIMARY KEY,
student_ID CHAR(9) UNIQUE,
admission_date DATE not null,
major VARCHAR(50) not null,
minor VARCHAR(50),
FOREIGN KEY (person_ID) REFERENCES PersonInUni(person_ID)
  ON UPDATE CASCADE ON DELETE CASCADE,
CHECK(major <> minor)
);

ALTER TABLE Student
ADD CONSTRAINT student_ID CHECK(student_ID LIKE 'U________%' OR student_ID LIKE 'G________%');	--start with 'U' or 'G', followed by 8 characters

CREATE TABLE Undergraduate
(person_ID CHAR(9) PRIMARY KEY,
GPA REAL CHECK(GPA IS NULL OR (GPA >= 0 AND GPA <= 5)), --GPA can be null, e.g. freshmen do not have GPA yet; e.g. AVG(GPA) will not be affected by freshmen
FOREIGN KEY (person_ID) REFERENCES Student(person_ID)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Graduate
(person_ID CHAR(9) PRIMARY KEY,
grad_date DATE not null,
FOREIGN KEY (person_ID) REFERENCES Student(person_ID)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Field_Of_Expertise
(field VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Professor
(person_ID CHAR(9) PRIMARY KEY,
specialisation VARCHAR(50) not null,
FOREIGN KEY (person_ID) REFERENCES PersonInUni(person_ID)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Prof_Has_Expertise
(person_ID CHAR(9),
field VARCHAR(50),
PRIMARY KEY(person_ID, field),
FOREIGN KEY (person_ID) REFERENCES Professor(person_ID)
  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (field) REFERENCES Field_Of_Expertise(field)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Lab_Experiment
(experiment_date DATE,
person_ID CHAR(9),
Tlab_name VARCHAR(50),
school_name VARCHAR(50),
attendance BIT not null,
PRIMARY KEY(experiment_date, person_ID, Tlab_name, school_name),
FOREIGN KEY (person_ID) REFERENCES Undergraduate(person_ID)
  ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Tlab_name, school_name) REFERENCES Teaching_Lab(Tlab_name, school_name)
  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Class
(class_date DATE,
class_time TIME(0),
course_ID CHAR(6),
person_ID CHAR(9),  --professor teaching the course

PRIMARY KEY(course_ID, class_date, class_time),
FOREIGN KEY(course_ID) REFERENCES Course(course_ID)
ON UPDATE CASCADE,  --still thinkin about delete
FOREIGN KEY(person_ID) REFERENCES Professor(person_ID)
ON DELETE CASCADE ON UPDATE CASCADE --fjt
);

CREATE TABLE Grad_Assigned_RLab
(person_ID CHAR(9),
Rlab_name VARCHAR(50),
school_name VARCHAR(50),

FOREIGN KEY (person_ID) REFERENCES Graduate(person_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Rlab_name, school_name) REFERENCES Laboratory(lab_name, school_name)
ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (person_ID, Rlab_name, school_name)
);

--Foreign Keys have cycles or too many cascade paths
CREATE TABLE Research
(topic VARCHAR(50),
professor_person_ID CHAR(9),
graduate_person_ID CHAR(9),

PRIMARY KEY (topic, professor_person_ID, graduate_person_ID),
--FOREIGN KEY (professor_person_ID) REFERENCES Professor(person_ID),	--use trigger to implement 'ON DELETE CASCADE ON UPDATE CASCADE'
--FOREIGN KEY (graduate_person_ID) REFERENCES Graduate(person_ID)		--use trigger to implement 'ON DELETE CASCADE ON UPDATE CASCADE'
);
ALTER TABLE Research ADD FOREIGN KEY (graduate_person_ID) REFERENCES Graduate(person_ID)
ALTER TABLE Research ADD FOREIGN KEY (professor_person_ID) REFERENCES Professor(person_ID)

SELECT * FROM sys.foreign_keys;
ALTER TABLE Research
DROP CONSTRAINT FK__Research__profes__5D95E53A

CREATE TABLE Course_Taught
(date_taught DATE,
student_person_ID CHAR(9),
professor_person_ID CHAR(9), 
course_ID CHAR(6),

PRIMARY KEY(date_taught, student_person_ID, professor_person_ID, course_ID)
--FOREIGN KEY (course_ID) REFERENCES Course(course_ID) ON UPDATE CASCADE, --cannot delete a course if it’s been taught before
--FOREIGN KEY (student_person_ID) REFERENCES Student(person_ID),	--use trigger to implement 'ON DELETE CASCADE ON UPDATE CASCADE'
--FOREIGN KEY (professor_person_ID) REFERENCES Professor(person_ID)	--use trigger to implement 'ON DELETE CASCADE ON UPDATE CASCADE'
);
ALTER TABLE Course_Taught ADD FOREIGN KEY (course_ID) REFERENCES Course(course_ID) ON UPDATE CASCADE
ALTER TABLE Course_Taught ADD FOREIGN KEY (student_person_ID) REFERENCES Student(person_ID)
ALTER TABLE Course_Taught ADD FOREIGN KEY (professor_person_ID) REFERENCES Professor(person_ID)

--Create Triggers--
CREATE TRIGGER CityTrig
ON City
INSTEAD OF INSERT
AS
BEGIN
  IF NOT EXISTS(SELECT * FROM State WHERE state_name IN (SELECT state_name FROM inserted))
  BEGIN
    INSERT INTO State SELECT i.state_name FROM inserted i;
    INSERT INTO City SELECT i.city_name, i.state_name FROM inserted i;
  END;
  ELSE
    INSERT INTO City SELECT i.city_name, i.state_name FROM inserted i;
END;

CREATE TRIGGER courseSchoolTrig
ON Course
INSTEAD OF INSERT 
AS
BEGIN
IF  ((SELECT school_name FROM inserted) NOT IN (SELECT School.school_name FROM School))
BEGIN
INSERT INTO School SELECT school_name FROM inserted;
INSERT INTO Course SELECT * FROM inserted;
END;
ELSE
INSERT INTO Course SELECT * FROM inserted;
END;

CREATE TRIGGER profExpTrig
ON Prof_Has_Expertise
INSTEAD OF INSERT
AS
BEGIN
IF ((SELECT inserted.field FROM inserted) NOT IN (SELECT Field_Of_Expertise.field FROM Field_Of_Expertise))
BEGIN
INSERT INTO Field_Of_Expertise SELECT inserted.field FROM inserted;
INSERT INTO Prof_Has_Expertise SELECT * FROM inserted;
END
ELSE
INSERT INTO Prof_Has_Expertise SELECT * FROM inserted;
END;

--CREATE TRIGGER labRTrig
--ON Research_Lab
--INSTEAD OF INSERT 
--AS
--BEGIN
--IF( NOT EXISTS (SELECT * FROM Laboratory AS L , inserted AS N  WHERE N.Rlab_name = L.lab_name AND N.school_name = L.school_name ))
--BEGIN
--INSERT INTO Laboratory(lab_name, school_name) SELECT N.Rlab_name, N.school_name FROM inserted AS N;
--INSERT INTO Research_Lab SELECT * FROM inserted;
--END
--ELSE
--INSERT INTO Research_Lab SELECT * FROM inserted;
--END;

DROP TRIGGER labRTrig

--CREATE TRIGGER labTTrig
--ON Teaching_Lab
--INSTEAD OF INSERT 
--AS
--BEGIN
--IF( NOT EXISTS (SELECT * FROM Laboratory AS L , inserted AS N  WHERE N.Tlab_name = L.lab_name AND N.school_name = L.school_name ))
--BEGIN
--INSERT INTO Laboratory(lab_name, school_name) SELECT N.Tlab_name , N.school_name FROM inserted AS N;
--INSERT INTO Teaching_Lab SELECT * FROM inserted;
--END
--ELSE
--INSERT INTO Teaching_Lab SELECT * FROM inserted;
--END;
DROP TRIGGER labTTrig

--Insert laboratory into Research_Lab if it is not yet a Research_Lab--
CREATE TRIGGER gradAssignLabTrig
ON Grad_Assigned_RLab
INSTEAD OF INSERT 
AS
BEGIN
  IF ( NOT EXISTS (SELECT * FROM Laboratory AS L, inserted as N WHERE N.Rlab_name = L.lab_name AND N.school_name = L.school_name ))
    RAISERROR('Cannot insert into Grad_Assigned_RLab. Laboratory does not exist', 11, 1);
  ELSE
  BEGIN
  IF ( NOT EXISTS (SELECT * FROM Research_Lab AS L, inserted AS N WHERE N.Rlab_name = L.Rlab_name AND N.school_name = L.school_name ))
    INSERT INTO Research_Lab(Rlab_name, school_name) SELECT  N.Rlab_name , N.school_name FROM inserted AS N;
  INSERT INTO Grad_Assigned_RLab SELECT * FROM inserted;
  END;
END;

--Insert laboratory into Teaching_Lab if it is not yet a Teaching_Lab--
CREATE TRIGGER LabExpTrig
 ON Lab_Experiment
INSTEAD OF INSERT
AS
BEGIN
  IF ( NOT EXISTS (SELECT * FROM Laboratory AS L, inserted as N WHERE N.Tlab_name = L.lab_name AND N.school_name = L.school_name ))
    RAISERROR('Cannot insert into Lab_Experiment. Laboratory does not exist', 11, 1);
  ELSE
  BEGIN
  IF ( NOT EXISTS (SELECT * FROM Teaching_Lab AS L, inserted as N WHERE N.Tlab_name = L.Tlab_name AND N.school_name = L.school_name ))
    INSERT INTO Teaching_Lab(Tlab_name, school_name) SELECT N.Tlab_name , N.school_name FROM inserted AS N;
  INSERT INTO Lab_Experiment SELECT * FROM inserted;
  END;
END;

--CREATE TRIGGER TechStaffTrig
--ON Technical_Staff
--INSTEAD OF INSERT
--AS
--BEGIN
--IF( NOT EXISTS (SELECT * FROM Laboratory L , inserted AS N WHERE N.lab_name = L.lab_name AND N.school_name = L.school_name ))
--BEGIN
--INSERT INTO Laboratory(lab_name, school_name) SELECT N.lab_name , N.school_name FROM inserted AS N;
--INSERT INTO Technical_Staff SELECT * FROM inserted;
--END;
--ELSE
--INSERT INTO Technical_Staff SELECT * FROM inserted;
--END;
DROP TRIGGER TechStaffTrig

CREATE TRIGGER ProfDelTrig
ON Professor
AFTER DELETE
AS
BEGIN
DELETE FROM Research
WHERE Research.professor_person_ID IN (SELECT  deleted.person_ID FROM deleted);
DELETE FROM Course_Taught 
WHERE Course_Taught. professor_person_ID IN (SELECT  deleted.person_ID FROM deleted);
--DELETE FROM Professor
--WHERE Professor.person_ID = (SELECT  deleted.person_ID FROM deleted);
END;
DROP TRIGGER ProfDelTrig

CREATE TRIGGER AssignResearchTrig
ON Research
AFTER INSERT
AS
IF((SELECT N.graduate_person_ID FROM inserted AS N )NOT IN (SELECT Grad_Assigned_RLab.person_ID FROM Grad_Assigned_RLab))
BEGIN
ROLLBACK
RAISERROR('Failed to assign graduate to research, Graduate must be assigned at least one research laboratory', 11, 1);
END;

--Triggers to implement Foreign Key Constraints on Course_Taught--
--CREATE TRIGGER InsertCourseTaughtTrig
--ON Course_Taught
--INSTEAD OF INSERT
--AS
--BEGIN
--IF EXISTS(SELECT * FROM inserted WHERE professor_person_ID NOT IN (SELECT person_ID FROM Professor))
--  RAISERROR('Failed to insert into Course_Taught. professor_person_ID not found in person_ID from Professor', 11, 1);
--ELSE IF EXISTS(SELECT * FROM inserted WHERE student_person_ID NOT IN (SELECT person_ID FROM Student))
--  RAISERROR('Failed to insert into Course_Taught. student_person_ID not found in person_ID from Student', 11, 1);
--ELSE IF EXISTS(SELECT * FROM inserted AS I WHERE course_ID NOT IN (SELECT course_ID FROM Course))
--  RAISERROR('Failed to insert into Course_Taught. course_ID not found in course_ID of Course', 11, 1);
--ELSE
--  INSERT INTO Course_Taught SELECT * FROM inserted;
--END;
DROP TRIGGER InsertCourseTaughtTrig

--CREATE TRIGGER UpdateCourseTaughtTrig
--ON Course_Taught
--AFTER UPDATE
--AS
--IF EXISTS(SELECT * FROM inserted WHERE professor_person_ID NOT IN (SELECT person_ID FROM Professor))
--BEGIN
--  ROLLBACK;
--  RAISERROR('Failed to update Course_Taught. professor_person_ID not found in person_ID from Professor', 11, 1);
--END;
--ELSE IF EXISTS(SELECT * FROM inserted WHERE student_person_ID NOT IN (SELECT person_ID FROM Student))
--BEGIN
--  ROLLBACK;
--  RAISERROR('Failed to update Course_Taught. student_person_ID not found in person_ID from Student', 11, 1);
--END;
--ELSE IF EXISTS(SELECT * FROM inserted AS I WHERE course_ID NOT IN (SELECT course_ID FROM Course))
--BEGIN
--  ROLLBACK;
--  RAISERROR('Failed to update Course_Taught. course_ID not found in course_ID of Course', 11, 1);
--END;
DROP TRIGGER UpdateCourseTaughtTrig

--Triggers to implement Foreign Key Constraints on Research--
--CREATE TRIGGER InsertResearchTrig
--ON Research
--INSTEAD OF INSERT
--AS
--BEGIN
--IF EXISTS(SELECT * FROM inserted WHERE professor_person_ID NOT IN (SELECT person_ID FROM Professor))
--  RAISERROR('Failed to insert into Research. professor_person_ID not found in person_ID from Professor', 11, 1);
--ELSE IF EXISTS(SELECT * FROM inserted WHERE graduate_person_ID NOT IN (SELECT person_ID FROM Graduate))
--  RAISERROR('Failed to insert into Research. graduate_person_ID not found in person_ID from Graduate', 11, 1);
--ELSE
--  INSERT INTO Research SELECT * FROM inserted;
--END;
DROP TRIGGER InsertResearchTrig

--CREATE TRIGGER UpdateResearchTrig
--ON Research
--AFTER UPDATE
--AS
--IF EXISTS(SELECT * FROM inserted WHERE professor_person_ID NOT IN (SELECT person_ID FROM Professor))
--BEGIN
--  ROLLBACK;
--  RAISERROR('Failed to update Research. professor_person_ID not found in person_ID from Professor', 11, 1);
--END;
--ELSE IF EXISTS(SELECT * FROM inserted WHERE graduate_person_ID NOT IN (SELECT person_ID FROM Graduate))
--BEGIN
--  ROLLBACK;
--  RAISERROR('Failed to update Research. graduate_person_ID not found in person_ID from Graduate', 11, 1);
--END;
DROP TRIGGER UpdateResearchTrig

--Create Views (and Triggers) on Subclasses--
CREATE VIEW StakeholderPerson AS
SELECT P.person_ID, P.person_name, P.person_address, A.zip, A.city_name, A.state_name, P.phone, P.email, S.domain
FROM Stakeholder AS S JOIN PersonInUni AS P ON S.person_ID = P.person_ID
  LEFT OUTER JOIN Address A ON P.person_address = A.person_address;

CREATE TRIGGER InsertStakeholder
ON StakeholderPerson
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT * FROM PersonInUni WHERE person_ID IN (SELECT person_ID FROM inserted))
	INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
  INSERT INTO Stakeholder SELECT i.person_ID, i.domain FROM inserted i;
END;


CREATE VIEW AdminStaffPerson AS
SELECT P.person_ID, P.person_name, P.person_address, A.zip, A.city_name, A.state_name, P.phone, P.email, St.staff_ID, St.position, St.date_hired, S.department
FROM Administrative_Staff AS S JOIN Staff St ON S.person_ID = St.person_ID JOIN PersonInUni AS P ON S.person_ID = P.person_ID
  LEFT OUTER JOIN Address A ON P.person_address = A.person_address;

CREATE TRIGGER InsertAdminStaff
ON AdminStaffPerson
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT * FROM PersonInUni WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
  IF NOT EXISTS(SELECT * FROM Staff WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO Staff SELECT i.person_ID, i.staff_ID, i.position, i.date_hired FROM inserted i;
  INSERT INTO Administrative_Staff SELECT i.person_ID, i.department FROM inserted i;
END;


CREATE VIEW TechStaffPerson AS
SELECT P.person_ID, P.person_name, P.person_address, A.zip, A.city_name, A.state_name, P.phone, P.email, St.staff_ID, St.position, St.date_hired, S.specialisation, S.lab_name, S.school_name
FROM Technical_Staff AS S JOIN Staff St ON S.person_ID = St.person_ID JOIN PersonInUni AS P ON S.person_ID = P.person_ID
  LEFT OUTER JOIN Address A ON P.person_address = A.person_address;

CREATE TRIGGER InsertTechStaff
ON TechStaffPerson
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT * FROM PersonInUni WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
  IF NOT EXISTS(SELECT * FROM Staff WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO Staff SELECT i.person_ID, i.staff_ID, i.position, i.date_hired FROM inserted i;
  INSERT INTO Technical_Staff SELECT i.person_ID, i.specialisation, i.lab_name, i.school_name FROM inserted i;
END;


CREATE VIEW UndergradPerson AS
SELECT P.person_ID, P.person_name, P.person_address, A.zip, A.city_name, A.state_name, P.phone, P.email, St.student_ID, St.admission_date, St.major, St.minor, S.GPA
FROM Undergraduate AS S JOIN Student St ON S.person_ID = St.person_ID JOIN PersonInUni AS P ON S.person_ID = P.person_ID
  LEFT OUTER JOIN Address A ON P.person_address = A.person_address;

CREATE TRIGGER InsertUndergrad
ON UndergradPerson
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT * FROM PersonInUni WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
  IF NOT EXISTS(SELECT * FROM Student WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO Student SELECT i.person_ID, i.student_ID, i.admission_date, i.major, i.minor FROM inserted i;
  INSERT INTO Undergraduate SELECT i.person_ID, i.GPA FROM inserted i;
END;


CREATE VIEW GradPerson AS
SELECT P.person_ID, P.person_name, P.person_address, A.zip, A.city_name, A.state_name, P.phone, P.email, St.student_ID, St.admission_date, St.major, St.minor, S.grad_date
FROM Graduate AS S JOIN Student St ON S.person_ID = St.person_ID JOIN PersonInUni AS P ON S.person_ID = P.person_ID
  LEFT OUTER JOIN Address A ON P.person_address = A.person_address;

CREATE TRIGGER InsertGrad
ON GradPerson
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT * FROM PersonInUni WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
  IF NOT EXISTS(SELECT * FROM Student WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO Student SELECT i.person_ID, i.student_ID, i.admission_date, i.major, i.minor FROM inserted i;
  INSERT INTO Graduate SELECT i.person_ID, i.grad_date FROM inserted i;
END;


CREATE VIEW ProfessorPerson AS
SELECT P.person_ID, P.person_name, P.person_address, A.zip, A.city_name, A.state_name, P.phone, P.email, S.specialisation
FROM Professor AS S JOIN PersonInUni AS P ON S.person_ID = P.person_ID
  LEFT OUTER JOIN Address A ON P.person_address = A.person_address;

CREATE TRIGGER InsertProfessor
ON ProfessorPerson
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT * FROM PersonInUni WHERE person_ID IN (SELECT person_ID FROM inserted))
    INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
  INSERT INTO Professor SELECT i.person_ID, i.specialisation FROM inserted i;
END;


CREATE VIEW ResearchLab AS
SELECT P.lab_name, P.school_name, P.location, S.type
FROM Research_Lab AS S JOIN Laboratory AS P ON S.Rlab_name = P.lab_name;

CREATE TRIGGER InsertResearchLab
ON ResearchLab
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT lab_name, school_name FROM Laboratory INTERSECT (SELECT lab_name, school_name FROM inserted))
    INSERT INTO Laboratory SELECT i.lab_name, i.school_name, i.location FROM inserted i;
  INSERT INTO Research_Lab SELECT i.lab_name, i.school_name, i.type FROM inserted i;
END;


CREATE VIEW TeachingLab AS
SELECT P.lab_name, P.school_name, P.location, S.purpose
FROM Teaching_Lab AS S JOIN Laboratory AS P ON S.Tlab_name = P.lab_name;

CREATE TRIGGER InsertTeachingLab
ON TeachingLab
INSTEAD OF INSERT
AS BEGIN
  IF NOT EXISTS(SELECT lab_name, school_name FROM Laboratory INTERSECT (SELECT lab_name, school_name FROM inserted))
    INSERT INTO Laboratory SELECT i.lab_name, i.school_name, i.location FROM inserted i;
  INSERT INTO Teaching_Lab SELECT i.lab_name, i.school_name, i.purpose FROM inserted i;
END;


'''
CREATE TRIGGER InsertAddress
ON PersonInUni
AFTER INSERT
AS BEGIN
  WITH TempAddress(person_address, zip, city_name, state_name) AS SELECT i.person_address, i.zip, i.city_name, i.state_name FROM inserted i
  WHEN (TempAddress.person_address NOT IN (SELECT person_address FROM Address))
	INSERT INTO Address(person_address, zip, city_name, state_name) SELECT TempAddress.person_address, TempAddress.zip, TempAddress.city_name, TempAddress.state_name;
END;
'''

--Insert State, City, and Addresses--
INSERT INTO State VALUES ('Singapore');
INSERT INTO City VALUES ('Singapore' , 'Singapore');
INSERT INTO Address(person_address, zip) VALUES ('445 Clementi Ave 3 #01-173' , '120445');
INSERT INTO Address(person_address, zip) VALUES ('Block 26 Ayer Rajah Crescent 03-08', '139944');
INSERT INTO Address(person_address, zip) VALUES ('179 River Valley Road #05-13 River Valley Building', '179033');
INSERT INTO Address(person_address, zip) VALUES ('1002 Jalan Bukit Merah #02-01/03' , '159456');
INSERT INTO Address(person_address, zip) VALUES ('20 Upper Circular Road #03-06A The Riverwalk' , '058416');
INSERT INTO Address(person_address, zip) VALUES ('101 Thomson Road #07-02 UNITED SQUARE' , '307591');
INSERT INTO Address(person_address, zip) VALUES ('133 New Bridge Road 12-07 Chinatown Point' , '059413');
INSERT INTO Address(person_address, zip) VALUES ('3 Shenton Way #10-05 SHENTON HOUSE' , '068805');
INSERT INTO Address(person_address, zip) VALUES ('19 Kim Keat Road #02-08 Fu Tsu Building' , '328804');
INSERT INTO Address(person_address, zip) VALUES ('180 Clemenceau Avenue #06-01 HAW PAR CENTRE' , '239922');
INSERT INTO Address(person_address, zip) VALUES ('#01-1195 , Blk 12 Toa Payoh Ind Pk Lor 8' , '319064');
INSERT INTO Address(person_address, zip) VALUES ('460 Alexandra Road #38-00 Psa Building' , '119963');
INSERT INTO Address(person_address, zip) VALUES ('110A Killiney Road TAI WAH BUILDING' , '239549');
INSERT INTO Address(person_address, zip) VALUES ('317 Outram Road B1-23 Holiday Inn Atrium' , '169075');
INSERT INTO Address(person_address, zip) VALUES ('1 Hougang Street 91 #01-41 HOUGANG FESTIVAL MARKET' , '538692');
INSERT INTO Address(person_address, zip) VALUES ('620A, Lor 1 Toa Payoh' , '319762');
INSERT INTO Address(person_address, zip) VALUES ('20 Ayer Rajah Crescent #04-04 TECHNOPRENEUR CENTRE' , '139964');


--Insert Stakeholders--
INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S7756201I', 'Long Zi', '445 Clementi Ave 3 #01-173', '6567755182', 'lozi0058@e.ntu.edu.sg', 'public');

INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S6674993I', 'Zhi Duan', 'Block 26 Ayer Rajah Crescent 03-08', '6567772170', 'zhid0122@e.ntu.edu.sg', 'government');

INSERT INTO StakeholderPerson(person_ID, person_name, person_address, phone, email, domain)
VALUES ('S6575203I', 'Jiahao Zheng', '179 River Valley Road #05-13 River Valley Building', '6563380863', 'jiaz0502@e.ntu.edu.sg', 'industry partners');


--Insert Person In School--
INSERT INTO Person_In_School VALUES('S9534183H', 'School of Civil and Environmental Engineering');
INSERT INTO Person_In_School VALUES('S9434566H', 'School of Chemical and Biomedical Engineering');
INSERT INTO Person_In_School VALUES('S9534185H','School of Physical and Mathematical Sciences');
INSERT INTO Person_In_School VALUES ('S9534182H', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9438012H', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9310372A', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9845371C', 'School of Materials Science and Engineering');
INSERT INTO Person_In_School VALUES ('S9811102A', 'School of Chemical and Biomedical Engineering');
INSERT INTO Person_In_School VALUES ('S9822170Z', 'School of Chemical and Biomedical Engineering');
INSERT INTO Person_In_School VALUES ('S8945371A', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S8525200Z', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S8809791A', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S6878903I', 'School of Computer Science and Engineering');
INSERT INTO Person_In_School VALUES ('S7255001I', 'School of Materials Science and Engineering');
INSERT INTO Person_In_School VALUES ('S6808102I', 'School of Chemical and Biomedical Engineering');

INSERT INTO Person_In_School VALUES ('S8932771E', 'school_name');--This guy admin staff not sure if he belongs to a school he work in academic office dept
INSERT INTO Person_In_School VALUES ('S8548701A', 'school_name');--This guy admin staff not sure if he belongs to a school he work in academic office dept
INSERT INTO Person_In_School VALUES ('S8778021Z', 'school_name');--This guy admin staff not sure if he belongs to a school he work in graduate office dept
INSERT INTO Person_In_School VALUES ('S6674993I', 'school_name');--stakeholder got school?
INSERT INTO Person_In_School VALUES ('S6575203I', 'school_name');--stakeholder got school?
INSERT INTO Person_In_School VALUES ('S7756201I', 'school_name');--stakeholder got school?


--UPDATE Teaching_Lab purposes--
UPDATE Teaching_Lab SET purpose = 'Software' WHERE Tlab_name LIKE '%Software%';
UPDATE Teaching_Lab SET purpose = 'Hardware' WHERE Tlab_name LIKE '%Hardware%';

--UPDATE Research_Lab types--
UPDATE Research_Lab SET type = 'R&D' WHERE Rlab_name IN ('Cyber Security Lab', 'Parallel & Distributed Computing Lab', 'Computational Intelligence Lab', 'Hardware & Embedded Systems Lab', 'Computer Networks & Communications Lab');
UPDATE Research_Lab SET type = 'Data Analytics' WHERE Rlab_name IN ('Biomedical Informatics Lab', 'Data Management & Analytics Lab');
UPDATE Research_Lab SET type = 'Applied' WHERE Rlab_name IN ('Multimedia & Interactive Computing Lab');