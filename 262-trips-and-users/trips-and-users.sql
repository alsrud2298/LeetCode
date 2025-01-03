SELECT request_at Day
    , ROUND(SUM(IF(status != 'completed',1,0)) / COUNT(*),2) "Cancellation Rate"
FROM Trips
WHERE client_id IN (SELECT users_id FROM Users WHERE banned = 'NO')
AND driver_id IN (SELECT users_id FROM Users WHERE banned = 'NO')
AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1