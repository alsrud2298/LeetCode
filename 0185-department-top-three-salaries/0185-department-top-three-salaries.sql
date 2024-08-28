# 각 부서에서 월급이 많은 top 3 추출 
# rank 중복 허용 -> DENSE_RANK()
SELECT Department, Employee, Salary
FROM (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
    ) as rnk_tbl
WHERE rnk <= 3

