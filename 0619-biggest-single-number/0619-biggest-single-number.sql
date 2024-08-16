# 가장 큰 single number 출력
# num 별 COUNT = 1 인 값만 추출하는 서브쿼리 말아두기 -> 최대값만 추출

SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) as single_numbers


