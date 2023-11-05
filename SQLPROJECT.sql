SELECT * FROM schools.comments;

SELECT * FROM schools.locations;

SELECT * FROM schools.courses;

SELECT * FROM schools.badges;

SELECT schools.comments.school,
	   ROUND(AVG(overall),2) AS avg_overall,
       ROUND(AVG(overallScore),2) AS avg_overalscore,
       ROUND(AVG(jobSupport),2) AS avg_jobsupport,
       ROUND(AVG(curriculum),2) AS avg_curriculum
FROM schools.comments
GROUP BY schools.comments.school;


SELECT schools.comments.school, 
	   schools.comments.program, 
       ROUND(AVG(overall),2) AS avg_overall,
       ROUND(AVG(overallScore),2) AS avg_overalscore,
       ROUND(AVG(jobSupport),2) AS avg_jobsupport
FROM schools.comments
GROUP BY schools.comments.school, schools.comments.program
ORDER BY avg_overall DESC, avg_overalscore DESC;


SELECT schools.locations.`country.name`, 
       MAX(schools.locations.school) AS school,
       COUNT(*) AS count_country
FROM schools.locations
GROUP BY schools.locations.`country.name`
ORDER BY count_country DESC;

SELECT w.`country.name`, 
       w.school,
       w.count_country,
       p.avg_overalscore
FROM (SELECT schools.locations.`country.name`, 
       MAX(schools.locations.school) AS school,
       COUNT(*) AS count_country
FROM schools.locations
GROUP BY schools.locations.`country.name`
ORDER BY count_country DESC) AS w
INNER JOIN (SELECT schools.comments.school,
	   ROUND(AVG(overall),2) AS avg_overall,
       ROUND(AVG(overallScore),2) AS avg_overalscore,
       ROUND(AVG(jobSupport),2) AS avg_jobsupport
FROM schools.comments
GROUP BY schools.comments.school) AS p
ON w.school = p.school
ORDER BY w.count_country DESC;


SELECT schools.comments.school, graduatingYear,
	   ROUND(AVG(curriculum),2) AS avg_curriculum,
       ROUND(AVG(jobSupport),2) AS avg_jobsupport,
       COUNT(schools.comments.school) AS number_students
FROM schools.comments WHERE schools.comments.school = "ironhack"
GROUP BY schools.comments.school, graduatingYear
ORDER BY graduatingYear ASC;


SELECT schools.comments.school, COUNT(schools.comments.school) AS number_students
FROM schools.comments WHERE schools.comments.school = "ironhack"
GROUP BY schools.comments.school;


CREATE TABLE IF NOT EXISTS schools.companies
						   (name TEXT,
                            location VARCHAR(52),
                            job_title VARCHAR (45),
                            company VARCHAR (10),
                            program VARCHAR(40) PRIMARY KEY,
                            student_id INT);
                            
              

CREATE TABLE IF NOT EXISTS schools.alumni
						   (name TEXT,
                            location VARCHAR(52),
                            job_title VARCHAR (45),
                            company VARCHAR (10),
                            program VARCHAR(40) PRIMARY KEY,
                            student_id INT);
                            