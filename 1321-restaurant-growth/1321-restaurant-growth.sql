-- WINDOW 절 FRAME 절로 Rolling 평균 계산

SELECT DISTINCT visited_on,
    SUM(amount) OVER w as amount, -- 합계
    ROUND((SUM(amount) OVER w)/7,2) as average_amount -- 매출 평균
FROM Customer
    WINDOW w AS (
        ORDER BY visited_on
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW -- 현재 행 + 6일 이전 행에 대해서 
    )
LIMIT 6,999