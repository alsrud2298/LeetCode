-- 잔고가 10000 초과인 고객의 이름과 잔고 출력하기
SELECT name
    , balance
FROM(
    SELECT t.account
        , name
        , SUM(amount) as balance
    FROM Transactions t
        JOIN Users u ON t.account = u.account 
    GROUP BY 1
    HAVING SUM(amount) > 10000
) sub
