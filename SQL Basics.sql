
-- Q1. Create a table called employees with the following structure:
-- • emp_id (integer, should not be NULL and should be a primary key).
-- • emp_name (text, should not be NULL).
-- • age (integer, should have a check constraint to ensure the age is at least 18).
-- • email (text, should be unique for each employee).
-- • salary (decimal, with a default value of 30,000).
-- Write the SQL query to create the above table with all constraints.

CREATE TABLE employees (
    emp_id INT PRIMARY KEY NOT NULL,
    emp_name TEXT NOT NULL,
    age INT CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL DEFAULT 30000
);


-- Q2. Explain the purpose of constraints and how they help maintain data integrity in a database.
-- Provide examples of common types of constraints.

-- Constraints ensure data integrity by enforcing rules on the data in a table.
-- Examples:
-- - PRIMARY KEY: Ensures each row is unique.
-- - NOT NULL: Prevents missing data.
-- - UNIQUE: Prevents duplicate entries.
-- - CHECK: Validates data against a condition.
-- - DEFAULT: Provides a default value when none is supplied.
-- - FOREIGN KEY: Maintains referential integrity between tables.


-- Q3. Why would you apply the NOT NULL constraint to a column?
-- Can a primary key contain NULL values? Justify your answer.

-- NOT NULL ensures that data must be entered for the column.
-- A PRIMARY KEY cannot contain NULL values because it must uniquely identify each record.
-- Therefore, it implicitly includes NOT NULL.


-- Q4. Explain the steps and SQL commands used to add or remove constraints on an existing table.
-- Provide an example for both adding and removing a constraint.

-- Add a primary key constraint:
ALTER TABLE products ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- Remove a primary key constraint:
ALTER TABLE products DROP CONSTRAINT pk_product_id;


-- Q5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
-- Provide an example of an error message that might occur when violating a constraint.

-- If a constraint is violated, an error is thrown and the operation fails.
-- Example:
-- INSERT INTO employees (emp_id, emp_name, age, email, salary)
-- VALUES (1, NULL, 17, 'a@example.com', 20000);
-- Error: null value in column "emp_name" violates not-null constraint


-- Q6. You created a products table without constraints:
-- CREATE TABLE products (
--     product_id INT,
--     product_name VARCHAR(50),
--     price DECIMAL(10, 2));
-- Now, you realize that:
-- • The product_id should be a primary key.
-- • The price should have a default value of 50.00

-- Solution:
ALTER TABLE products ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);
ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;


-- Q7. You have two tables Students and Classes.
-- Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

SELECT s.student_name, c.class_name
FROM Students s
INNER JOIN Classes c ON s.class_id = c.class_id;


-- Q8. Consider the following three tables: Orders, Customers, Products.
-- Write a query that shows all order_id, customer_name, and product_name,
-- ensuring that all products are listed even if they are not associated with an order.

SELECT o.order_id, c.customer_name, p.product_name
FROM Products p
LEFT JOIN Orders o ON p.order_id = o.order_id
LEFT JOIN Customers c ON o.customer_id = c.customer_id;


-- Q9. Given the following tables: Sales, Products.
-- Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

SELECT p.product_name, SUM(s.amount) AS total_sales
FROM Sales s
INNER JOIN Products p ON s.product_id = p.product_id
GROUP BY p.product_name;


-- Q10. You are given three tables: Orders, Customers, Order_Details.
-- Write a query to display the order_id, customer_name, and the quantity of products ordered
-- by each customer using an INNER JOIN between all three tables.

SELECT o.order_id, c.customer_name, od.quantity
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
INNER JOIN Order_Details od ON o.order_id = od.order_id;
