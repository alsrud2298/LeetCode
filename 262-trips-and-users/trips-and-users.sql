# cancellation rate = #canceled request by client or driver with unbanned users / # total requests with unbanned users
# both client and driver must not be banned
WITH data AS ( # 날짜 필터링
    SELECT *
    FROM Trips
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
), unbanned_user AS ( # unbanned_user id 추출
    SELECT users_id
    FROM Users
    WHERE banned = 'No'
), unbanned_data AS ( # driver, client 모두 unbanned 이면서 기간 내인 데이터만 추출
    SELECT *
    FROM data a
    WHERE client_id IN (SELECT users_id FROM unbanned_user) AND driver_id IN (SELECT users_id FROM unbanned_user) 
)

-- 날짜별 취소율 구하기
SELECT request_at Day
    , ROUND(SUM(IF(status != 'completed',1,0)) / COUNT(*),2) AS "Cancellation Rate"
FROM unbanned_data
GROUP BY 1
ORDER BY 1