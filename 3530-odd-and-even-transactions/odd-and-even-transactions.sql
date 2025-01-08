SELECT transaction_date
    , SUM(IF(amount % 2 = 1 , amount, 0)) odd_sum
    , SUM(IF(amount % 2 = 0 , amount, 0)) even_sum
FROM transactions
GROUP BY 1 
ORDER BY 1