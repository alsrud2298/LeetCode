WITH cte AS (
    SELECT
        E.employee_id,
        E.name,
        review_date,
        rating,
        ROW_NUMBER() OVER(PARTITION BY E.employee_id ORDER BY review_date DESC) AS rn,
        LEAD(rating,1) OVER(PARTITION BY E.employee_id ORDER BY review_date DESC) AS next_rating,
        LEAD(rating,2) OVER(PARTITION BY E.employee_id ORDER BY review_date DESC) AS sec_next_rating,
        COUNT(*) OVER(PARTITION BY E.employee_id) AS cnt
    FROM performance_reviews AS PR
    JOIN employees E
    ON PR.employee_id = E.employee_id
)
SELECT
    employee_id,
    name,
    rating - sec_next_rating AS improvement_score
FROM cte
WHERE
    cnt > 2
AND rn = 1
AND rating > next_rating
AND next_rating > sec_next_rating
ORDER BY
    improvement_score DESC,
    name ASC