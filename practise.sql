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


create table departments(
    dept_id serial PRIMARY key,
    dept_name VARCHAR(50) UNIQUE not null
); 
INSERT INTO departments (dept_name) VALUES
('IT'),
('HR'),
('Sales'),
('Finance');

create table employees_v2(
    emp_id SERIAL PRIMARY KEY,
    name varchar(40) not NULL,
    salary int check(salary>0),
    hire_date DATE,
    dept_id INT,
    constraint fk_department
        Foreign Key (dept_id) REFERENCES departments(dept_id)
); 
INSERT INTO employees_v2 (name, salary, hire_date, dept_id) VALUES
('Alice', 90000, '2021-06-15', 1),
('Bob', 85000, '2023-01-10', 1),
('Charlie', 60000, '2020-09-20', 2),
('Diana', 65000, '2022-11-01', 2),
('Evan', 70000, '2023-03-12', 3);

INSERT INTO departments (dept_id, dept_name)
VALUES (1, 'Legal');

