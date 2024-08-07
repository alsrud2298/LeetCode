# 학생 별 시험에 참석한 횟수 세기 / 참석한 적 없다면 0번
# std_id, sub name 순 정렬
SELECT std.student_id, std.student_name, sub.subject_name, COUNT(ex.student_id) AS attended_exams
FROM Students std
    CROSS JOIN  Subjects sub
    LEFT JOIN Examinations ex
    ON std.student_id = ex.student_id AND sub.subject_name = ex.subject_name
GROUP BY std.student_id, std.student_name, sub.subject_name
ORDER BY std.student_id, sub.subject_name  
