use ssp1g3
GO

SELECT *
FROM Address
----------------------------------------  INSERTED
SELECT *
FROM Administrative_Staff

INSERT INTO Administrative_Staff
VALUES ('S8932771E', 'Academic Office');

INSERT INTO Administrative_Staff
VALUES ('S8548701A', 'Academic Office');

INSERT INTO Administrative_Staff
VALUES ('S8778021Z', 'Graduate Office');

-------------------------------------------
SELECT *
FROM City
--------------------------------------------------------- INSERTED
SELECT *
FROM Class

INSERT INTO Class
VALUES('2019-08-26', '08:30:00', 'CZ2007', 'S6878903I');

INSERT INTO Class
VALUES('2019-09-02', '08:30:00', 'CZ2007', 'S6878903I');

INSERT INTO Class
VALUES('2019-08-28', '13:30:00', 'CZ2007', 'S6878903I');

INSERT INTO Class
VALUES('2019-09-04', '13:30:00', 'CZ2007', 'S6878903I');

INSERT INTO Class
VALUES ('2019-08-29', '10:30:00', 'CZ2002', 'S6878903I');

INSERT INTO Class
VALUES('2019-09-05', '10:30:00', 'CZ2002', 'S6878903I');

INSERT INTO Class
VALUES('2019-08-19', '8:30:00', 'MS3014', 'S7255001I');

INSERT INTO Class
VALUES('2019-08-26', '8:30:00', 'MS3014', 'S7255001I');

INSERT INTO Class
VALUES('2019-09-02', '8:30:00', 'MS3014', 'S7255001I');

INSERT INTO CLASS
VALUES('2019-08-16' , '10:30:00', 'CH1104', 'S6808102I');

INSERT INTO CLASS
VALUES('2019-08-23' , '10:30:00', 'CH1104', 'S6808102I');

INSERT INTO CLASS
VALUES('2019-08-30' , '10:30:00', 'CH1104', 'S6808102I');

INSERT INTO CLASS
VALUES('2019-09-06' , '10:30:00', 'CH1104', 'S6808102I');
------------------------------------------------------------------

------------------------------------------------------------------
SELECT *
FROM Comment_Suggestion

INSERT INTO Comment_Suggestion
VALUES ('2017-05-18' , '18:44:42', 'S7756201I', 'Long Zi disagrees that the TI-04 calculator should be permissible in examinations.', 'Administrative'); --Long Zi Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2016-06-20' , '22:43:59', 'S6575203I', 'Jiahao Zheng disagrees that the cost allocation contained in FERC Order 76 are appropriate.', 'Financial'); --Jiahao Zheng Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2014-04-24' , '06:52:37', 'S6575203I', 'Jiahao Zheng believes EEE fails to meet the “benefits transparency” principle raised by Long Zi.', 'Administrative'); --Jiahao Zheng Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2018-04-03' , '10:10:17', 'S6575203I', 'Jiahao Zheng asserts that MISO Multi-Value Project (MVP) upgrades are significant.', 'Logistics'); --Jiahao Zheng Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2018-01-17' , '10:13:31', 'S6575203I', 'Jiahao Zheng does not support the upgrades reclassification proposed by Zhi Duan.', 'Administrative'); --Jiahao Zheng Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2018-08-18' , '11:31:21', 'S6575203I', 'Jiahao Zheng believes that NIE has not established that facilities benefit students sufficiently.', 'Logistics'); --Jiahao Zheng Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2017-01-24' , '15:51:09', 'S6674993I', 'Zhi Duan does not support the new scholarship scheme raised in the recent cost allocation plan', 'Financial'); --Zhi Duan Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2016-02-01' , '19:01:17', 'S6674993I', 'Zhi Duan supports the TPP standard to the reimbursement scheme for Graduates students.', 'Financial'); --Zhi Duan Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2018-09-02' , '07:00:15', 'S6674993I', 'Zhi Duan recommends undergraduate student Yu Xing for the NTU-USP Scholarship Programme.', 'Financial'); --Zhi Duan Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2016-01-02' , '09:26:50', 'S6674993I', 'Zhi Duan recommends undergraduate student Wuying Kong for the NTU-USP Scholarship Programme.', 'Financial'); --Zhi Duan Stakeh

