# cancellation rate = #canceled request by client or driver with unbanned users / # total requests with unbanned users
# both client and driver must not be banned
WITH data AS (
    SELECT *
    FROM Trips
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
), unbanned_user AS (
    SELECT *
    FROM Users
    WHERE banned = 'No'
), cancelled_data AS (
    SELECT *
    FROM data a
    WHERE client_id IN (SELECT users_id FROM unbanned_user) AND driver_id IN (SELECT users_id FROM unbanned_user) 
)


SELECT request_at Day
    , ROUND(SUM(IF(status != 'completed',1,0)) / COUNT(*),2) AS "Cancellation Rate"
FROM cancelled_data
GROUP BY 1
ORDER BY 1