# 제품 카테고리 간 구매 패턴을 알고 싶습니다.
-- Category pair 당 구매한 고객 수 구하기 (최소 3명 이상)
WITH user_category AS (
    SELECT
        user_id,
        category
    FROM ProductPurchases pp
    LEFT JOIN ProductInfo pi
    ON pp.product_id = pi.product_id
)

SELECT
    a.category AS category1,
    b.category AS category2,
    COUNT(DISTINCT a.user_id) AS customer_count
FROM user_category a
JOIN user_category b
ON a.category < b.category
AND a.user_id = b.user_id
GROUP BY
    category1,
    category2
HAVING COUNT(DISTINCT a.user_id) > 2
ORDER BY
    customer_count DESC,
    category1 ASC,
    category2 ASC