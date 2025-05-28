# 성장한 학생 찾기
# 조건 1 : 최소 2개의 다른 날에 같은 과목 시험을 친 경우
# 조건 2 : 그 과목의 가장 최근 점수가 처음 점수보다 높을 것

WITH more_than_twice AS ( -- 1. 학생, 과목 별 exam_date가 2개 이상인 경우만 추출
    SELECT
        student_id,
        subject,
        score,
        exam_date
    FROM(
        SELECT
            student_id,
            subject,
            score,
            exam_date,
            COUNT(exam_date) OVER (PARTITION BY student_id, subject) AS exam_cnt
        FROM Scores
    ) AS t
    WHERE exam_cnt >= 2
), exam_date AS ( -- 2. 학생, 과목 별 첫 시험 날짜와 마지막 시험 날짜 구하기
    SELECT
        student_id,
        subject,
        MIN(exam_date) AS first_exam,
        MAX(exam_date) AS last_exam
    FROM more_than_twice
    GROUP BY
        student_id,
        subject
), first_exam_data AS ( -- 3. 첫 시험 성적 구하기
    SELECT
        m.student_id,
        m.subject,
        m.score AS first_score
    FROM more_than_twice m
    JOIN exam_date e
    ON m.student_id = e.student_id AND m.subject = e.subject AND m.exam_date = e.first_exam
), last_exam_data AS ( -- 4. 마지막 시험 성적 구하기
    SELECT
        m.student_id,
        m.subject,
        m.score AS latest_score
    FROM more_than_twice m
    JOIN exam_date e
    ON m.student_id = e.student_id AND m.subject = e.subject AND m.exam_date = e.last_exam
)
-- 5. 첫 시험  성적 < 마지막 시험 성적인 데이터만 추출 ! 
SELECT
    f.student_id,
    f.subject,
    f.first_score,
    l.latest_score
FROM first_exam_data f
JOIN last_exam_data l
ON f.student_id = l.student_id AND f.subject = l.subject AND f.first_score < l.latest_score