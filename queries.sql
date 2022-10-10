--List the employee number, last name, first name, sex, and salary of each employee.
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY 1;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date 
FROM employees 
WHERE hire_date BETWEEN '01-01-1986' AND '31-12-1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM dept_manager AS d_m
INNER JOIN departments AS d
ON d_m.dept_no= d.dept_no
INNER JOIN employees AS e
ON d_m.emp_no = e.emp_no
ORDER BY 1;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name,d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d_e
ON e.emp_no = d_e.emp_no
INNER JOIN departments AS d
ON d_e.dept_no = d.dept_no
ORDER BY 1;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name, e.first_name, e.sex
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%')
ORDER BY e.last_name;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN current_dept_emp AS c_d_e
ON e.emp_no = c_d_e.emp_no
INNER JOIN departments AS d
ON c_d_e.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN current_dept_emp AS c_d_e
ON e.emp_no = c_d_e.emp_no
INNER JOIN departments AS d
ON c_d_e.dept_no = d.dept_no
WHERE (LOWER(d.dept_name) = 'sales') OR (LOWER(d.dept_name) = 'development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name,COUNT(last_name) AS Frequency 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;
