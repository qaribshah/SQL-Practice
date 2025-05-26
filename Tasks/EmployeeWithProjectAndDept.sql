CREATE DATABASE employee_management;
USE employee_management;

-- Department Table (no foreign keys, root table)
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

-- Employee Table (references department)
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Project Table (references department)
CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    hours_spent INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Employee_Project Table (references employee and project)
CREATE TABLE employee_project (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES project(project_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Dependent Table (references employee)
CREATE TABLE dependent (
    dependent_id INT PRIMARY KEY,
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Department_Location Table (references department)
CREATE TABLE dept_location (
    dept_id INT,
    location VARCHAR(100),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insert data into department
INSERT INTO department (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert data into employee
INSERT INTO employee (emp_id, emp_name, salary, dept_id) VALUES
(101, 'Alice', 55000.00, 1),
(102, 'Bob', 30000.00, 2),
(103, 'Charlie', 45000.00, 2),
(104, 'David', 18000.00, 3),
(105, 'Eve', 60000.00, 3),
(106, 'Frank', 20000.00, 4);

-- Insert data into project
INSERT INTO project (project_id, project_name, dept_id, hours_spent) VALUES
(201, 'Recruitment Drive', 1, 120),
(202, 'Website Overhaul', 2, 250),
(203, 'Audit 2024', 3, 160),
(204, 'Ad Campaign', 4, 90),
(205, 'Mobile App', 2, 300);

-- Insert data into employee_project
INSERT INTO employee_project (emp_id, project_id) VALUES
(101, 201),
(102, 202),
(103, 202),
(103, 205),
(104, 203),
(105, 203),
(106, 204),
(102, 205);

-- Insert data into dependent
INSERT INTO dependent (dependent_id, emp_id) VALUES
(1, 101),
(2, 101),
(3, 102),
(4, 103),
(5, 103),
(6, 103),
(7, 106);

-- Insert data into dept_location
INSERT INTO dept_location (dept_id, location) VALUES
(1, 'Lahore'),
(2, 'Karachi'),
(2, 'Lahore'),
(3, 'Lahore'),
(3, 'Islamabad'),
(4, 'Multan');

