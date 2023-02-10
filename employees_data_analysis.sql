
-- 1. List the employee number, last name, first name, sex, and salary of each employee

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, es.salary
FROM employees emp
left join salaries es
on emp.emp_no = es.emp_no
ORDER BY emp.emp_no
;


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees emp
WHERE (SELECT EXTRACT(YEAR FROM hire_date)) = 1986
;


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT * FROM departments;
SELECT * FROM dept_manager;

SELECT dm.dept_no, dp.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager dm
inner join departments dp
on dm.dept_no = dp.dept_no
inner join employees emp
on dm.emp_no = emp.emp_no
order by dp.dept_no
;	


-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dp.dept_no, emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees emp
inner join dept_emp de
on emp.emp_no = de.emp_no
inner join departments dp
on de.dept_no = dp.dept_no
;


-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B

SELECT emp.first_name, emp.last_name, emp.sex
FROM employees emp	
WHERE emp.first_name = 'Hercules'
AND substring(emp.last_name,1,1)='B'
;


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees emp
inner join dept_emp de
ON emp.emp_no = de.emp_no
inner join departments dp
ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales'
;


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
FROM employees emp
inner join dept_emp de
ON emp.emp_no = de.emp_no
inner join departments dp
ON de.dept_no = dp.dept_no
WHERE dp.dept_name in('Sales','Development')
ORDER BY emp.emp_no
;


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT emp.last_name, count(emp.last_name) AS count_last_name
FROM employees emp
GROUP BY emp.last_name
ORDER BY count_last_name DESC
;
