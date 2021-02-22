-- DATA ENGINEERING
-- Creating the Table Schemata for the Employee Database
-- Created based on ERD which can be found here: https://app.quickdatabasediagrams.com/#/d/W83NjN as well as in repository

create table Departments(
	dept_no varchar not null,
	dept_name varchar not null,
	PRIMARY KEY (dept_no)
);

create table Titles(
	title_id varchar,
	title varchar,
	PRIMARY KEY (title_id)
);

create table Employees(
	emp_no integer not null,
	emp_title varchar not null,
	birth_date varchar not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date varchar not null,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES Titles (title_id)
);

create table EmployeesDept(
	emp_no integer not null,
	dept_no varchar not null,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

create table Salaries(
	emp_no integer not null,
	salary float not null,
	PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
);

create table dept_manager(
	dept_no varchar not null,
	emp_no integer not null,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

-- testing tables were created and imported data correctly

select * from Departments;
select * from Titles;
select * from Employees;
select * from EmployeesDept;
select * from Salaries;
select * from dept_manager;
