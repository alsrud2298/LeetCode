# 대회에 참여한 유저 비율
# 조건 : ROUND(,2), percentage desc & contest_id asc

SELECT contest_id
    , ROUND(COUNT(DISTINCT user_Id) * 100 / (SELECT COUNT(user_id) FROM Users),2) as percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id