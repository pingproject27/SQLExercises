-- 584. Find Customer Referee
-- Find the names of the customer that are not referred by the customer with id = 2.
-- Difficulty: Easy

SELECT name
FROM Customer
WHERE referee_id <> 2
or referee_id is null

-- 1757. Recyclable and Low Fat Products
-- Write a solution to find the ids of products that are both low fat and recyclable.
-- Difficulty: Easy

SELECT product_id
FROM Products
WHERE low_fats = 'Y'
AND recyclable = 'Y'

-- 1683. Invalid Tweets
-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
-- Difficulty: Easy

SELECT tweet_id
FROM Tweets
WHERE length(content) > 15

-- 1148. Article Views I
-- Write a solution to find all the authors that viewed at least one of their own articles.
-- Return the result table sorted by id in ascending order.
-- Difficulty: Easy

SELECT distinct author_id id
FROM Views
WHERE author_id=viewer_id
ORDER BY 1 ASC


-- 595. Big Countries
-- A country is big if:
-- it has an area of at least three million (i.e., 3000000 km2), or
-- it has a population of at least twenty-five million (i.e., 25000000).
-- Write a solution to find the name, population, and area of the big countries.
-- Difficulty: Easy

SELECT name, population, area
FROM World
WHERE area >= 3000000
OR population >= 25000000
