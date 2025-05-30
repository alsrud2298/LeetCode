WITH free_trial_user AS ( -- 1. activity_type = ‘free_trial’ 인 유저만 추출 → 평균 활동 시간 구하기
    SELECT
        user_id,
        ROUND(AVG(activity_duration),2) AS trial_avg_duration
    FROM UserActivity
    WHERE activity_type = 'free_trial'
    GROUP BY user_id 
), paid_subscription_user AS ( -- 2. activity_type = ‘paid’인 유저만 추출 → 평균 활동 시간 구하기
    SELECT
        user_id,
        ROUND(AVG(activity_duration),2) AS paid_avg_duration
    FROM UserActivity
    WHERE activity_type = 'paid'
    GROUP BY user_id 
)

-- 3. user_id 기준으로 두 테이블 JOIN. (두 테이블 다 존재해야 하므로 INNER JOIN)
SELECT
    ftu.user_id,
    trial_avg_duration,
    paid_avg_duration
FROM free_trial_user ftu
JOIN paid_subscription_user psu
ON ftu.user_id = psu.user_id
ORDER BY
    ftu.user_id


