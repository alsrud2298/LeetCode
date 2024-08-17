# 세 변의 길이를 통해 삼각형을 만들 수 있는지 여부 추출
# 삼각형 조건 : a + b > c , c >= a,b
# 1. 최대 값 판별
# 2. 삼각형 판별 
SELECT *
    , IF(GREATEST(x,y,z) >= (SUM(x+y+z) - GREATEST(x,y,z)),'No','Yes') as triangle
FROM Triangle
GROUP BY x,y,z