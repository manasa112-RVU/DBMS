-- ======================================================================
-- Lab Experiment 04 – Implementation of Different Types of Operators in SQL
-- ======================================================================

-- Step 1: Create Database
DROP DATABASE IF EXISTS OperatorLab;
CREATE DATABASE OperatorLab;
USE OperatorLab;

-- Step 2: Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Step 3: Insert Sample Data
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

-- ======================================================================
-- PRACTICE TASKS
-- ======================================================================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT Name, Salary, Salary + (Salary * 0.10) AS SalaryWithBonus
FROM Employees;

-- Output
-- Name     Salary    SalaryWithBonus
-- Ashish   60000.00  66000.0000
-- Binary   80000.00  88000.0000
-- Charlie  55000.00  60500.0000
-- Dhruv    75000.00  82500.0000

-- b. Subtract tax (15% of Salary) from each employee's salary.
-- WRITE YOUR QUERY BELOW
SELECT Name, Salary, Salary - (Salary * 0.15)AS SalaryAfterTax
FROM Employees;

-- Output
-- Name    Salary    SalaryAfterTax
-- Ashish  60000.00  51000.0000
-- Binay   80000.00	 68000.0000
-- Charlie 55000.00	 46750.0000
-- Dhruv   75000.00	 63750.0000

-- c. Calculate the yearly salary from the monthly salary (Salary * 12).
-- WRITE YOUR QUERY BELOW
SELECT Name, Salary, (Salary * 12)AS MontlySalary
FROM Employees;

-- Output
-- Name    MonthlySalary  Salary
-- Ashish  720000.00	  60000.00
-- Binay   960000.00	  80000.00
-- Charlie 660000.00	  55000.00
-- Dhruv   900000.00	  75000.00

-- d. Find the remainder when employees' ages are divided by 5.
-- WRITE YOUR QUERY BELOW
SELECT Name, Age, (Age % 5) AS Remainder
FROM Employees;

-- Output
-- Name     Age  Remainder
-- Ashish	28	  3
-- Binay	45	  0
-- Charlie	32	  2
-- Dhruv	38	  3
-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary greater than 50000.
-- WRITE YOUR QUERY BELOW
SELECT Name,Age,Salary 
FROM Employees
WHERE Age>30 AND Salary>50000;

-- Output
-- Name    Age  Salary
-- Binay   45   80000.00
-- Charlie 32	55000.00
-- Dhruv   38	75000.00

-- b. Employees either in 'HR' department OR salary > 70000.
-- WRITE YOUR QUERY BELOW
SELECT Name,Department,Salary
FROM Employees
WHERE Department='HR' OR Salary>70000;

-- Output
-- Name  Department  Salary
-- Binay	HR	     80000.00
-- Dhruv	HR	     75000.00

-- c. Employees who do NOT live in 'New York'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Address NOT LIKE '%New York%';

-- Output
-- EmployeeID  Name    Age  Salary   Department  HireDate     Address
-- 1002	       Binay   45   80000.00	 HR      2020-07-15	  456 Elm St, Chicago
-- 1003	       Charlie 32	55000.00	Finance	 2022-01-10	  789 Oak St, Los Angeles
						
-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Find employees with salary = 60000.
-- WRITE YOUR QUERY BELOW

-- Output  
-- EmployeeID  Name     Age  Salary     Department  HireDate    Address
-- 1001        Ashish	28	 60000.00	IT	      2024-05-01	123 Main St, New York

-- b. List employees not in the 'IT' department.
-- WRITE YOUR QUERY BELOW
SELECT Name,Department
FROM Employees
WHERE Department IN ('HR','IT','Finance');

-- Output
-- Name   Department
-- Ashish	IT
-- Binay	HR
-- Charlie	Finance
-- Dhruv	HR

-- c. Retrieve employees younger than 25 with salary > 50000.
-- WRITE YOUR QUERY BELOW
SELECT Name FROM Employees
WHERE Name LIKE 'A%';

-- Output
-- Name
-- Ashish

-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. BETWEEN → List employees with age between 25 and 35.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Age BETWEEN 25 AND 35;

-- Output
-- EmployeeID  Name    Age  Salary   Department  HireDate     Address
-- 1002	       Binay   45   80000.00	 HR      2020-07-15	  456 Elm St, Chicago
-- 1003	       Charlie 32	55000.00	Finance	 2022-01-10	  789 Oak St, Los Angeles

-- b. IN → Find employees working in 'HR', 'IT', or 'Finance'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');

-- Output
-- EmployeeID   Name   Age   Salary   Department   HireDate     Address
-- 1001	       Ashish	28	 60000.00	IT	      2024-05-01	123 Main St, New York
-- 1002	       Binay	45	 80000.00	HR	      2020-07-15	456 Elm St, Chicago
-- 1003	       Charlie	32	 55000.00	Finance	  2022-01-10	789 Oak St, Los Angeles
-- 1004	       Dhruv	38	 75000.00	HR	      2021-10-30	101 Pine St, New York
-- c. LIKE → Find employees whose names start with 'A'.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Name LIKE 'A%';

-- Output
-- Name
-- Ashish

-- d. IS NULL → List employees whose address is not available.
-- WRITE YOUR QUERY BELOW
SELECT * FROM Employees
WHERE Address IS NULL;



-- ========================
-- Exercise 5: Set Operators
-- ========================

-- NOTE: For these, assume you have two Employee tables (Employees2022 and Employees2023).
CREATE TABLE Employees_2022 AS
SELECT EmployeeID, Name, Department FROM Employees;

CREATE TABLE Employees_2023 AS
SELECT EmployeeID, Name, Department FROM Employees
WHERE EmployeeID IN (1001, 1002, 1003); 

-- a. UNION → Retrieve employees from 'HR' department in 2023 and 2022.
-- WRITE YOUR QUERY BELOW
SELECT Name, Age
FROM Employees_2023
WHERE Department='HR'
UNION
SELECT Name,Age
FROM Employees_2022
WHERE Department='HR';

-- b. INTERSECT → Find common employees in 'IT' department across 2022 & 2023.
-- (MySQL doesn’t have INTERSECT directly – use INNER JOIN / EXISTS workaround)
-- WRITE YOUR QUERY BELOW
SELECT Name 
FROM Employees_2023
WHERE Department='IT'
INTERSECT 
SELECT Name
FROM Employees_2023
WHERE Department='IT';

-- c. EXCEPT → Find employees who worked in 2023 but not in 2022.
-- (MySQL doesn’t have EXCEPT directly – use LEFT JOIN / NOT EXISTS workaround)
-- WRITE YOUR QUERY BELOW
SELECT Name 
FROM Employees_2023
EXCEPT
SELECT Name
FROM Employees_2022

-- ======================================================================
-- END OF EXPERIMENT 04
-- ======================================================================