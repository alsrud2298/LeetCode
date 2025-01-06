# 방문객이 100명 이상이었던 연속된(3개 이상) id 추출
SELECT id
    , visit_date
    , people
FROM(
    SELECT visit_date
        , people
        , id
        , LAG(id,2) OVER (ORDER BY id) prev_prev_id
        , LAG(id,1) OVER (ORDER BY id) prev_id
        , LEAD(id,1) OVER (ORDER BY id) next_id
        , LEAD(id,2) OVER (ORDER BY id) next_next_id
    FROM Stadium
    WHERE people >= 100
) sub
WHERE (id - 1 = prev_id AND id - 2 = prev_prev_id)
OR (id - 1 = prev_id AND id + 1 = next_id)
OR (id + 1 = next_id AND id + 2 = next_next_id)
