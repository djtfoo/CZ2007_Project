use ssp1g3;
GO

--Query 1: Find all Stakeholders who belong to the public domain.
SELECT person_ID, person_name
FROM StakeholderPerson
WHERE domain = 'public';

--Query 2: Find all Stakeholders who have provided at least five comments or suggestions.
SELECT person_ID, person_name
FROM StakeholderPerson
WHERE person_ID IN (SELECT person_ID
					FROM Comment_Suggestion
					GROUP BY person_ID
					HAVING COUNT(*) >= 5);

--Query 3: Find Graduates who are supervised by more than one professor and assigned to more than one research laboratory.
SELECT person_ID, person_name FROM GradPerson P, (
	SELECT graduate_person_ID
	FROM Research R
	GROUP BY graduate_person_ID
	HAVING COUNT(DISTINCT professor_person_ID) > 1
	INTERSECT
	SELECT person_ID AS graduate_person_ID
	FROM Grad_Assigned_Rlab
	GROUP BY person_ID
	HAVING COUNT(*) > 1
	) AS G
WHERE P.person_ID = G.graduate_person_ID;

--Query 4: Find all Professors who teach more than one courses in the semester.
SELECT person_ID, person_name
FROM ProfessorPerson
WHERE person_ID IN (SELECT C.professor_person_ID
					FROM Course_Taught C
					WHERE C.date_taught BETWEEN '2019-08-12' AND '2019-11-15'
					GROUP BY C.professor_person_ID
					HAVING COUNT(DISTINCT C.course_ID) > 1);

--Query 5: List all the Equipment belonging to a particular Laboratory.
SELECT EM.equipment_name, E.equipment_ID
FROM Equipment E, Equipment_Model EM
WHERE E.model_no = EM.model_no
AND E.lab_name = 'Software Lab 1'
AND E.school_name = 'School of Computer Science and Engineering'

--Query 6: Find all Undergraduates who have not attended at least one laboratory experiments.
SELECT P.person_ID, P.person_name
FROM UndergradPerson P
WHERE EXISTS( SELECT L.person_ID
				FROM Lab_Experiment	L
				WHERE L.person_ID = P.person_ID
				AND L.attendance = 0);

SELECT * FROM Lab_Experiment ORDER BY person_ID

--Query 7: List all Graduates who are doing research and taking courses in the semester.
SELECT DISTINCT P.person_ID, P.person_name
FROM Research R, Course_Taught T, GradPerson P
WHERE P.person_ID = R.graduate_person_ID
AND R.graduate_person_ID = T.student_person_ID
AND T.date_taught BETWEEN '2019-08-12' AND '2019-11-15';