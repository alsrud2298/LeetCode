# 2019년 1분기에만 팔린 상품 목록 추출
SELECT product_id
    , product_name
FROM Product
WHERE product_id IN (
    SELECT DISTINCT product_id
    FROM Sales s
    GROUP BY product_id
    HAVING MAX(sale_date) <= '2019-03-31' AND MIN(sale_date) >= '2019-01-01'
)

