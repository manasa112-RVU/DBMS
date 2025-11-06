-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Manasa S
-- USN: 1RUA24SCS0057
-- SECTION: 'A'
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- root@localhost Manasa 8.0.34 2025-09-29 09:49:07

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);
INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
select * from Employees;
select * from orders;


-- Output: 
-- EmployeeID FirstName LastName   Salary      BirthDate    HireDate
-- 1            John     Doe       55000.30    1985-06-15   2010-01-20
-- 2            Jane     Smith     65000.50    1990-08-22   2012-07-10
-- 3            Alice    Johnson   72000.10    1982-11-30   2015-05-25
-- 4            Bob      Brown     48000.90    1978-03-12   2018-09-15

-- OrderID  OrderDate  TotalAmount  EmployeeID
-- 1        2024-07-15   250.00        1
-- 2        2024-08-10   175.50        2
-- 3        2024-09-01   300.00        3
-- 4        2024-09-10   450.75        1
-- 5        2024-08-25   123.40        4
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT ROUND(Salary, 0) AS RoundedSalary FROM Employees;

-- Output: 
-- RoundedSalary
-- 55000
-- 65001
-- 72000
-- 48001

/* b. Absolute Values: Show absolute values of salaries */
SELECT ABS(Salary) as AbsoluteSalary from Employees;
-- Output: 
-- AbsoluteSalary
-- 55000.30
-- 65000.50
-- 72000.10
-- 48000.90

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT ceil(TotalAmount) as OrderAmount from Orders;
-- Output: 
-- OrderAmount
-- 250
-- 176
-- 300
-- 451
-- 124
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT count(EmployeeID) as TotalEmployees from Employees;
-- Output: 
-- TotalEmployees
-- 8
/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) as ToatalSalary from Employees;
-- Output: 
-- TotalSalary
-- 240001.8
/* c. Average Order Amount: Find average order value */
SELECT AVG(OrderAmount) as AverageOrderValue from Employees;
-- Output: 
-- AverageOrderValue
-- 259.930000
/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary) AS HighestSalary from Employees;
SELECT MIN(Salary) AS LowestSalary from Employees;
-- Output: 
-- HighestSalary
-- 72000.10
-- LowestSalary
-- 48000.90
-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT UPPER(FirstName) as Uppercase from Employees;
SELECT LOWER(LastName) as Lowercase from Employees;
-- Output: 
-- Uppercase
-- JOHN
-- JANE
-- ALICE
-- BOB
-- Lowercase
-- doe
-- smith
-- johnson
-- brown
/* b. Concatenate Names: Create full names */
SELECT CONCAT(FirstName,' ',LastName) as FullNames from Employees;
-- Output: 
-- FullNames
-- John Doe
-- Jane Smith
-- Alice Johnson
-- Bob Brown
/* c. Extract Substring: Get first 3 characters of first names */
SELECT SUBSTRING(FirstName,1,3) as 3Character from Employees;
-- Output: 
-- 3Character
-- Joh
-- Jan
-- Ali
-- Bob
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT EmployeeID, FirstName, LastName,
       STR_TO_DATE(BirthDate, '%Y-%m-%d') AS ConvertedBirthDate,
       STR_TO_DATE(HireDate, '%Y-%m-%d')  AS ConvertedHireDate
FROM Employees;

-- Output: 
-- ConvertedBirthDate  ConvertedHireDate
-- 1985-05-15           2010-01-20
-- 1910-08-22           2012-07-10
-- 1982-11-30           2015-05-25
-- 1978-03-12           2018-09-15
-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() as CurrentDateTime;
-- Output: 
-- CurrentDateTime
-- 2025-09-29 10:47:55
/* b. Extract Year: Get year from order dates */
SELECT OrderID, OrderDate, YEAR(OrderDate) AS OrderYear FROM Orders;
-- Output: 
-- OrderYear
-- 2024
-- 2024
-- 2024
-- 2024
-- 2024
/* c. Add Months: Add 3 months to order dates */
SELECT OrderID, OrderDate, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS NewOrderDate FROM Orders;
-- Output: 
-- NewOrderDate
-- 2024-10-15
-- 2024-11-10
-- 2024-12-01
-- 2024-12-10
-- 2024-11-25
/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, OrderDate, DATEDIFF(NOW(), OrderDate) AS DaysSinceOrder FROM Orders;
-- Output: 
-- DaysinceOrder
-- 441
-- 415
-- 393
-- 384
-- 400
-- 
-- 

-- END of the Task -- 