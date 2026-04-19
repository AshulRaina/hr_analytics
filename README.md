# hr_analytics
📊 HR Analytics Dashboard (Power BI + SQL)
📌 Overview

This project focuses on analyzing employee data to generate insights into workforce size, hiring trends, and attrition using Power BI and SQL. The dashboard enables data-driven decision-making by presenting key HR metrics in a clear and interactive format.

🛠️ Tools & Technologies
Power BI
MySQL
Microsoft Excel
DAX (Data Analysis Expressions)
📊 Dashboard Features
🔹 KPI Cards
Total Employees
Active Employees
Attrition Rate
🔹 Visualizations
Hiring Trend (Line Chart)
Employees by Department (Bar Chart)
🧠 DAX Measures
Total Employees = DISTINCTCOUNT('Employees'[EmployeeID])

Active Employees =
CALCULATE(
    DISTINCTCOUNT('Employees'[EmployeeID]),
    'Employees'[Status] = "Active"
)

Attrition Rate =
DIVIDE(
    [Employees Left],
    [Total Employees],
    0
)
📈 Dashboard Preview

(Add your screenshot in the /images folder and ensure the file name is correct)

![HR Dashboard](images/hr_dashboard.png)
⚙️ SQL Analysis

📁 File: sql/hr_analysis_queries.sql

The SQL file includes queries for:

-- Total employee count
--Active employees
--Attrition tracking
--Department-wise distribution
--Monthly hiring trends

🔍 Key Insights
Identified overall workforce size and active employee count
Analyzed hiring trends over time
Evaluated department-wise employee distribution
Monitored attrition rate for workforce stability

⚙️ Data Processing
Cleaned and structured employee data using Excel and SQL
Created calculated measures using DAX
Built interactive dashboard for reporting and analysis

🚀 Project Outcome
Developed a complete HR analytics dashboard
Demonstrated SQL querying and DAX-based KPI calculations
Enabled data-driven insights for workforce analysis
