# 주문 날짜 = 고객 선호 날짜 이면, immediate. 아니라면, scheduled
# 각 고객들 첫번째 주문에 대한 immediate orders 비율 구하기
SELECT delivery_id, DISTINCT(order_id)
FROM Delevery
WHERE order_date = customer_pref_delivery_date
