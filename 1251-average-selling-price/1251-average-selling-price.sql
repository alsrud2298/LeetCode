# 각 product_id 당 평균 selling price 찾기
# average selling price : sum(units * price) / total units

-- 1. 조인 조건 : product_id, purchase_date가 start,end date 내에 포함될 것

SELECT p.product_id, IFNULL(ROUND(SUM(p.price*s.units)/SUM(s.units),2),0) as average_price
FROM Prices p 
    LEFT JOIN UnitsSold s
        ON p.product_id = s.product_id 
        AND s.purchase_date >= p.start_date AND s.purchase_date <= p.end_date
GROUP BY product_id