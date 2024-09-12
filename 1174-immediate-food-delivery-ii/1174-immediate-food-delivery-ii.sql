-- (복습)첫 주문 & 주문일=배송일인 고객 비율 추출
-- 1. 첫 주문 -> order_date = min(order_date)
-- 2. order_date = customer_pref_delivery_date

SELECT ROUND(AVG(IF(order_date = customer_pref_delivery_date,1,0))*100,2) as immediate_percentage
FROM Delivery 
WHERE (customer_id, order_date) IN (
    SELECT customer_id
    , MIN(order_date) as first_order
    FROM Delivery
    GROUP BY customer_id)
