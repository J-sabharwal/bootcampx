SELECT cohorts.name AS cohort_name, COUNT(assignment_submissions.*) as total_submissions
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON student_id = students.id
GROUP BY cohort_name
ORDER BY (total_submissions) DESC, cohort_name;