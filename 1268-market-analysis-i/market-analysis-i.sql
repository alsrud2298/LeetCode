# 2019년 주문 수
SELECT user_id buyer_id
    , join_date
    , IFNULL(COUNT(order_date),0) orders_in_2019
FROM Users u
    LEFT JOIN Orders o ON u.user_id = o.buyer_id AND o.order_date AND YEAR(order_date) = '2019'
GROUP BY 1
ORDER BY 1