INSERT INTO Comment_Suggestion
VALUES ('2016-11-20' , '11:07:03', 'S6674993I', 'Zhi Duan requests Jiahao Zheng to demonstrate benefits for an alternative reclassification program.', 'Administrative'); --Zhi Duan Stakeh
----------------------------------------------------------------------------
SELECT *
FROM Course

SELECT *
FROM Course_Taught

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9534183H' , 'S6878903I' , 'CZ2007');
--Graduate who take course in semester

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9534185H' , 'S6878903I' , 'CZ2007');
--Graduate who take course in semester

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9534182H' , 'S6878903I' , 'CZ2007');
--Graduate who take course in semester

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9434566H' , 'S7255001I' , 'CZ2007');
--Graduate who take course in semester

--INSERT INTO Course_Taught
--VALUES ('2019-08-12' , 'S9534182H' , 'S6878903I' , 'CZ2007');
--Graduate who take course in semester

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9310372A' , 'S6878903I' , 'CZ2007');
--grad take course

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9310372A' , 'S6878903I' , 'CZ2002');
--S6878903I prof teaching one more course for appendix B

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9845371C' , 'S7255001I' , 'MS3014');
--undergrad taking course

INSERT INTO Course_Taught
VALUES ('2019-08-12' , 'S9822170Z' , 'S6808102I' , 'CH1104');
--undergrad taking course

INSERT INTO Course_Taught
VALUES ('2019-06-24' , 'S9811102A' , 'S6808102I' , 'CH1104');
--undergrad taking course in special sem 2

------------------------------------------------------------------------
SELECT *
FROM Equipment

INSERT INTO Equipment
VALUES('RPI5765054', 'Software Lab 1', 'School of Computer Science and Engineering', '0012', '2017-11-20'); --Raspberry Pi 3 Model B+

INSERT INTO Equipment
VALUES('RPI5765429', 'Software Lab 1', 'School of Computer Science and Engineering', '0012', '2017-11-20'); --Raspberry Pi 3 Model B+

INSERT INTO Equipment
VALUES('RPI5761026', 'Software Lab 2', 'School of Computer Science and Engineering', '0012', '2017-11-20'); --Raspberry Pi 3 Model B+

INSERT INTO Equipment
VALUES('RPI5767384', 'Software Lab 3', 'School of Computer Science and Engineering', '0012', '2017-11-20'); --Raspberry Pi 3 Model B+

INSERT INTO Equipment
VALUES('HDW5099703', 'Hardware Lab 1', 'School of Computer Science and Engineering', '475A', '2015-11-20'); --'Oscilloscope'

INSERT INTO Equipment
VALUES('HDW5090883', 'Hardware Lab 2', 'School of Computer Science and Engineering', '475A', '2015-11-20'); --'Oscilloscope'

INSERT INTO Equipment
VALUES('HDW6372498', 'Multimedia & Interactive Computing Lab', 'School of Computer Science and Engineering', '265G', '2016-11-20'); --'External Hard Disk'

INSERT INTO Equipment
VALUES('HDW2665529', 'Data Management & Analytics Lab', 'School of Computer Science and Engineering', '265G', '2016-11-20'); --'External Hard Disk'

INSERT INTO Equipment
VALUES('HDW3243181', 'Biomedical Informatics Lab', 'School of Computer Science and Engineering', '8728', '2011-11-20'); --'Network Printer'

INSERT INTO Equipment
VALUES('EEG1897316', 'Multimedia & Interactive Computing Lab', 'School of Computer Science and Engineering', '2682', '2019-11-20'); --'EEG Headset'

