CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    salary INT,
    dept_id INT REFERENCES departments(dept_id),
    join_date DATE
);

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    emp_id INT REFERENCES employees(emp_id),
    project_id INT REFERENCES projects(project_id),
    role VARCHAR(50),
    PRIMARY KEY (emp_id, project_id)
);

select * from employee_projects; 

INSERT INTO departments (dept_name) VALUES
('Engineering'),
('HR'),
('Marketing'),
('Finance');

INSERT INTO employees (emp_name, email, salary, dept_id, join_date) VALUES
('Alice', 'alice@company.com', 90000, 1, '2022-01-10'),
('Bob', 'bob@company.com', 75000, 1, '2021-06-15'),
('Charlie', 'charlie@company.com', 60000, 2, '2023-03-01'),
('David', 'david@company.com', 85000, 3, '2020-11-20'),
('Eva', 'eva@company.com', 95000, 1, '2019-09-05');

INSERT INTO projects (project_name, start_date, end_date) VALUES
('Website Revamp', '2023-01-01', '2023-06-30'),
('Payroll System', '2022-05-01', '2022-12-31'),
('Marketing Campaign', '2023-02-15', '2023-08-15');
INSERT INTO employee_projects VALUES
(1, 1, 'Backend Developer'),
(2, 1, 'Frontend Developer'),
(5, 1, 'Tech Lead'),
(3, 2, 'HR Analyst'),
(4, 3, 'Marketing Manager');

select * from projects ; 
select emp_name , salalry from employees;

SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, p.project_name, ep.role
FROM employee_projects ep
JOIN employees e ON ep.emp_id = e.emp_id
JOIN projects p ON ep.project_id = p.project_id;