# 가장 많은 친구를 가지고 있는 id & 친구 수 추출
# 친구 수 = requester_id + accepter_id
# 1. WITH 문으로 requester_id, accepter_id 를 같은 열로 병합
# 2. id 별 개수 COUNT & 정렬 후 최대값만 추출

WITH base AS (
    SELECT requester_id as id
    FROM RequestAccepted
    
    UNION ALL
    
    SELECT accepter_id as id
    FROM RequestAccepted
)

SELECT id
    , COUNT(*) as num
FROM base
GROUP BY id
ORDER BY num DESC
LIMIT 1

