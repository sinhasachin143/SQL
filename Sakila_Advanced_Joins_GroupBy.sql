
-- Question 13: Display the top 5 rented movies along with the number of times they've been rented.
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY rental_count DESC
LIMIT 5;

-- Question 14: Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;
