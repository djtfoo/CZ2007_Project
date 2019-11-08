--Check that Constraints and Triggers work--

SELECT * FROM Student
INSERT INTO Student VALUES('S1234567B', 'U1234567G', '2019-08-16', 'Physics', 'Physics');	--major <> minor


INSERT INTO Undergraduate VALUES('S1234567B', 6.0);	--GPA cannot be more than 5.0
INSERT INTO Undergraduate VALUES('S1234567B', -1.0);	--GPA cannot be less than 0.0

DELETE FROM Stakeholder WHERE person_ID IN (SELECT person_ID FROM Professor) OR person_ID IN (SELECT person_ID FROM Student) OR person_ID IN (SELECT person_ID FROM Staff);

--Test AssignResearchTrig Trigger for a Graduate who does not have Research/Assigned to Research Lab
INSERT INTO Research VALUES('test', 'S6808102I', 'S9438012H')

UPDATE TechStaffPerson SET school_name = NULL WHERE person_ID = 'S7185346H'

--A Person is in more than 1 School
INSERT INTO School VALUES('Nanyang Business School')
INSERT INTO Person_In_School VALUES('S9954754O', 'Nanyang Business School')
SELECT person_ID
FROM Person_In_School
GROUP BY person_ID
HAVING COUNT(school_name) > 1;

--Have a Graduate who did more than 1 research, assigned to more than 1 prof, and assigned to more than 1 lab--
INSERT INTO Research VALUES('Artificial heart', 'S7255001I', 'S9534185H');
INSERT INTO Grad_Assigned_RLab VALUES('S9534185H', 'Biochemistry Laboratory 1', 'School of Chemical and Biomedical Engineering');
INSERT INTO Grad_Assigned_RLab VALUES('S9534185H', 'Biomedical Informatics Lab', 'School of Computer Science and Engineering');

--Have an Undergraduate who did not attend only 1 of his experiments--
UPDATE Lab_Experiment SET attendance = '0' WHERE experiment_date = '2019-10-22' AND person_ID = 'S9811102A'

SELECT * FROM Technical_Staff

SELECT * FROM Course_Taught ORDER BY professor_person_ID
SELECT * FROM Class ORDER BY person_ID
SELECT * FROM ProfessorPerson

SELECT * FROM PersonInUni;
SELECT * FROM Address;
SELECT * FROM City;
SELECT * FROM State;

SELECT * FROM StakeholderPerson;
SELECT * FROM UndergradPerson;
SELECT * FROM GradPerson;
SELECT * FROM ProfessorPerson;
SELECT * FROM AdminStaffPerson;
SELECT * FROM TechStaffPerson;

SELECT * FROM Comment_Suggestion;

SELECT * FROM School;
SELECT * FROM Person_In_School;
SELECT * FROM Course;
SELECT * FROM Class;
SELECT * FROM Course_Taught;

SELECT * FROM Field_Of_Expertise;
SELECT * FROM Prof_Has_Expertise;

SELECT * FROM Equipment;
SELECT * FROM Equipment_Model;
SELECT * FROM ResearchLab;
SELECT * FROM TeachingLab;
SELECT * FROM Lab_Experiment;
SELECT * FROM Research;
SELECT * FROM Grad_Assigned_RLab;