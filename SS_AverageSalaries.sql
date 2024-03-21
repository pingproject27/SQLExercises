-- Compare each employee's salary with the average salary of the corresponding department.
-- Output the department, first name, and salary of employees along with the average salary of that department.
-- Difficulty: Easy

select department, first_name, salary, avg(salary) over(partition by department) as avg
from employee
