const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT cohorts.name AS cohort, teachers.name AS teacher
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
GROUP BY cohorts.name, teachers.name
ORDER BY cohorts.name;
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.cohort} ${user.teacher}`)
  })
  //console.log(res.rows);
})
.catch(err => console.error('query error', err.stack));