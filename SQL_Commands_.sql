USE mavenmovies;
-- Q1. Identify the primary keys and foreign keys in maven movies db.
-- (This is typically answered by reviewing schema, but here’s an example)
-- Example: 
-- PRIMARY KEY: actor_id in actors table
-- FOREIGN KEY: film_id in film_actor referencing films

-- Q2. List all details of actors
SELECT * FROM actor;

-- Q3. List all customer information from DB
SELECT * FROM customer;

-- Q4. List different countries
SELECT DISTINCT country FROM country;

-- Q5. Display all active customers
SELECT * FROM customer WHERE active = 1;

-- Q6. List of all rental IDs for customer with ID 1
SELECT rental_id FROM rental WHERE customer_id = 1;

-- Q7. Display all the films whose rental duration is greater than 5
SELECT * FROM film WHERE rental_duration > 5;

-- Q8. List the total number of films whose replacement cost is greater than $15 and less than $20
SELECT COUNT(*) FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

-- Q9. Display the count of unique first names of actors
SELECT COUNT(DISTINCT first_name) FROM actor;

-- Q10. Display the first 10 records from the customer table
SELECT * FROM customer LIMIT 10;

-- Q11. Display the first 3 records from the customer table whose first name starts with ‘b’
SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;

-- Q12. Display the names of the first 5 movies which are rated as ‘G’
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

-- Q13. Find all customers whose first name starts with "a"
SELECT * FROM customer WHERE first_name LIKE 'A%';

-- Q14. Find all customers whose first name ends with "a"
SELECT * FROM customer WHERE first_name LIKE '%a';

-- Q15. Display the list of first 4 cities which start and end with ‘a’
SELECT * FROM city WHERE city LIKE 'a%a' LIMIT 4;

-- Q16. Find all customers whose first name has "NI" in any position
SELECT * FROM customer WHERE first_name LIKE '%NI%';

-- Q17. Find all customers whose first name have "r" in the second position
SELECT * FROM customer WHERE first_name LIKE '_r%';

-- Q18. Find all customers whose first name starts with "a" and are at least 5 characters in length
SELECT * FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

-- Q19. Find all customers whose first name starts with "a" and ends with "o"
SELECT * FROM customer WHERE first_name LIKE 'A%o';

-- Q20. Get the films with pg and pg-13 rating using IN operator
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

-- Q21. Get the films with length between 50 to 100 using between operator
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- Q22. Get the top 50 actors using limit operator
SELECT * FROM actor LIMIT 50;

-- Q23. Get the distinct film IDs from inventory table
SELECT DISTINCT film_id FROM inventory;
