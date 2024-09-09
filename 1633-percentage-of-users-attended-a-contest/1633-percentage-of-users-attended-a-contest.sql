# (복습) 각 contest에 참여한 유저들의 비율 추출
# 1. 전체 유저 수 구하기
# 2. 콘테스트 당 참여 유저 수 / 전체 유저 수 

SELECT contest_id,
    ROUND(COUNT(user_id) / (SELECT COUNT(DISTINCT user_id) FROM Users),2) percentage
FROM Users
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
