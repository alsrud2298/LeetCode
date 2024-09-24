-- (복습) 각 부서 별 top 3 earners 추출
-- 1. 부서별, salary별 rank 매기기
-- 2. rank <= 3 인 사람만 추출
SELECT d.name as Department,
    rnk_tbl.name as Employee,
    rnk_tbl.salary as Salary
FROM(
    SELECT departmentId,
    name,
    salary,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as rnk
    FROM Employee) as rnk_tbl
INNER JOIN Department d
    ON d.id = rnk_tbl.departmentId
WHERE rnk <= 3
