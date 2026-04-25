-- SECTION 1: CREATE TABLES
CREATE DATABASE IF NOT EXISTS HRAttritionDB;
USE HRAttritionDB;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    job_role VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure_years INT,
    salary INT,
    education_level VARCHAR(30),
    attrition VARCHAR(5)  -- 'Yes' or 'No'
);

CREATE TABLE performance (
    emp_id INT,
    review_year INT,
    performance_score INT,  -- 1 to 5
    satisfaction_score INT, -- 1 to 5
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_name VARCHAR(100),
    location VARCHAR(50)
);