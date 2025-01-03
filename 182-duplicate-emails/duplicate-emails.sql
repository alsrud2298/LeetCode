# Write your MySQL query statement below

SELECT email Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1
