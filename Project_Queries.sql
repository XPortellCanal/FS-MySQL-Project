USE project_schema;

-- SQL query scripts:
-- The average grade that is given by each professor
SELECT professors_name AS Teacher, AVG(grades_score) AS "Average grade"
FROM courses c
INNER JOIN grades g
ON g.grades_courses_id = c.courses_id
INNER JOIN professors p
ON c.courses_professors_id = p.professors_id
GROUP BY c.courses_professors_id;

-- Top grades for each student
SELECT students_id AS ID, students_name  AS "Student's Name" , MAX(grades_score) AS "Top grade" 
FROM grades g
INNER JOIN students s
ON g.grades_students_id = s.students_id
GROUP BY grades_students_id;

-- Sort students by the courses they are enrolled in.
SELECT s.students_id AS ID, s.students_name AS "Student's Name", COUNT(g.grades_students_id) AS "Number of Courses"
FROM grades g
INNER JOIN students s
ON g.grades_students_id = s.students_id
GROUP BY s.students_id
ORDER BY COUNT(g.grades_students_id); 

-- Create a summary report of courses and their average grades, sorted by the most
-- challenging course(course with the lowest average grade) to the easiest course
SELECT c.courses_id AS ID, c.courses_name AS "Course's Name", AVG(g.grades_score) AS "Average grade"
FROM grades g
INNER JOIN courses c
ON g.grades_courses_id = c.courses_id
GROUP BY grades_courses_id
ORDER BY AVG(grades_score);

-- Find which student and professor have the most courses in common

WITH cte AS (
	SELECT s.students_name, p.professors_name, count(distinct c.courses_id) distCourses
	FROM grades g
	JOIN students s 
	ON g.grades_students_id = s.students_id
	JOIN courses c
	ON g.grades_courses_id = c.courses_id
	JOIN professors p
	ON c.courses_professors_id = p.professors_id
	GROUP BY 
		s.students_name, p.professors_name
	ORDER BY s.students_name
)
SELECT * 
FROM cte
WHERE cte.distCourses = (
	SELECT max(distCourses)
    FROM cte
)