-- No Joins Only Subquery

SELECT
    user_id,
    -- AVG 사용 시, 해당 유저의 전체 기록에 대한 평균이 도출됨
    ROUND(SUM(CASE WHEN activity_type = 'free_trial' THEN activity_duration ELSE 0 END) / SUM(CASE WHEN activity_type = 'free_trial' THEN 1 ELSE 0 END),2) AS trial_avg_duration,
    ROUND(SUM(CASE WHEN activity_type = 'paid' THEN activity_duration ELSE 0 END) / SUM(CASE WHEN activity_type = 'paid' THEN 1 ELSE 0 END),2) AS paid_avg_duration
FROM UserActivity
-- cancel 되자 않고, paid로 전환된 유저를 대상으로 게산하고자 조건 설정
WHERE user_id IN ( SELECT DISTINCT user_id FROM UserActivity WHERE activity_type = 'paid' )
GROUP BY
    user_id
ORDER BY
    user_id