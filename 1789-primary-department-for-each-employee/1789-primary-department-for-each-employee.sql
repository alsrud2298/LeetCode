# 한 부서에만 속한 경우 - primary = 'N'
# 모든 employee들의 primary department 추출하기

# 1. employee 별 속한 부서 수 구하는 서브쿼리 
# 2. 부서 수 = 1 또는 primary_flag = 'Y'인 emp_id, dep_id 추출

SELECT employee_id
    , department_id
FROM Employee
WHERE primary_flag = 'Y' OR
    employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(DISTINCT department_id) = 1
    )