-- DATA ANALYSIS
-- 1. Employee Details with: employee number, last name, first name, sex, and salary

SELECT e.emp_no, e.last_name, e.first_name, e.sex,s.salary
	from employees e
	join salaries s
		on e.emp_no=s.emp_no;
		
-- 2. First name, last name, and hire date for employees hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
	from employees e
	where EXTRACT(YEAR from e.hire_date) = 1986;
	
-- 3. Departmemt no, Department Name, Employee number, last name, and first name of Department Managers
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
	from dept_manager dm
	left join departments d
		on dm.dept_no=d.dept_no
	join employees e
		on dm.emp_no=e.emp_no;
		
-- Double check that only managers in list by comparing count of dept managers
SELECT count(emp_no) from dept_manager;

-- 4. Employee number, last name, first name, department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees e
	left join employeesdept ed
		on e.emp_no=ed.emp_no
	join departments d
		on ed.dept_no=d.dept_no;
		
-- 5. First name, lastname and sex of employees with a first name of "Hercules" and last name beginnign with "B"
SELECT e.first_name, e.last_name, e.sex
	from employees e
	where (e.first_name='Hercules')
		and (e.last_name like 'B%');
	
-- 6. Employee numbers, last name, first name and department name for all employees in Sales
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees e
	join employeesdept ed
		on e.emp_no=ed.emp_no
	join departments d
		on d.dept_no=ed.dept_no
	where d.dept_name = 'Sales';
	
-- 7. Employees numbers, last name, first name, department name for all employees in Sales and Development
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
	from employees e
	join employeesdept ed
		on e.emp_no=ed.emp_no
	join departments d
		on d.dept_no=ed.dept_no
	where (d.dept_name='Sales')
		or (d.dept_name='Development');
		
-- 8. Frequency Count of Employees last names in descending order
SELECT e.last_name, count(e.last_name) as last_name_count
	from employees e
	group by e.last_name
	order by last_name_count;
