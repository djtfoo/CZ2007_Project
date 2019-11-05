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
ON UPDATE CASCADE  --reject deletion as comments could be important
);

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
ADD CONSTRAINT student_ID CHECK(student_ID LIKE 'U________%' OR student_ID LIKE 'G________%');	--start with 'U' or 'G', followe by 8 characters


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
FOREIGN KEY(person_ID) REFERENCES Student(person_ID)
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
FOREIGN KEY (professor_person_ID) REFERENCES Professor(person_ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (graduate_person_ID) REFERENCES Graduate(person_ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Course_Taught
(date_taught DATE,
student_person_ID CHAR(9),
professor_person_ID CHAR(9), 
course_ID CHAR(6),

FOREIGN KEY (course_ID) REFERENCES Course(course_ID)
ON UPDATE CASCADE, --cannot delete a course if it’s been taught before
FOREIGN KEY (student_person_ID) REFERENCES PersonInUni(person_ID)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (professor_person_ID) REFERENCES PersonInUni(person_ID)
ON DELETE CASCADE ON UPDATE CASCADE
);

--Create Triggers--
--CREATE TRIGGER CityTrig
--ON City
--INSTEAD OF INSERT
--AS
--  IF NOT EXISTS(SELECT * FROM State WHERE state_name IN (SELECT state_name FROM inserted))
--  BEGIN
--    INSERT INTO State SELECT i.state_name FROM inserted i;
--    INSERT INTO City SELECT i.city_name, i.state_name FROM inserted i;
--  END;

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
  INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
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
  INSERT INTO PersonInUni SELECT i.person_ID, i.person_name, i.person_address, i.phone, i.email FROM inserted i;
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

SELECT * FROM StakeholderPerson;