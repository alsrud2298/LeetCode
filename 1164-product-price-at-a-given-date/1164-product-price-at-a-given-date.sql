# 2019-08-16일에 모든 제품의 가격 추출
# 변경 전 가격 = 10
# 1. product_id 별 2019-08-16 이전 & MAX(change_date) 인 new_price 구하기
# 2. null값은 10으로 대체

SELECT DISTINCT product_id
    , 10 as price 
        FROM Products 
        WHERE product_id 
        NOT IN 
            (SELECT DISTINCT product_id 
             FROM Products
             WHERE change_date <= '2019-08-16')
UNION
SELECT product_id
    , new_price as price
FROM Products
WHERE (product_id, change_date) IN
    (SELECT product_id, MAX(change_date) as date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
    )


