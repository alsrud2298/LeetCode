# 각 product_id 당 평균 selling price 찾기
# average selling price : sum(units * price) / total units

-- 1. 조인 조건 : product_id, purchase_date가 start,end date 내에 포함될 것
-- 2. Price 테이블에 있는 product가 판매되지 않은 경우도 고려해야함.

SELECT p.product_id, IFNULL(ROUND(SUM(p.price*s.units)/SUM(s.units),2),0) as average_price
FROM Prices p 
    LEFT JOIN UnitsSold s
        ON p.product_id = s.product_id 
        AND s.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY product_id