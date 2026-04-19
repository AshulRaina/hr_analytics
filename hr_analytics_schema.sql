CREATE DATABASE hr_analytics;
USE hr_analytics;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    exit_date DATE,
    attrition VARCHAR(10), -- Yes / No
    performance_rating INT
);

CREATE TABLE recruitment (
    candidate_id INT PRIMARY KEY,
    employee_id INT,
    source VARCHAR(50),
    recruiter_name VARCHAR(100),
    application_date DATE,
    offer_date DATE,
    joining_date DATE,
    status VARCHAR(20), -- Hired / Rejected
    
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status VARCHAR(20), -- Present / Absent / WFH
    
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);