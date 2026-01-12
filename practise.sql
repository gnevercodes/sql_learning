-- Active: 1767593631255@@127.0.0.1@5432@postgres
create DATABASE office;
create schema DallasOffice;

create table DallasOffice.departments(
      dept_id INT PRIMARY KEY,
    dept_name TEXT
);
create table DallasOffice.employees(
    mp_id INT PRIMARY KEY,
    emp_name TEXT,
    dept_id INT,
    salary INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES DallasOffice.departments(dept_id)
);

INSERT INTO dallasoffice.departments VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO dallasoffice.employees VALUES
(101, 'Alice', 1, 90000, '2022-01-10'),
(102, 'Bob', 1, 80000, '2021-03-15'),
(103, 'Charlie', 2, 60000, '2020-07-20'),
(104, 'Diana', 3, 75000, '2023-02-01'),
(105, 'Eve', 1, 95000, '2021-11-11'),
(106, 'Frank', 4, 65000, '2022-06-18');

select emp_name, salary from dallasoffice.employees where salary > 80000;

select emp_name from dallasoffice.employees where dept_id=1;

select emp_name,salary from dallasoffice.employees ORDER BY salary DESC;

SELECT emp_name, hire_date
FROM dallasoffice.employees
ORDER BY hire_date DESC;

set search_path TO PUBLIC;

select e.emp_name,d.dept_name from DallasOffice.employees e join dallasoffice.departments d on e.dept_id=d.dept_id where d.dept_name='Engineering';

select d.dept_name, avg(e.salary) as avg_salary
from dallasoffice.employees e
join dallasoffice.departments d 
on e.dept_id = d.dept_id
GROUP BY d.dept_name;

select d.dept_name, count(e.mp_id) as employee_count
from dallasoffice.departments d 
join dallasoffice.employees e
on d.dept_id=e.dept_id
GROUP BY d.dept_name;

insert into dallasoffice.employees values(107,'Ganesh',1,87000,'2024-02-01');
update dallasoffice.employees set salary = salary+5000 where dept_id=1; 

SELECT sum(e.salary) 
from dallasoffice.employees e;

select avg(salary) from dallasoffice.employees;
