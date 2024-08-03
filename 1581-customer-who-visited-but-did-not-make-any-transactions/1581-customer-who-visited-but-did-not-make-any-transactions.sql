# Write your MySQL query statement below
# 방문했지만, 아무 거래도 하지 않은 고객
SELECT customer_id, count(visit_id) as count_no_trans
FROM Visits
WHERE visit_id NOT IN (
    SELECT DISTINCT visit_id
    FROM Transactions
)
GROUP BY 1