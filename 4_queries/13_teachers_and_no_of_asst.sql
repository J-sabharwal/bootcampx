SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohorts, COUNT(teacher_id) AS total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohorts
ORDER BY teacher;