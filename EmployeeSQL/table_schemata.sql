Drop table employees;
Drop table departments;
Drop table titles;
Drop table dept_emp;
Drop table salaries;
Drop table dept_manager;

-- Create employees table
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	foreign key (emp_title_id) references titles (title_id)
);

select * from employees;

-- Create departments table
create table departments (
	dept_no VARCHAR(4) primary key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);
select * from departments;

-- Create titles table
create table titles (
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(40) NOT NULL
);
select * from titles;

-- Create department employee table
create table dept_emp (
	emp_no INT PRIMARY KEY NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

select * from dept_emp;

-- Create salaries table
create table salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

select * from salaries;

-- Create Department manager table
create table dept_manager (
	dept_no VARCHAR(8) NOT NULL,
	emp_no INT PRIMARY KEY NOT NULL,
	foreign key (dept_no) references departments (dept_no),
    foreign key (emp_no) references employees (emp_no)
    
);
select * from dept_manager;