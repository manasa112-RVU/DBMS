-- ======================================================================
-- Lab Experiment – Implementation of Procedures in SQL
-- ======================================================================

-- Objective:
-- 1. To understand and create stored procedures in MySQL.
-- 2. To implement procedures for performing INSERT, UPDATE, and DELETE operations.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- ======================================================================
-- Step 2: Create Table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- OUTPUT:
-- (Run DESC Employees; to verify structure)
-- WRITE YOUR OUTPUT BELOW



-- ======================================================================
-- Step 3: Insert Sample Data
INSERT INTO Employees (EmpName, Department, Salary) VALUES
('John', 'IT', 55000),
('Alice', 'HR', 48000),
('Bob', 'Finance', 60000);

-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify data)
-- WRITE YOUR OUTPUT BELOW
SELECT * from Employees;
-- ======================================================================
-- Task 1: Create a Basic Procedure
-- Create a procedure named `DisplayEmployees` that retrieves all records from the Employees table.
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //
CREATE PROCEDURE DisplayEmployees()
BEGIN
  SELECT * FROM Employees;
END //
DELIMITER ;

-- CALL DisplayEmployees();
-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
-- EmpID  EmpName  Department  Salary
-- 1      John      IT         55000.00
-- 2      Alice     HR         48000.00
-- 3      Bob       Finanace   60000.00


-- ======================================================================
-- Task 2: Procedure for INSERT Operation
-- Create a procedure named `AddEmployee` that inserts a new employee record.
-- Parameters: (p_name VARCHAR(50), p_dept VARCHAR(50), p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //

CREATE PROCEDURE AddEmployee (
    IN p_name VARCHAR(50),
    IN p_dept VARCHAR(50),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employees (emp_name, emp_dept, emp_salary)
    VALUES (p_name, p_dept, p_salary);
END //

DELIMITER ;

-- CALL AddEmployee('David', 'Marketing', 52000);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify insertion)
-- WRITE YOUR OUTPUT BELOW

-- ======================================================================
-- Task 3: Procedure for UPDATE Operation
-- Create a procedure named `UpdateSalary` to update an employee’s salary based on EmpID.
-- Parameters: (p_empid INT, p_salary DECIMAL(10,2))
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW


-- CALL UpdateSalary(2, 50000);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify update)
-- WRITE YOUR OUTPUT BELOW

DELIMITER //

CREATE PROCEDURE UpdateSalary (
    IN p_empid INT,
    IN p_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET emp_salary = p_salary
    WHERE emp_id = p_empid;
END //

DELIMITER ;
CALL UpdateSalary(2, 50000);

SELECT * FROM Employees;

-- ======================================================================
-- Task 4: Procedure for DELETE Operation
-- Create a procedure named `RemoveEmployee` to delete an employee record based on EmpID.
-- Parameters: (p_empid INT)
-- WRITE YOUR PROCEDURE CREATION QUERY BELOW
DELIMITER //

CREATE PROCEDURE RemoveEmployee (
    IN p_empid INT
)
BEGIN
    DELETE FROM Employees
    WHERE emp_id = p_empid;
END //

DELIMITER ;


CALL RemoveEmployee(3);
-- OUTPUT:
-- (Run SELECT * FROM Employees; to verify deletion)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Employees;
-- ======================================================================
-- END OF EXPERIMENT – Implementation of Procedures
-- ======================================================================