# 각 유저당 팔로워 수 추출
# 조건 : user_id 기준 오름차순
SELECT user_id, COUNT(follower_id) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id