INSERT INTO Equipment
VALUES('EEG6117752', 'Multimedia & Interactive Computing Lab', 'School of Computer Science and Engineering', '2682', '2019-11-20'); --'EEG Headset'

INSERT INTO Equipment
VALUES('EEG7539409', 'Multimedia & Interactive Computing Lab', 'School of Computer Science and Engineering', '2682', '2019-11-20'); --'EEG Headset'
----------------------------------------------------------------------------

----------------------------------------------------------------------------
SELECT *
FROM Equipment_Model

INSERT INTO Equipment_Model
VALUES('0012', 'Raspberry Pi 3 Model B+'
);

INSERT INTO Equipment_Model
VALUES('475A', 'Oscilloscope'
);

INSERT INTO Equipment_Model
VALUES('265G', 'External Hard Disk'
);

INSERT INTO Equipment_Model
VALUES('8728', 'Network Printer'
);

INSERT INTO Equipment_Model
VALUES('2682', 'EEG Headset'
);
---------------------------------------

------------------------------------------
SELECT *
FROM Field_Of_Expertise

INSERT INTO Field_Of_Expertise
VALUES ('Data Structure');
INSERT INTO Field_Of_Expertise
VALUES ('Semiconductor');
INSERT INTO Field_Of_Expertise
VALUES ('DNA');
-----------------------------------------

-------------------------------------
SELECT *
FROM Grad_Assigned_RLab

INSERT INTO Grad_Assigned_RLab
VALUES('S9534183H', 'Construction Technology Laboratory', 'School of Civil and Environmental Engineering');

INSERT INTO Grad_Assigned_RLab
VALUES('S9434566H', 'Biochemistry Laboratory 1' , 'School of Chemical and Biomedical Engineering'); 

INSERT INTO Grad_Assigned_RLab
VALUES('S9534185H', 'Aircraft Hangar' , 'School of Physical and Mathematical Sciences');

INSERT INTO Grad_Assigned_RLab
VALUES('S9438012H', 'Biomedical Informatics Lab', 'School of Computer Science and Engineering');

INSERT INTO Grad_Assigned_RLab
VALUES('S9310372A', 'Cyber Security Lab', 'School of Computer Science and Engineering');

INSERT INTO Grad_Assigned_RLab
VALUES('S9534182H','Data Management & Analytics Lab', 'School of Computer Science and Engineering'); --cs
---------------------------------------------------------------

---------------- 
SELECT *
FROM Graduate

INSERT INTO Graduate
VALUES('S9534182H', '2020-07-31');
INSERT INTO Graduate
VALUES('S9438012H', '2020-07-31');
INSERT INTO Graduate
VALUES('S9310372A', '2021-07-31');
---new---
INSERT INTO Graduate
VALUES('S9534183H', '2020-08-12');

INSERT INTO Graduate
VALUES('S9434566H', '2020-08-12');
INSERT INTO Graduate
VALUES('S9534185H', '2020-08-12');
-------------------

------------------------------------------  INSERTED 
SELECT *
FROM Lab_Experiment

INSERT INTO Lab_Experiment
VALUES('2019-11-01', 'S9845371C', 'Software Lab 1', 'School of Computer Science and Engineering', 1);

INSERT INTO Lab_Experiment
VALUES('2019-10-31', 'S9845371C', 'Software Lab 2', 'School of Computer Science and Engineering', 1);

INSERT INTO Lab_Experiment
VALUES('2019-10-21', 'S9845371C', 'Software Lab 3', 'School of Computer Science and Engineering', 1);

INSERT INTO Lab_Experiment
VALUES('2019-10-22', 'S9811102A', 'Hardware Lab 1', 'School of Computer Science and Engineering', 1);

INSERT INTO Lab_Experiment
VALUES('2019-10-18', 'S9811102A', 'Hardware Lab 2', 'School of Computer Science and Engineering', 1);

INSERT INTO Lab_Experiment
VALUES('2019-11-08', 'S9811102A', 'Hardware Lab 3', 'School of Computer Science and Engineering', 1);

