# id가 홀수이고 description이 'boaring'이 아닌 영화를 rating 내림차순으로 정렬
SELECT *
FROM Cinema
WHERE id % 2 != 0 and description != 'boring'
ORDER BY rating DESC
