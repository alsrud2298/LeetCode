# (복습) 매일 팔린 제품 종류와 이름 출력

SELECT sell_date
    , COUNT(DISTINCT product) as num_sold
    , GROUP_CONCAT(DISTINCT product ORDER BY product separator ',' ) as products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date