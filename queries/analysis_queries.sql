-- SECTION 3: ANALYSIS QUERIES
-- ===========================================================

-- Q1. Total employees how many attrition = 'Yes'?
select
count(*) as Total_attrition_yes
from employees 
where attrition="Yes";

-- Q2. Each department how many employees are there?
select department, count(*) as employee_count
from employees
group by department;

-- 3. Attrition rate (%) per department
-- formula:  attrited employees / total employees * 100
select 
department,
sum(case when attrition='Yes' then 1 else 0 end) as Attrition_Count,
count(*) as total_employees,
round(cast(
	sum(case when attrition='Yes' then 1 else 0 end) as float) /
    count(*) * 100, 2
    ) as attrition_rate_percentage
from employees
group by department
order by attrition_rate_percentage desc;

-- 4.Average salary of employees who LEFT vs who STAYED
select attrition,
round(avg(salary),2) as avg_salary
from employees
group by attrition;

-- 5.Employees with tenure < 2 years AND attrition = 'Yes' — how many? Which departments?
select department,
count(attrition) as attrition_count
from employees
where tenure_years < 2 and attrition = 'yes'
group by department;

-- 6. Top 3 job roles with highest attrition count
select job_role,
count(attrition) as attrition_count
from employees
where attrition = 'yes'
group by job_role
order by attrition_count desc
limit 3;

-- 7. Average satisfaction score of employees who left vs stayed
select e.attrition,
avg(p.satisfaction_score) as avg_satisfaction
from employees e
join performance p
on p.emp_id = e.emp_id
group by e.attrition;

-- 8. Department-wise average salary — highest to lowest order
select department,
round(avg(salary), 2) as avg_salary
from employees
group by department
order by avg_salary desc;

-- Each department salary RANK  — top earner per department shown
with ranked_salary as (
	select 
		department,
        name,
        salary,
        dense_rank() over (
			partition by department order by salary desc) as dept_rnk
		from 
        employees
)
select department, name, salary, dept_rnk from ranked_salary
where dept_rnk = 1;

-- 10. Employees whose salary is BELOW their department's average salary AND attrition = 'Yes'
with dept_avg as (
	select 
    department, 
    avg(salary) as avg_salary
    from employees
    group by department
)

select e.name, e.department, e.salary,
	round(d.avg_salary, 2) as dept_avg_salary
from employees e
join dept_avg d on e.department  = d.department 
where e.salary < d.avg_salary
and e.attrition = 'yes';