-- ============================================
-- Employee Absenteeism Analysis
-- SQL Queries
-- ============================================

-- 1. Check total records
SELECT COUNT(*) AS total_records
FROM absenteeism_at_work;

-- 2. Overall average absenteeism
SELECT 
ROUND(AVG("Absenteeism time in hours"), 2) AS avg_absence_hours
FROM absenteeism_at_work;

-- 3. Absenteeism by Month
SELECT 
"Month of absence",
ROUND(AVG("Absenteeism time in hours"), 2) AS avg_absence
FROM absenteeism_at_work
GROUP BY "Month of absence"
ORDER BY avg_absence DESC;

-- 4. Distance Grouped Analysis
SELECT 
CASE
    WHEN "Distance from Residence to Work" <= 5 THEN '0-5 km'
    WHEN "Distance from Residence to Work" BETWEEN 6 AND 10 THEN '6-10 km'
    WHEN "Distance from Residence to Work" BETWEEN 11 AND 15 THEN '11-15 km'
    WHEN "Distance from Residence to Work" > 15 THEN '15+ km'
END AS distance_group,
COUNT(*) AS total_records,
ROUND(AVG("Absenteeism time in hours"),2) AS avg_absence
FROM absenteeism_at_work
GROUP BY distance_group
ORDER BY avg_absence DESC;

-- 5. Age Grouped Analysis
SELECT 
CASE
    WHEN Age <= 30 THEN 'Under 30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    WHEN Age > 50 THEN '50+'
END AS age_group,
COUNT(*) AS total_records,
ROUND(AVG("Absenteeism time in hours"),2) AS avg_absence
FROM absenteeism_at_work
GROUP BY age_group
ORDER BY avg_absence DESC;

-- 6. BMI Grouped Analysis
SELECT 
CASE
    WHEN "Body mass index" < 18.5 THEN 'Underweight'
    WHEN "Body mass index" BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN "Body mass index" BETWEEN 25 AND 29.9 THEN 'Overweight'
    WHEN "Body mass index" >= 30 THEN 'Obese'
END AS bmi_category,
COUNT(*) AS total_records,
ROUND(AVG("Absenteeism time in hours"),2) AS avg_absence
FROM absenteeism_at_work
GROUP BY bmi_category
ORDER BY avg_absence DESC;