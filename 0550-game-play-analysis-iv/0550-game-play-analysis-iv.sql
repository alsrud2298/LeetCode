-- (복습) 첫 로그인 & 다음날 또 로그인 한 플레이어의 비율 추출
-- 1. player 별 첫 로그인 일 구하기 MIN(event_date)
-- 2. 첫 로그인 + 1일째 로그인 기록이 있는지 체크

SELECT COUNT(DISTINCT player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity) as fraction
FROM Activity
WHERE (player_id, event_date) IN (
    SELECT player_id,
    DATE_ADD(MIN(event_date),INTERVAL 1 DAY)
    FROM Activity
    GROUP BY player_id)
