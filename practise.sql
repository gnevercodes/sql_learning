CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);
INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'IT', 90000, '2021-06-15'),
('Bob', 'IT', 85000, '2023-01-10'),
('Charlie', 'HR', 60000, '2020-09-20'),
('Diana', 'HR', 65000, '2022-11-01'),
('Evan', 'Sales', 70000, '2023-03-12'),
('Fiona', 'Sales', 72000, '2024-05-18'),
('George', 'Finance', 95000, '2019-02-25');

select count(*) from employees;
select department,count(*) from employees
GROUP BY department; 

select sum(salary) from employees;

select department,sum(salary) 
from employees
GROUP BY department;

select avg(salary) from employees;

select department,avg(salary)
from employees
GROUP BY department;

select min(salary) as lowest_salary,
max(salary) as highest_salary 
from employees;

select department , max(salary) 
from employees
GROUP BY department;

select department,count(department) as employee_count
from employees 
GROUP BY department;

select department 
FROM employees
GROUP BY department
having count(*) >1; 

select max(salary) as highest_salary
from employees
where department='Sales';

SELECT AVG(salary) AS avg_salary
FROM employees
WHERE hire_date > '2021-12-31';
