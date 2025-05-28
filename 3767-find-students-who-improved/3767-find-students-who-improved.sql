# 성장한 학생 찾기
# 조건 1 : 최소 2개의 다른 날에 같은 과목 시험을 친 경우
# 조건 2 : 그 과목의 가장 최근 점수가 처음 점수보다 높을 것

WITH first_and_last_exam AS ( -- 1. 조건 1 만족하는 데이터만 추출
    SELECT
        student_id,
        subject,
        MIN(exam_date) AS first_exam,
        MAX(exam_date) AS last_exam
    FROM Scores
    GROUP BY
        student_id,
        subject
    HAVING MIN(exam_date) != MAX(exam_date) -- 다른 날짜에 친 시험만
), first_exam_data AS ( -- 2. 첫 시험 성적 구하기
    SELECT
        s.student_id,
        s.subject,
        s.score AS first_score
    FROM Scores s
    JOIN first_and_last_exam f
    ON s.student_id = f.student_id
    AND s.subject = f.subject
    AND s.exam_date = f.first_exam
), last_exam_data AS ( -- 3. 마지막 시험 성적 구하기
    SELECT
        s.student_id,
        s.subject,
        s.score AS latest_score
    FROM Scores s
    JOIN first_and_last_exam f
    ON s.student_id = f.student_id
    AND s.subject = f.subject
    AND s.exam_date = f.last_exam
)

-- 4. 첫 시험  성적 < 마지막 시험 성적인 데이터만 추출 ! 
SELECT
    f.student_id,
    f.subject,
    f.first_score,
    l.latest_score
FROM first_exam_data f
JOIN last_exam_data l
ON f.student_id = l.student_id AND f.subject = l.subject AND f.first_score < l.latest_score
ORDER BY
    student_id,
    subject