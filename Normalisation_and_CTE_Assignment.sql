
-- Normalisation & CTE Assignment

-- Q1: First Normal Form (1NF)
-- Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
-- Answer:
-- A table that violates 1NF may have repeating groups. For example, if a table stores multiple phone numbers in one field.
-- To normalize it to 1NF, we can separate phone numbers into a new table with one number per row, referencing the main table.

-- Q2: Second Normal Form (2NF)
-- Choose a table in Sakila and describe how you would determine whether it is in 2NF.
-- If it violates 2NF, explain the steps to normalize it.
-- Answer:
-- A table violates 2NF if it has partial dependencies. For example, if a composite key exists and non-key attributes depend only on part of the key.
-- To normalize it, remove partial dependencies by placing dependent attributes in a separate table with appropriate foreign keys.

-- Q3: Third Normal Form (3NF)
-- Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
-- Answer:
-- A table violates 3NF if non-key attributes depend on other non-key attributes.
-- To normalize, remove transitive dependencies by creating new tables for those non-key dependencies and use foreign keys for linkage.

-- Q4: Normalization Process
-- Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
-- Answer:
-- Example: Suppose a rental log includes customer info, rental info, and film info in a single table.
-- Step 1: Separate customer info into a 'customer' table.
-- Step 2: Separate film info into a 'film' table.
-- Step 3: Keep rental info in 'rental' table with foreign keys to both 'customer' and 'film' tables.
-- This satisfies up to 2NF and ensures logical data organization.

-- Q5: CTE Basics - Distinct actor names and number of films acted in
WITH ActorFilmCount AS (
    SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id
)
SELECT * FROM ActorFilmCount;

-- Q6: CTE with Joins - Combine film and language tables
WITH FilmLanguage AS (
    SELECT f.title, l.name AS language, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM FilmLanguage;

-- Q7: CTE for Aggregation - Total revenue per customer
WITH CustomerRevenue AS (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
)
SELECT * FROM CustomerRevenue;

-- Q8: CTE with Window Functions - Rank films by rental duration
WITH RankedFilms AS (
    SELECT film_id, title, rental_duration,
           RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM film
)
SELECT * FROM RankedFilms;

-- Q9: CTE with Filtering - List customers with more than 20 rentals
WITH RentalCount AS (
    SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id
)
SELECT * FROM RentalCount
WHERE total_rentals > 20;

-- Q10: CTE for Date Calculations - Rentals per month
WITH MonthlyRentals AS (
    SELECT DATE_FORMAT(rental_date, '%Y-%m') AS rental_month, COUNT(*) AS rental_count
    FROM rental
    GROUP BY rental_month
)
SELECT * FROM MonthlyRentals;

-- Q11: CTE and Self-Join - Actors who acted together
WITH ActorPairs AS (
    SELECT a1.actor_id AS actor1, a2.actor_id AS actor2, fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
    JOIN actor a1 ON fa1.actor_id = a1.actor_id
    JOIN actor a2 ON fa2.actor_id = a2.actor_id
)
SELECT actor1, actor2, film_id FROM ActorPairs;

-- Q12: Recursive CTE Example (simulation)
-- Since staff.reports_to does not exist, simulate recursion with numbers
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 5
)
SELECT * FROM Numbers;
