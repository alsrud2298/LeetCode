# manager : 최소 1명의 employee에게 reporting 받는 employee

# 1. manager 당 보고받는 employee 정보 테이블 생성 (INNER JOIN)
# 2. e1.employee_id 로 그룹화 & 보고하는 employee수, 평균 나이 추출
# 3. ORDER BY employee_id

SELECT mgr.employee_id
    , mgr.name
    , COUNT(emp.employee_id) as reports_count
    , ROUND(AVG(emp.age),0) as average_age
FROM Employees mgr
    JOIN Employees emp
        ON mgr.employee_id = emp.reports_to
GROUP BY employee_id
ORDER BY employee_id