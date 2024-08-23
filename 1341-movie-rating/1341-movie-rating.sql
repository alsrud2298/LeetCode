# 평점을 가장 많이 남긴 user_name 추출 (같다면 알파벳 순으로 앞에 있는 유저)
# 2020.Feb에 평균 평점이 가장 높은 영화 추출 (같다면 알파벳 순)
# 1. user_id 당 rating 수 COUNT & Users 테이블과 JOIN 후 정렬해서 1개만 추출
# 2. 2020-02 데이터만 필터링 & movie_id 그룹화 후 AVG(rating) & movie 테이블과 JOIN 후 정렬해서 1개만 추출

(SELECT u.name as results
FROM MovieRating mr
    LEFT JOIN Users u
        ON mr.user_id = u.user_id
GROUP BY mr.user_id
ORDER BY COUNT(*) DESC, name
LIMIT 1
)
UNION ALL

(SELECT m.title as results
FROM MovieRating mr
    LEFT JOIN Movies m
        ON mr.movie_id = m.movie_id
WHERE LEFT(created_at,7) = '2020-02'
GROUP BY mr.movie_id
ORDER BY AVG(mr.rating) DESC, title
LIMIT 1 
)