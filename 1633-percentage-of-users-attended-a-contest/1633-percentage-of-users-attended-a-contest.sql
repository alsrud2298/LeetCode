# 대회에 참여한 유저 비율
# 조건 : ROUND(,2), percentage desc & contest_id asc

SELECT r.contest_id, COUNT(u.user_id), COUNT(DISTINCT u.user_name)
FROM Users u
    LEFT JOIN Register r
        ON u.user_id = r.user_id
GROUP BY contest_id
-- ORDER BY percentage DESC, contest_id ASC