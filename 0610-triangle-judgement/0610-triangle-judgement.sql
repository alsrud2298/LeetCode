# 세 변의 길이를 통해 삼각형을 만들 수 있는지 여부 추출
# 삼각형 조건 : 두 변의 합 > 나머지 한 변의 합
SELECT *
    , CASE WHEN x+y>z and x+z>y and y+z>x then 'Yes' else 'No' end as triangle
FROM Triangle