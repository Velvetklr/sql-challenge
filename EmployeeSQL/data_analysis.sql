-- List the employee number, last name, first name, sex, and salary of each employee.
select 
	e.emp_no
	,e.last_name
	,e.first_name
	,e.sex
	,s.salary
from employees e
join salaries s
	on e.emp_no = s.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select 
	first_name
	,last_name
	,hire_date
	,date_part('year',hire_date) as hire_year
from employees
where date_part('year',hire_date) = 1986
;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select 
	dm.dept_no
	,d.dept_name
	,dm.emp_no
	,e.last_name
	,e.first_name
from dept_manager dm
join employees e
	on dm.emp_no = e.emp_no
join departments d
	on dm.dept_no = d.dept_no
;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select 
	d.dept_no
	,e.emp_no
	,e.last_name
	,e.first_name
	,d.dept_name
from employees e
	inner join dept_emp de
		on e.emp_no = de.emp_no
	inner join departments d
		on de.dept_no = d.dept_no
;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select 
	first_name
	,last_name
	,sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'
;

--List each employee in the Sales department, including their employee number, last name, and first name.
select 
	d.dept_name
	,de.emp_no
	,e.last_name
	,e.first_name
from departments d
	join dept_emp de
		on d.dept_no = de.dept_no
	join employees e
		on e.emp_no = de.emp_no
where d.dept_name = 'Sales'
;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
	d.dept_name
	,de.emp_no
	,e.last_name
	,e.first_name
from departments d
	join dept_emp de
		on d.dept_no = de.dept_no
	join employees e
		on e.emp_no = de.emp_no
where d.dept_name in ('Development','Sales')
;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select count(emp_no) as employee_count, last_name
from employees
group by 2
order by 1 desc
;
