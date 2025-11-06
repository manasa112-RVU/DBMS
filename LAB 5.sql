-- ======================================================================
-- Lab Experiment 05 - SQL Joins
-- ======================================================================

-- Objective:
-- To understand the concept of SQL joins and their applications in relational databases.
-- To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS Lab05_Joins;
CREATE DATABASE Lab05_Joins;
USE Lab05_Joins;

-- Step 2: Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(50),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Step 3: Insert Sample Data
INSERT INTO Customers (customer_id, customer_name, city) VALUES
(5, 'A', 'Bangalore'),
(6, 'B', 'Delhi'),
(7, 'C', 'Mumbai'),
(8, 'D', 'Chennai');

INSERT INTO Orders (order_id, customer_id, product_name, order_date) VALUES
(105, 5, 'Laptop', '2023-12-15'),
(106, 6, 'Smartphone', '2024-01-10'),
(107, 7, 'Headphones', '2024-02-20'),
(108, 8, 'Tablet', '2024-03-05');


-- ======================================================================
-- LAB TASKS
-- ======================================================================

-- 1. INNER JOIN
-- Purpose: Returns rows that have matching values in both tables.
-- Task: Find all orders placed by customers from the city "Bangalore".
-- WRITE YOUR QUERY BELOW
SELECT c.customer_name, o.order_id, o.order_date
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE c.city = 'Bangalore';




-- 2. LEFT OUTER JOIN
-- Purpose: Returns all rows from the left table, even if there are no matches in the right table.
-- Task: Find all customers and their orders, even if a customer has no orders.
-- WRITE YOUR QUERY BELOW

select c.customer_name, o.order_id, o.order_date
FROM Customers c
left outer join Orders o on c.customer_id = o.customer_id;



-- 3. RIGHT OUTER JOIN
-- Purpose: Returns all rows from the right table, even if there are no matches in the left table.
-- Task: Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
-- WRITE YOUR QUERY BELOW
select c.customer_name, o.order_id, o.order_date
FROM Customers c
right outer join orders o on c.customer_id=o.customer_id;


-- 4. FULL OUTER JOIN
-- Purpose: Returns all rows when there is a match in either left or right table.
-- Task: Find all customers and their orders, including those customers with no orders and orders without a customer.
-- NOTE: MySQL does not directly support FULL OUTER JOIN.
-- WRITE YOUR QUERY BELOW (Hint: Use UNION of LEFT JOIN and RIGHT JOIN)
select c.customer_name, o.order_id, o.order_date
from Customers c
left join Orders o ON c.customer_id = o.customer_id
union
select c.customer_name, o.order_id, o.order_date
from Customers c
right join Orders o ON c.customer_id = o.customer_id;



-- 5. NATURAL JOIN
-- Purpose: Similar to an inner join, but automatically joins on columns with the same name in both tables.
-- Task: Assume Customers and Orders have common column customer_id. Find all orders placed by customers.
-- WRITE YOUR QUERY BELOW

select * from Customers natural join Orders;
