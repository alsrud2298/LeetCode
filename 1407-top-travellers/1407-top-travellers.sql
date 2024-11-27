# 유저 별 여행한 거리의 합 추출

SELECT name
    , IFNULL(SUM(distance),0) as travelled_distance
FROM Users u
    LEFT JOIN Rides r ON u.id = r.user_id
GROUP BY u.id
ORDER BY 2 DESC, 1 
