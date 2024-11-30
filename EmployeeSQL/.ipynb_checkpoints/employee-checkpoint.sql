-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM 
    employees e
JOIN 
    salaries s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
  
FROM 
    employees e

WHERE 
    e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- FIXList the manager of each department along with their department number, department name, employee number, last name, and first name

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    de.dept_no,
    dep.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no,
    departments dep ON de.dept_no = dep.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name



-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B