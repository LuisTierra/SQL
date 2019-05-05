-- Selecting Database and showing Actor Table
USE sakila;
SELECT  * FROM actor;

-- Showing specific columns
SELECT first_name, last_name
FROM actor;

-- Concattenating previous columns into one
SELECT concat(first_name, " ", last_name) AS Actor_Name
from actor;

--  Query for finding specific values
SELECT * FROM actor WHERE first_name = 'Joe';

--  Finding all actors whose last name contain the letters 'GEN'
SELECT * FROM actor
WHERE last_name like '%GEN%';

-- Finding all actors whose last name contain the letters 'LI'
-- and ordering the rows by last name and first name
SELECT actor_id, last_name, first_name FROM actor
WHERE last_name like '%LI%';

-- Using IN, display the country_id and country columns 
SELECT country_id, country FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

--  Create a column in the table actor named description and use the data type BLOB
ALTER TABLE actor
ADD description BLOB(50);

-- Delete the description column
ALTER TABLE actor
DROP COLUMN description;

-- 4a. List the last names of actors, as well as how many actors have that last name.
SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

-- 4b. List last names of actors and the number of actors who have that last name, 
-- but only for names that are shared by at least two actors


-- 4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. 
-- Write a query to fix the record.
SELECT 
    actor_id, first_name, last_name
FROM
    actor
WHERE
    first_name = 'harpo' and last_name = 'williams';
    
UPDATE actor
SET 
    first_name = 'HARPO'
WHERE
    actor_id = 172;

-- 4d. In a single query, if the first name of the actor is currently HARPO, 
-- change it to GROUCHO.
ROLLBACK;

-- 5a. You cannot locate the schema of the address table.
-- Which query would you use to re-create it?
SHOW CREATE TABLE address;

-- 6a. Use JOIN to display the first and last names, 
-- as well as the address, of each staff member. 
-- Use the tables staff and address:
SELECT first_name, last_name, address
FROM staff
INNER JOIN address ON 
address.address_id = staff.address_id;


