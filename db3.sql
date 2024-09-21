--https://www.sqltutorial.org/sql-sample-database/


CREATE TABLE regions (
	region_id INT PRIMARY KEY,
	region_name  VARCHAR (25)
);


CREATE TABLE countries (
	country_id VARCHAR (2) PRIMARY KEY,
	country_name VARCHAR (40),
	region_id INTEGER NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE locations (
	location_id INT PRIMARY KEY,
	street_address  VARCHAR (40),
	postal_code  VARCHAR (12),
	city  VARCHAR (30) NOT NULL,
	state_province  VARCHAR (25),
	country_id VARCHAR (2) NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE departments (
	department_id INT  PRIMARY KEY,
	department_name  VARCHAR (30) NOT NULL,
	location_id INTEGER,
        FOREIGN KEY (location_id) REFERENCES locations (location_id) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE jobs (
	job_id INT PRIMARY KEY,
	job_title  VARCHAR (35) NOT NULL,
	min_salary NUMERIC (8, 2),
	max_salary NUMERIC (8, 2)
);


CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name  VARCHAR (20),
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number  VARCHAR (20),
	hire_date DATE NOT NULL,
	job_id INTEGER NOT NULL,
	salary NUMERIC (8, 2) NOT NULL,
	manager_id INTEGER,
	department_id INTEGER,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id) ON UPDATE CASCADE ON DELETE CASCADE
);



CREATE TABLE dependents (
	dependent_id INT PRIMARY KEY,
	first_name  VARCHAR (50) NOT NULL,
	last_name  VARCHAR (50) NOT NULL,
	relationship  VARCHAR (25) NOT NULL,
	employee_id INTEGER NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

