DROP TABLE IF EXISTS salaries
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS dept_emp
DROP TABLE IF EXISTS departments
DROP TABLE IF EXISTS employees
DROP TABLE IF EXISTS titles

-- Departments Table
CREATE TABLE "departments" (
    "dept_no" VARCHAR(5) NOT NULL,
    "dept_name" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

SELECT *
FROM departments;

-- Titles Table
CREATE TABLE "titles" (
    "title_id" VARCHAR(6) NOT NULL,
    "title" VARCHAR(50) NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
 );  

SELECT *
FROM titles;

-- Employees Table
CREATE TABLE "employees" (
    "emp_no" INT NOT NULL,
    "emp_title_id" VARCHAR(6) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(20) NOT NULL,
    "last_name" VARCHAR(20) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no"),
	CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id") REFERENCES "titles" ("title_id")
);

SELECT *
FROM employees;



-- Salaries Table
CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

SELECT *
FROM salaries;

-- Department Employees Table
CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(5) NOT NULL,
	CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no", "dept_no"),
    CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no"),
    CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no")
);

SELECT *
FROM dept_emp;

-- Department Managers Table
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(5) NOT NULL,
    "emp_no" INT NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY ("emp_no"),
    CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY ("dept_no") REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY ("emp_no") REFERENCES "employees" ("emp_no")
);

SELECT *
FROM dept_manager;