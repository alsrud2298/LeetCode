# Write your MySQL query statement below
# 각 sales_id 당 제품 이름, 년도, 가격 보고 
SELECT p.product_name, s.year, s.price
FROM Sales as s
    INNER JOIN Product p ON s.product_id = p.product_id