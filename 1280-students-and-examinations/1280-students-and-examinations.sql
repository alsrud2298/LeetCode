# 학생 별 시험에 참석한 횟수 세기 / 참석한 적 없다면 0번
# std_id, sub name 순 정렬
SELECT *
FROM Students st
    CROSS JOIN Subjects su
    LEFT JOIN Examinations e
        ON st.student_id = e.student_id AND su.subject_name = e.subject_name


