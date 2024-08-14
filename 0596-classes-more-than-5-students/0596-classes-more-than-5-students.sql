# 문제 : 최소 5명의 학생이 있는 class 찾기
# 1. 클래스 당 학생 수 구하기
# 2. 5명 이상인 class 명만 출력

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5
