# each month, country 별 거래 수,총 거래액, 승인된 거래 수, 승인된 총 거래액 구하기

SELECT LEFT(trans_date,7) as month
    , country as country
    , COUNT(id) as trans_count
    , SUM(state='approved') as approved_count
    , SUM(amount) as trans_total_amount
    , SUM((state='approved')*amount
    ) as approved_total_amount
FROM Transactions
GROUP BY month, country
