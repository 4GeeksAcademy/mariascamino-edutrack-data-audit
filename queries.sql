-- ============================================================
-- EduTrack Data Audit — queries.sql
-- Run in order: Q1 → Q12
-- ============================================================


-- ------------------------------------------------------------
-- READING AND FILTERING
-- ------------------------------------------------------------

-- Q1: enrollments in 'Intro to Python'
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';

-- Q2: potential dropouts (completion < 10)
SELECT *
FROM enrollments
WHERE completion_percentage < 10;

-- Q3: enrollments with NULL instructor
SELECT *
FROM enrollments
WHERE instructor IS NULL;

-- Q4: top 5 highest completion among not passed
SELECT student_name, course_title, completion_percentage
FROM enrollments
WHERE passed = false
ORDER BY completion_percentage DESC
LIMIT 5;

-- Q5: enrollments on or after 2024-07-01, newest first
SELECT *
FROM enrollments
WHERE enrollment_date >= '2024-07-01'
ORDER BY enrollment_date DESC;


-- ------------------------------------------------------------
-- DATA CORRECTIONS
-- ------------------------------------------------------------

-- Q6: missing enrollment
INSERT INTO enrollments (
  id, student_id, student_name, student_email, course_id, course_title,
  category, enrollment_date, completion_percentage, passed,
  monthly_fee_paid, instructor
) VALUES (
  18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com', 5,
  'Advanced Python', 'Programming', '2025-04-01', 0, false, 69.99, 'Carlos Vega'
);

-- Q7: fill NULL instructors
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;

-- Q8: delete @test.com enrollments
-- Step 1: confirm which rows will be deleted
SELECT *
FROM enrollments
WHERE student_email LIKE '%@test.com';

-- Step 2: delete them
DELETE FROM enrollments
WHERE student_email LIKE '%@test.com';


-- ------------------------------------------------------------
-- AGGREGATION AND REPORTING (after corrections)
-- ------------------------------------------------------------

-- Q9: enrollments by category
SELECT category, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY category
ORDER BY total_enrollments DESC;

-- Q10: average completion by course (lowest first)
SELECT course_title, ROUND(AVG(completion_percentage), 2) AS avg_completion
FROM enrollments
GROUP BY course_title
ORDER BY avg_completion ASC;

-- Q11: courses with more than 3 enrollments
SELECT course_title, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3;

-- Q12: total revenue by category (highest first)
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;
