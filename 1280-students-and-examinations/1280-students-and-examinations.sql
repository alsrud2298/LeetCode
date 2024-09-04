-- (복습) 학생 별 시험에 참석한 횟수 추출 
-- 1. 모든 학생 x 과목 조합 테이블 생성 (Students, Subjects 테이블 조인)
-- 2. Examinations 테이블 LEFT 조인 -> 학생&과목 별 시험 참석 횟수 구하기
-- 3. student_id, subject_name 기준 정렬
SELECT Sub.*,
    COUNT(e.student_id) as attended_exams
FROM(
    SELECT *
    FROM Students
        CROSS JOIN Subjects
) as Sub
    LEFT JOIN Examinations as e
    ON Sub.student_id = e.student_id AND Sub.subject_name = e.subject_name
GROUP BY Sub.student_id, Sub.subject_name
ORDER BY student_id, subject_name

