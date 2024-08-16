# 모든 제품을 구매한 고객의 id 추출
# 1. 고객 당 DISTINCT Product_key 개수 = 전체 Product_key 개수인 customer_id 추출

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product)