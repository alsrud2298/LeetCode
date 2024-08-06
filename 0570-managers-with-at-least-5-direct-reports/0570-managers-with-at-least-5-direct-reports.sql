# Write your MySQL query statement below
# 최소 5명의 담당이 있는 매니저 찾기

SELECT e1.name
FROM Employee e1
    INNER JOIN (
    SELECT managerId, COUNT(managerId) as emp_num
    FROM Employee
    GROUP BY managerId
    ) e2 ON e1.id = e2.managerId
WHERE e2.emp_num >= 5