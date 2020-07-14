-- 1) List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no
order by emp_no;


-- 2) List first name, last name, and hire date for employees who were hired in 1986.

select first_name,
last_name,
hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date;


-- 3) List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

select dept_manager.dept_no,
departments.dept_name,
dept_manager.emp_no,
employees.last_name,
employees.first_name
from dept_manager
join departments
on dept_manager.dept_no = departments.dept_no
join employees
on dept_manager.emp_no = employees.emp_no
order by dept_name;


-- 4) List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
order by emp_no;


-- 5) List first name, last name, and sex for employees whose first name 
-- is "Hercules" and last names begin with "B."

select first_name,
last_name,
sex
from employees
where first_name = 'Hercules' and last_name like 'B%'
order by last_name;


-- 6) List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
order by emp_no;


-- 7) List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
from dept_emp
join employees
on dept_emp.emp_no = employees.emp_no
join departments
on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales'
or departments.dept_name = 'Development'
order by dept_name, emp_no;


-- 8) In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select last_name,
count(last_name) as "frequency"
from employees
group by last_name
order by "frequency" DESC;
