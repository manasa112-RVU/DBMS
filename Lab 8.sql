-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- OUTPUT:
-- (After creating tables, run DESC Patients; and DESC Visits; to verify structure.)
-- WRITE YOUR OUTPUT BELOW

DESC Patients;
DESC Visits;

-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.
-- Add at least 5 patients and 8–10 visit records with varying diagnoses and treatment costs.
-- WRITE YOUR QUERIES BELOW
-- Step 3: Insert Sample Data

INSERT INTO Patients (patient_name, age, gender)
VALUES
('John Doe', 39, 'Male'),
('Maria Gonzalez', 32, 'Female'),
('David Lee', 46, 'Male'),
('Aisha Khan', 25, 'Female'),
('Robert Smith', 60, 'Male');

INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost)
VALUES
(1, '2024-01-15', 101, 'Flu', 120.00),
(1, '2024-03-22', 102, 'Allergy', 90.00),
(2, '2024-02-10', 103, 'Sprained ankle', 250.00),
(2, '2024-05-18', 101, 'Migraine', 180.00),
(3, '2024-04-07', 104, 'High blood pressure', 300.00),
(3, '2024-09-12', 102, 'Diabetes checkup', 220.00),
(4, '2024-06-25', 103, 'Stomach pain', 200.00),
(4, '2024-08-05', 104, 'Skin rash', 75.00),
(5, '2024-03-30', 101, 'Back pain', 260.00),
(5, '2024-10-14', 102, 'Routine check-up', 100.00);

-- OUTPUT:
-- (Run SELECT * FROM Patients; and SELECT * FROM Visits; to verify inserted data.)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM Patients;
SELECT * FROM Visits;


-- ======================================================================
-- QUICK INTRODUCTION (for notes)
-- GROUP BY: Groups rows sharing a value and performs aggregate functions like SUM(), COUNT(), AVG().
-- HAVING: Filters grouped data after aggregation.
-- ORDER BY: Sorts query results (ASC by default, DESC for descending order).
-- INDEXING: Improves query performance by creating a quick lookup on key columns.

-- ======================================================================
-- STUDENT ACTIVITY TASKS
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis,AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis;




-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
-- diagnosis             avg_cost
-- Flu                    120.000000
-- Allergy                90.000000
-- Sprained ankle         250.000000
-- Migraine               180.000000
-- High blood pressure    300.000000
-- Diabetes checkup       220.000000
-- Stomach pain           200.000000
-- Skin rash              75.000000
-- Back pain              260.000000
-- Routine check-up       100.000000

-- ======================================================================
-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis,AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
-- diagnosis             avg_cost
-- Sprained ankle        250.000000
-- High blood pressure   300.000000
-- Diabetes checkup      220.000000
-- Back pain             260.000000

-- ======================================================================
-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis,AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_cost DESC;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
-- diagnosis              avg_cost
-- High blood pressure    75.000000
-- Back pain              90.000000
-- Sprained ankle         100.000000
-- Diabetes checkup       250.000000
-- Stomach pain           120.000000
-- Migraine               180.000000
-- Flu                    200.000000
-- Routine check-up       220.000000
-- Allergy                250.000000
-- Skin rash              250.000000

-- ======================================================================
-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.
-- Then run a query that retrieves all visits for a particular patient.
-- WRITE YOUR QUERIES BELOW
CREATE INDEX idx_patient_id ON Visits(patient_id);
SHOW INDEX FROM Visits;
SELECT 
    visit_id,
    patient_id,
    visit_date,
    doctor_id,
    diagnosis,
    treatment_cost
FROM Visits
WHERE patient_id = 3;


-- OUTPUT:
-- (Verify index creation using SHOW INDEX FROM Visits;)
-- WRITE YOUR OUTPUT BELOW

SELECT * FROM Visits;

-- ======================================================================
-- END OF EXPERIMENT
-- ======================================================================