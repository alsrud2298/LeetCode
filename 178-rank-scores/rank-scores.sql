# 내림차순 정렬, 같은 점수가 있다면 같은 rank 여야함. 순위 간 간격이 없도록

SELECT score
    , DENSE_RANK() OVER (PARTITION BY NULL ORDER BY score DESC) as 'rank'
FROM Scores