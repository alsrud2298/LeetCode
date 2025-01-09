# id가 홀수이고 이름이 M으로 시작하지 않는 직원 -> 월급의 100%
# 아니라면, 0원

SELECT employee_id
    , CASE WHEN MOD(employee_id,2) = 1 AND LEFT(name,1) != 'M' THEN salary
        ELSE 0 END bonus
FROM Employees
ORDER BY 1
