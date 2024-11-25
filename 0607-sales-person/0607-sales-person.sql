# "RED"라는 회사명과 관련된 주문이 없는 salesperson의 이름 추출
# 1. "RED" 회사 아이디가 포함된 주문 내역이 있는 sales_id 추출
# 2. 해당 아이디에 포함되지 않는 나머지 salesperson 이름 추출

SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
    SELECT sales_id
    FROM Orders o
    JOIN Company c
        ON o.com_id = c.com_id
    WHERE c.name = 'RED'
)


