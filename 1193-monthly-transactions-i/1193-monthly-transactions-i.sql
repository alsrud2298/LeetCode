-- (복습) 각 월, 나라 별 거래 수, 총 수량, 승인된 거래 수, 승인된 총 수량 추출

SELECT LEFT(trans_date,7) as month,
    country,
    COUNT(*) as trans_count ,
    SUM(IF(state='approved',1,0)) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(IF(state='approved',amount,0)) as approved_total_amount
FROM Transactions
GROUP BY LEFT(trans_date,7), country
