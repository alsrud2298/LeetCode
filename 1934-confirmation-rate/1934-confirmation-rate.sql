-- (복습)confirmed rate 구하기
-- 1. Signups 테이블에 Confirmations 테이블 LEFT JOIN
-- 2. user_id 별 confirmed 비율 구하기

SELECT s.user_id,
    ROUND(AVG(IF(c.action = 'confirmed',1,0)),2) as confirmation_rate
FROM Signups as s
    LEFT JOIN Confirmations as c
    ON s.user_id = c.user_id
GROUP BY s.user_id

--  1. IFNULL(AVG()) → 0/0 = null이므로 따로 널값 처리해야해서 시간이 오래 걸림
-- 2. AVG(IF()) → AVG(0) = 0 이므로 따로 null값을 대체하지 않아도 됨