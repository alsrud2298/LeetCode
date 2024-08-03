# Write your MySQL query statement below
# 전날보다 기온이 높은 날의 id 찾기

SELECT id
FROM Weather w1
WHERE temperature > (
    SELECT temperature
    FROM Weather w2
    WHERE w2.recordDate = DATE_SUB(w1.recordDate, INTERVAL 1 DAY)
)