SELECT COUNT(assistance_requests.id) AS total_assistance, name
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
WHERE teacher_id = 
(SELECT teacher_id FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
WHERE name = 'Waylon Boehm'
GROUP BY teacher_id)
GROUP BY name;

