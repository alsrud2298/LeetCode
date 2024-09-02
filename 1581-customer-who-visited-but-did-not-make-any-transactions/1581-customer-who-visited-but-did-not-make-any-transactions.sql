# 거래 기록이 없는 방문자의 id와 방문 수 추출
# 1. visited_id 에는 있지만 transaction_id 에는 없는 customer_id 추출
# 2. customer_id 별 방문 횟수 구하기

SELECT DISTINCT customer_id, COUNT(*) as count_no_trans
FROM Visits
WHERE visit_id NOT IN (
    SELECT visit_id
    FROM Transactions )
GROUP BY customer_id