# 각 project_id 당 모든 employee 들의 average experience years 구하기
-- 1. 두 테이블 LEFT JOIN ON employee_id
-- 2. AVG(exp_years) 계산

SELECT *
FROM Project p
    LEFT JOIN Employee e
        ON p.employee_id = e.employee_id