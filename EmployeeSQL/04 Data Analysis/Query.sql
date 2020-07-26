-- 1/  List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	e.sex, 
	s.salary
FROM "Employees" AS e
JOIN "Salaries" AS s 
ON e.emp_no = s.emp_no;

-- 2/ List first name, last name, and hire date for employees who were hired in 1986
SELECT 
	first_name,
	last_name,
	hire_date 
FROM "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3/ List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT 
	d_m.dept_no,
	d.dept_name,
	d_m.emp_no,
	e.last_name,
	e.first_name
FROM "Department_Manager" AS d_m
JOIN "Departments" AS d
ON d_m.dept_no = d.dept_no 
JOIN "Employees" AS e
ON d_m.emp_no = e.emp_no;

-- 4/ List the department of each employee with the following information: employee number, 
-- last name, first name, and department name (Utilize Views to save time for future analysis) 
CREATE VIEW Employee_Department AS
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name, 
	d.dept_name
FROM "Employees" AS e
JOIN "Department_Employee" AS d_e
ON e.emp_no = d_e.emp_no
JOIN "Departments" AS d  
ON d_e.dept_no = d.dept_no;

SELECT * FROM Employee_Department;


-- 5/ List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B." 
SELECT 
	first_name,
	last_name,
	sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6/ List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT 
	emp_no,
	last_name,
	first_name,
	dept_name 
FROM Employee_Department
WHERE dept_name = 'Sales';

-- 7/ List all employees in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
SELECT *
FROM Employee_Department
WHERE dept_name IN ('Sales','Development');

-- 8/ In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT 
	last_name,
	COUNT(last_name) AS "Frequency Count"
FROM "Employees"
GROUP BY last_name
ORDER BY "Frequency Count" DESC;


