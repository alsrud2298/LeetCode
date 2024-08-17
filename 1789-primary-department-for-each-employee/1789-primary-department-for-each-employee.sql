# 한 부서에만 속한 경우 - primary = 'N'
# 모든 employee들의 primary department 추출하기

# 1. employee 별 속한 부서 수 구하는 가상 테이블 생성
# 2. 부서 수 = 1 또는 primary_flag = 'Y'인 emp_id, dep_id 추출
WITH Department AS (
    SELECT employee_id
        , COUNT(DISTINCT department_id) as dep_cnt
    FROM Employee
    GROUP BY employee_id
)


SELECT emp.employee_id
    , emp.department_id
FROM Employee emp
    LEFT JOIN Department dep
        ON emp.employee_id = dep.employee_id
WHERE dep_cnt = 1 OR primary_flag = 'Y'