INSERT INTO Lab_Experiment
VALUES('2019-10-08', 'S9822170Z', 'Hardware Projects Laboratory', 'School of Computer Science and Engineering', 1);

UPDATE Lab_Experiment
SET attendance = 0
WHERE person_ID = 'S9822170Z'

INSERT INTO Lab_Experiment
VALUES('2019-11-15', 'S9822170Z', 'Software Projects Laboratory', 'School of Computer Science and Engineering', 0); --never attend
-------------------------------------------

-------------------------------
SELECT *
FROM Laboratory

INSERT INTO Laboratory
VALUES('Construction Technology Laboratory', 'School of Civil and Environmental Engineering', 'N1-B5-W401');

INSERT INTO Laboratory
VALUES( 'Biochemistry Laboratory 1' , 'School of Chemical and Biomedical Engineering', 'SBS-03N-01 60'); 

INSERT INTO Laboratory
VALUES('Aircraft Hangar' , 'School of Physical and Mathematical Sciences', 'N3.2-B4-01');

INSERT INTO Laboratory
VALUES('Software Lab 1', 'School of Computer Science and Engineering', 'N4-01a-02');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Software Lab 2', 'School of Computer Science and Engineering', 'N4-01c-06');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Software Lab 3', 'School of Computer Science and Engineering', 'N4-B1c-14');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Hardware Lab 1', 'School of Computer Science and Engineering', 'N4-01a-03');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Hardware Lab 2', 'School of Computer Science and Engineering', 'N4-01b-05');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Hardware Lab 3', 'School of Computer Science and Engineering', 'N4-B1a-05');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Hardware Projects Laboratory', 'School of Computer Science and Engineering', 'N4-01c-09');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Software Projects Laboratory', 'School of Computer Science and Engineering', 'N4-B1b-11');  --Teaching Lab

INSERT INTO Laboratory
VALUES('Biomedical Informatics Lab', 'School of Computer Science and Engineering', 'NS4-04-33');  --Research lab

INSERT INTO Laboratory
VALUES('Computational Intelligence Lab', 'School of Computer Science and Engineering', 'N4-B1a-02');  --Research lab

INSERT INTO Laboratory
VALUES('Computer Networks & Communications Lab', 'School of Computer Science and Engineering', 'N4-B2a-01');  --Research lab

INSERT INTO Laboratory
VALUES('Cyber Security Lab', 'School of Computer Science and Engineering', 'N4-B2c-06');  --Research lab

INSERT INTO Laboratory
VALUES('Data Management & Analytics Lab', 'School of Computer Science and Engineering', 'N4-B3c-14');  --Research lab

INSERT INTO Laboratory
VALUES('Hardware & Embedded Systems Lab', 'School of Computer Science and Engineering', 'N4-B2b-05');  --Research lab

INSERT INTO Laboratory
VALUES('Multimedia & Interactive Computing Lab', 'School of Computer Science and Engineering', 'N4-B1c-17');  --Research lab

INSERT INTO Laboratory
VALUES('Parallel & Distributed Computing Lab', 'School of Computer Science and Engineering', 'N4-B2a-02');  --Research lab
--------------------------------------------
SELECT *
FROM Person_In_School
INSERT INTO Person_In_School
VALUES('S9534183H', 'School of Civil Engineering',NULL);

INSERT INTO Person_In_School
VALUES('S9434566H', 'School of Chemical and Biomedical Engineering');

INSERT INTO Person_In_School
VALUES('S9534185H','School of Physical and Mathematical Sciences');

