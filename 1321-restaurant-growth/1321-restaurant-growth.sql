
SELECT DISTINCT visited_on,
    SUM(amount) OVER w as amount,
    ROUND((SUM(amount) OVER w)/7,2) as average_amount
FROM Customer
    WINDOW w AS (
        ORDER BY visited_on
        RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    )
LIMIT 6,999