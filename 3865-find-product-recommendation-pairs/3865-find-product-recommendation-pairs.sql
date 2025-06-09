# 최소 3명 이상의 다른 고객들이 함께 구매했던 제품 pair 찾기
WITH product_pair AS ( -- 1. user_id 기준으로 product_pair 구하기
    SELECT
        p1.user_id,
        p1.product_id AS product1_id,
        p2.product_id AS product2_id
    FROM ProductPurchases p1
    JOIN ProductPurchases p2 ON p1.user_id = p2.user_id AND p1.product_id < p2.product_id
), customer_cnt AS ( -- 2. product_pair 당 구매 고객 수 구하기
    SELECT 
        product1_id,
        product2_id,
        COUNT(DISTINCT user_id) AS customer_count
    FROM product_pair
    GROUP BY
        product1_id,
        product2_id
)
-- 3. 3명 이상의 고객이 구매한 product_pair만 추출 & category 정보와 JOIN
SELECT
    product1_id,
    product2_id,
    p1.category AS product1_category,
    p2.category AS product2_category,
    customer_count
FROM customer_cnt cc
JOIN ProductInfo p1 ON cc.product1_id = p1.product_id
JOIN ProductInfo p2 ON cc.product2_id = p2.product_id
WHERE customer_count >= 3
ORDER BY
    customer_count DESC,
    product1_id,
    product2_id