INSERT INTO Person_In_School
VALUES ('S9534182H', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S9438012H', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S9310372A', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S9845371C', 'School of Materials Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S9811102A', 'School of Chemical and Biomedical Engineering');

INSERT INTO Person_In_School
VALUES ('S9822170Z', 'School of Chemical and Biomedical Engineering');

INSERT INTO Person_In_School
VALUES ('S8945371A', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S8525200Z', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S8809791A', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S6878903I', 'School of Computer Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S7255001I', 'School of Materials Science and Engineering');

INSERT INTO Person_In_School
VALUES ('S6808102I', 'School of Chemical and Biomedical Engineering');
------------------------------

SELECT *
FROM PersonInUni

SELECT *
FROM Prof_Has_Expertise

SELECT *
FROM Professor
------------------------
SELECT *
FROM Research

INSERT INTO Research
VALUES ('Chemical Solubility', 'S6878903I', 'S9438012H');

INSERT INTO Research
VALUES ('Genetic Algorithms', 'S7255001I', 'S9310372A');

INSERT INTO Research
VALUES ('HMD Interfaces' , 'S6808102I' , 'S9534182H');
-----new-----

INSERT INTO Research
VALUES('Data Mining', 'S6808102I', 'S9534183H');

INSERT INTO Research
VALUES('Fluid', 'S6808102I', 'S9434566H');
INSERT INTO Research
VALUES('Artificial heart','S6808102I', 'S9534185H');
-----end------

SELECT *
FROM Research_Lab

SELECT *
FROM School

SELECT *
FROM Staff

SELECT *
FROM Stakeholder

SELECT *
FROM State

SELECT *
FROM Student

INSERT INTO Student
VALUES('S9534182H', 'G1635252F', '2016-08-12', 'Computer Science',NULL);
INSERT INTO Student
VALUES('S9438012H', 'G1834634G', '2018-08-12', 'Computer Engineering',NULL);
INSERT INTO Student
VALUES('S9310372A', 'G1894958E', '2018-08-12', 'Computer Science', 'Business');
----- new---
INSERT INTO Student
VALUES('S9534183H', 'G1834764G', '2018-08-12', 'Civil Engineering',NULL);

INSERT INTO Student
VALUES('S9434566H', 'G1854634G', '2018-08-12', 'Biomedical Engineering',NULL);
INSERT INTO Student
VALUES('S9534185H', 'G1823634G', '2018-08-12', 'Physics',NULL);
------end-----------
INSERT INTO Student
VALUES('S9438012H', 'G1834634G', '2018-08-12', 'Computer Engineering',NULL);

INSERT INTO Student
VALUES('S9845371C', 'U1823425I', '2018-08-12', 'Material Science', 'Business');
INSERT INTO Student
VALUES('S9811102A', 'U1853434K', '2018-08-12', 'Chemical Engineering', 'Accountancy');
INSERT INTO Student
VALUES('S9822170Z', 'U1854445O', '2018-08-12', 'Biomedical Engineering',NULL);
--------------------------------------- INSERTED
SELECT *
FROM Teaching_Lab
SELECT * 
FROM Technical_Staff
SELECT *
FROM Undergraduate

------
SELECT *
FROM Undergraduate 

INSERT INTO Undergraduate
VALUES('S9845371C', '4.36');
INSERT INTO Undergraduate
VALUES('S9811102A', '3.98');
INSERT INTO Undergraduate
VALUES('S9822170Z', '4.87');
-------------------------------------

------------------------------------------------ INSERTED
SELECT *
FROM Prof_Has_Expertise

INSERT INTO Prof_Has_Expertise
VALUES ('S6878903I', 'Data Structure')
INSERT INTO Prof_Has_Expertise
VALUES ('S7255001I', 'Semiconductor')
INSERT INTO Prof_Has_Expertise
VALUES ('S6808102I', 'DNA')
----------------------------------------------

----------------------------------------------  INSERTED
SELECT *
FROM Professor

------------------------------------

--------------------------
SELECT *
FROM Research_Lab

INSERT INTO Research_Lab
VALUES ('Biomedical Informatics Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Computational Intelligence Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Computer Networks & Communications Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Cyber Security Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Data Management & Analytics Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Hardware & Embedded Systems Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Multimedia & Interactive Computing Lab', 'School of Computer Science and Engineering',null);

INSERT INTO Research_Lab
VALUES('Parallel & Distributed Computing Lab', 'School of Computer Science and Engineering',null);
-----------------------------------------------------------------

---------------------------------------------------
SELECT *
FROM School

INSERT INTO School
VALUES ('School of Chemical and Biomedical Engineering');

INSERT INTO School
VALUES ('School of Civil and Environmental Engineering');

INSERT INTO School
VALUES ('School of Computer Science and Engineering');

INSERT INTO School
VALUES ('School of Electrical and Electronic Engineering');

INSERT INTO School
VALUES ('School of Materials Science and Engineering');

INSERT INTO School
VALUES ('School of Mechanical and Aerospace Engineering');

INSERT INTO School
VALUES ('School of Art, Design and Media');

INSERT INTO School
VALUES ('School of Humanities');

INSERT INTO School
VALUES ('School of Social Sciences');

INSERT INTO School
VALUES ('School of Biological Sciences');

INSERT INTO School
VALUES ('School of Physical and Mathematical Sciences');
------------------------------------------------

---------------------------
SELECT *
FROM Staff

----------------------

-------------------------
SELECT *
FROM STATE

INSERT INTO State
VALUES ('Singapore');
-------------------------

-------------------------
SELECT *
FROM Student

----------------------------

----------------------------------
SELECT *
FROM Teaching_Lab

INSERT INTO Teaching_Lab
VALUES('Software Lab 1', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Software Lab 2', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Software Lab 3', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Hardware Lab 1', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Hardware Lab 2', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Hardware Lab 3', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Hardware Projects Laboratory', 'School of Computer Science and Engineering',null);

INSERT INTO Teaching_Lab
VALUES('Software Projects Laboratory', 'School of Computer Science and Engineering',null);
--------------------------------------------

-------------------------------
SELECT *
FROM Technical_Staff

--------------------------

--------------------------
SELECT *
FROM Undergraduate

---------------------------
SELECT *
FROM Student

INSERT INTO Student
VALUES('S9534182H', 'G1635252F', '2016-08-12', 'Computer Science',NULL);
INSERT INTO Student
VALUES('S9310372A', 'G1894958E', '2018-08-12', 'Computer Science', 'Business');
----- new---
INSERT INTO Student
VALUES('S9534183H', 'G1834764G', '2018-08-12', 'Civil Engineering', NULL);
INSERT INTO Student
VALUES('S9434566H', 'G1854634G', '2018-08-12', 'Biomedical Engineering',NULL);
INSERT INTO Student
VALUES('S9534185H', 'G1823634G', '2018-08-12', 'Physics',NULL);
------end-----------
INSERT INTO Student
VALUES('S9438012H', 'G1834634G', '2018-08-12', 'Computer Engineering',NULL);
INSERT INTO Student
VALUES('S9845371C', 'U1823425I', '2018-08-12', 'Material Science', 'Business');
INSERT INTO Student
VALUES('S9811102A', 'U1853434K', '2018-08-12', 'Chemical Engineering', 'Accountancy');
INSERT INTO Student
VALUES('S9822170Z', 'U1854445O', '2018-08-12', 'Biomedical Engineering',NULL);
-----------------------------------------



SELECT EM.equipment_name , E.equipment_ID
FROM Equipment E, Equipment_Model EM
WHERE E.model_no = EM.model_no
AND E.lab_name = 'Software Lab 1'
AND E.school_name = 'School of Computer Science and Engineering'

SELECT P.person_ID, P.person_name
FROM UndergradPerson P
WHERE NOT EXISTS(
    SELECT L.person_ID
FROM Lab_Experiment L
WHERE L.person_ID = P.person_ID
AND L.attendance = '1');


SELECT P.person_name
FROM Research R, Course_Taught T, GradPerson P
WHERE P.person_ID = R.graduate_person_ID
AND R.graduate_person_ID = T.student_person_ID
AND T.date_taught BETWEEN '2019-08-12' AND '2019-11-15';

SELECT *
FROM Course_Taught

SELECT *
FROM Graduate