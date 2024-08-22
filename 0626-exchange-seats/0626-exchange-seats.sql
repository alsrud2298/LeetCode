# 다음 id 학생이랑 swap
# 1.홀수 -> 다음 학생, 없으면 그대로
# 2.짝수 -> 이전 학생
# 3.id 순 오름차순

SELECT id
    ,CASE
        WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id)
        ELSE COALESCE(LEAD(student) OVER (ORDER BY id), student)
    END as student
FROM Seat
