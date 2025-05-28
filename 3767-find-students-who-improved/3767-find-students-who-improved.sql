# 성장한 학생 찾기 window function.ver
# 조건 1 : 최소 2개의 다른 날에 같은 과목 시험을 친 경우
# 조건 2 : 그 과목의 가장 최근 점수가 처음 점수보다 높을 것
-- RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW 가 기본 값.
WITH temp AS (
    SELECT
        DISTINCT
        student_id,
        subject,
        FIRST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date) first_score,
        FIRST_VALUE(score) OVER(PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_score,
        COUNT(student_id) OVER(PARTITION BY student_id, subject) AS diff_dates
    FROM Scores
)

SELECT
    student_id,
    subject,
    first_score,
    latest_score
FROM temp
WHERE first_score < latest_score AND diff_dates > 1
ORDER BY
    student_id,
    subject