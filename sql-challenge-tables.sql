-- Create a new table called departments
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(250) NOT NULL
);

-- Create a new table called dept_emp
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(10) NOT NULL
);

-- Create a new table called dept_manager
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL
);

-- Create a new table called employees
CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title VARCHAR(250) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Create a new table called salaries
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL
);

-- Create a new table called title
CREATE TABLE title (
    title_id VARCHAR(250) NOT NULL,
    title VARCHAR(250) NOT NULL
);

-- Adding constraints, foreign keys and combined keys for employees
ALTER TABLE employees
ADD CONSTRAINT emp_no_unique UNIQUE (emp_no);

-- Adding constraints, foreign keys and combined keys for dept_emp
ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE departments
ADD CONSTRAINT dept_no_unique UNIQUE (dept_no);

-- Adding constraints, foreign keys and combined keys for dept_manager
ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

-- Adding constraints, foreign keys and combined keys for salaries
ALTER TABLE salaries
ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

-- Adding constraints, foreign keys and combined keys for primary keys
ALTER TABLE dept_emp
ADD CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no, dept_no);

ALTER TABLE dept_manager
ADD CONSTRAINT pk_dept_manager PRIMARY KEY (emp_no, dept_no);

ALTER TABLE salaries 
ADD CONSTRAINT pk_salaries PRIMARY KEY (emp_no);