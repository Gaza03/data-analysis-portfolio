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

## Next Steps
- Build an Excel dashboard from the grouped CSV outputs
- Add visuals (`dashboard.png`) to this repo
