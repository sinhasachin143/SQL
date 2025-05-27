
# SQL Assignments – Maven Movies Project

This README contains the structure, purpose, and linked files for the SQL assignments related to the **Maven Movies** database project.

---

##  1. SQL Basics
Includes table creation, constraint explanation, altering constraints, and joins.
- Covers Questions: Q1 to Q10
-  File: `SQL_Assignment_Complete.sql`

---

##  2. SQL Commands on Maven Movies
Basic SQL operations and filters on the MavenMovies dataset.
- Covers Questions: Q1 to Q23
-  File: `SQL_Commands.sql`

---

##  3. Functions Assignment
Uses aggregate functions, string functions, and `GROUP BY`.
- Covers Questions: Q1 to Q8
-  File: `Basic Aggregate Functions.sql`

---

##  4. Joins Assignment
Demonstrates use of `JOIN`, including customer, rental, inventory, and film.
- Covers Questions: Q9 to Q12
-  File: `Joins_Only.sql`

---

##  5. Advanced Joins & GROUP BY
Top rentals and logic involving multiple store rentals.
- Covers Questions: Q13 to Q14
-  File: `Advanced_Joins_GroupBy.sql`

---

##  6. Window Functions
Ranking, cumulative totals, partitions, and NTILE.
- Covers Questions: Q1 to Q10
-  File: `Windows_Functions.sql`

---

##  7. Normalisation & CTE Assignment
Includes theoretical answers for 1NF–3NF and CTE-based queries.
- Covers Questions: Q1 to Q12
-  File: `Normalisation_and_CTE_Assignment.sql`

---

##  Dataset Used
All queries are written against the Maven Movies dataset.

-  File: `Mavenmovies.sql`
-  Alternative: [Google Drive Link](https://drive.google.com/file/d/1l7gu75mzxL6Pl_b8DrFBvOneio2z5_Fx/view?usp=drive_link)

---

##  Instructions

1. Import the dataset into MySQL using:
   ```bash
   mysql -u root -p < Mavenmovies.sql
   ```

2. Run each assignment script using:
   ```sql
   USE mavenmovies;
   SOURCE path_to_sql_file.sql;
   ```

3. Check output and validate queries against expected results.

---

## 🏁 Final Notes

- Each SQL file is modular and can be run independently.
- For recursive queries, a sample fallback (like number generation) is used where schema limitations exist.
- Make sure your database supports CTEs and window functions (MySQL 8+).

---

Sachin Sinha
