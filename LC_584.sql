-- 584. Find Customer Referee
-- Find the names of the customer that are not referred by the customer with id = 2.
-- Difficulty: Easy

SELECT name
FROM Customer
WHERE referee_id <> 2
or referee_id is null
