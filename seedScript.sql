USE project_schema;

INSERT INTO professors(professors_name, professors_email)
VALUES ("Charles Xavier", "Prof@xavier.x");

INSERT INTO professors(professors_name, professors_email)
VALUES ("Han Solo", "Han@solo.com");

INSERT INTO professors(professors_name, professors_email)
VALUES ("Jon Snow", "Jon@snow.org");

SELECT * 
FROM professors;

INSERT INTO students(students_name, students_email)
VALUES
	("Arnold Who", "Arnold@who.org"),
	("Jennifer Gomez", "Jennifer@gomez.org"),
	("Amelia Earhart", "Amelia@earth.fly"),
	("Alan Turing", "Alan@station.x"),
	("Joan Clarke", "Joan@bletchley.park");

SELECT * 
FROM students;

INSERT INTO courses(courses_name, courses_credits, courses_year, courses_professors_id)
VALUES
	("Math", 6.0, 2023, 3),
	("History", 3.0, 2023,1),
	("English", 4.5, 2023,2),
	("Science", 4.5, 2023,3);

SELECT * 
FROM courses; 

INSERT INTO grades(grades_score, grades_students_id, grades_courses_id)
VALUES
	(6.0, 1, 1),
	(7.1, 1, 2),
    (5.5, 1, 3),
    (6.2, 1, 4),
    (7.1, 2, 1),
	(6.2, 2, 2),
    (8.0, 2, 4),
    (8.1, 3, 1),
	(7.2, 3, 2),
    (5.4, 3, 3),
    (10.0, 4, 1),
	(9.4, 4, 2),
    (9.2, 4, 3),
    (10.0, 4, 4),
    (10.0, 5, 1),
	(9.1, 5, 2),
    (10.0, 5, 3);

-- example of search of grades_students_id and grades_courses_id using subqueries.
INSERT INTO grades(grades_score, grades_students_id, grades_courses_id)
VALUES(
	9.5,
    (SELECT students_id FROM students WHERE students_name="Joan Clarke" ),
    (SELECT courses_id FROM courses WHERE courses_name="Science" )
);

SELECT * 
FROM grades; 