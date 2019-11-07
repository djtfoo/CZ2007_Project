--Check that Constraints and Triggers work--

SELECT * FROM Student
INSERT INTO Student VALUES('S1234567B', 'U1234567G', '2019-08-16', 'Physics', 'Physics');	--major <> minor


INSERT INTO Undergraduate VALUES('S1234567B', 6.0);	--GPA cannot be more than 5.0
INSERT INTO Undergraduate VALUES('S1234567B', -1.0);	--GPA cannot be less than 0.0


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