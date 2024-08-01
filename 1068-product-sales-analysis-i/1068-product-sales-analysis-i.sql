# Write your MySQL query statement below
# 각 sales_id 당 제품 이름, 년도, 가격 보고 
SELECT p.product_name, s.year, s.price
FROM Product as p , Sales as s
WHERE p.product_id = s.product_id