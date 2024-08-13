# 2019-07-27일포함 30일간 활동한 일일 활성 사용자 수

SELECT activity_date as day, COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE (activity_date >= DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND  activity_date <= '2019-07-27')
GROUP BY activity_date