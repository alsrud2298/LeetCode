# COVID 회복 환자 찾기
-- 양성 날짜 <  음성 날짜
-- 첫 양성 확진 날짜로부터 첫 음성 날짜까지의 회복 기간 계산
-- 양성, 음성 기록 모두 보유하고 있는 환자만 출력
-- 1. 양성 테이블, 음성 테이블 만든 후 JOIN
WITH first_positive AS (
    SELECT 
        patient_id,
        MIN(test_date) AS positive_test_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY
        patient_id
), first_negative_after_positive AS (
    SELECT 
        ct.patient_id,
        positive_test_date,
        MIN(ct.test_date) AS negative_test_date
    FROM covid_tests ct
    JOIN first_positive fp ON ct.patient_id = fp.patient_id
        AND ct.test_date > fp.positive_test_date
    WHERE result = 'Negative' 
    GROUP BY
        ct.patient_id
)
    

SELECT
    fnap.patient_id,
    patient_name,
    age,
    DATEDIFF(negative_test_date, positive_test_date) AS recovery_time
FROM first_negative_after_positive AS fnap
JOIN patients AS p
    ON p.patient_id = fnap.patient_id
ORDER BY 
    recovery_time,
    patient_name
