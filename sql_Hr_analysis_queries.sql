-- Rank Employees by Salary (Department-wise)
SELECT 
    employee_id,
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Top 3 Highest Paid Employees per Department
SELECT * FROM 
(
    SELECT 
        employee_id,
        name,
        department,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
) AS t
WHERE rnk <= 3;

-- Hiring Funnel Analysis 
SELECT 
    recruiter_name,
    COUNT(*) AS total_candidates,
    SUM(CASE WHEN status = 'Hired' THEN 1 ELSE 0 END) AS hired,
    ROUND(SUM(CASE WHEN status = 'Hired' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS conversion_rate
FROM recruitment
GROUP BY recruiter_name;

-- Time to Hire (Window + Date Logic)
SELECT 
    recruiter_name,
    employee_id,
    DATEDIFF(joining_date, application_date) AS hiring_days,
    AVG(DATEDIFF(joining_date, application_date)) 
        OVER (PARTITION BY recruiter_name) AS avg_hiring_days
FROM recruitment
WHERE status = 'Hired';

-- Running Attrition Trend 
SELECT 
    DATE_FORMAT(exit_date, '%Y-%m') AS month,
    COUNT(*) AS monthly_attrition,
    SUM(COUNT(*)) OVER (ORDER BY DATE_FORMAT(exit_date, '%Y-%m')) AS cumulative_attrition
FROM employees
WHERE attrition = 'Yes'
GROUP BY month;

-- Employee Salary vs Department Average
SELECT 
    employee_id,
    name,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;

-- CTE + Window Function 
WITH salary_ranked AS (
    SELECT 
        employee_id,
        department,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT *
FROM salary_ranked
WHERE rnk = 1;



