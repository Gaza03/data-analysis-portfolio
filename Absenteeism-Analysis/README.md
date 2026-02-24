# Employee Absenteeism Analysis (SQL + Excel-ready)

## Overview
This project analyzes employee absenteeism records using SQL (SQLite) to uncover patterns in absence duration across time and employee characteristics. The outputs are exported as CSV for dashboarding in Excel.

## Tools
- SQLite / DB Browser for SQLite
- SQL (GROUP BY, AVG, COUNT, CASE WHEN)
- Excel (dashboarding – next step)

## Key Findings
- Overall average absenteeism per incident: **6.92 hours**
- Highest absenteeism month: **Month 7**
- Highest average absenteeism by commute distance: **11–15 km**
- Highest average absenteeism by age group: **50+**
- Highest average absenteeism by BMI category: **Overweight**

## Files
- `analysis_queries.sql` — all SQL queries used for analysis
- `month_grouped.csv` — average absence by month
- `distance_grouped.csv` — grouped distance analysis (with counts)
- `age_grouped.csv` — grouped age analysis (with counts)
- `bmi_grouped.csv` — grouped BMI category analysis (with counts)

## 
- Built an Excel dashboard from the grouped CSV outputs
- `dashboard.png`


The dataset used in this project is publicly available from the UCI Machine Learning Repository:

UCI Machine Learning Repository – Absenteeism at Work Dataset
https://archive.ics.uci.edu/ml/datasets/Absenteeism+at+work

The dataset contains approximately 740 employee absenteeism records with demographic, health, and workplace-related variables.
