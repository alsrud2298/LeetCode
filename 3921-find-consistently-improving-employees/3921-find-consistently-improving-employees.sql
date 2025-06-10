# 최근 3개의 리뷰에서 지속적으로 별점이 증가한 직원 찾기
WITH employees_least_three AS (
    SELECT
        employee_id,
        review_date,
        rating
    FROM performance_reviews
    WHERE employee_id IN ( SELECT employee_id FROM performance_reviews GROUP BY employee_id HAVING COUNT(DISTINCT review_id) >= 3)
), reviews_rank AS (
    SELECT
        employee_id,
        review_date,
        rating,
        RANK() OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS rnk
    FROM employees_least_three
)

SELECT
    T.employee_id,
    E.name,
    T.first_rating - T.third_rating AS improvement_score
FROM (
    SELECT
        employee_id,
        SUM(CASE WHEN rnk = 1 THEN rating ELSE 0 END) AS first_rating,
        SUM(CASE WHEN rnk = 2 THEN rating ELSE 0 END) AS second_rating,
        SUM(CASE WHEN rnk = 3 THEN rating ELSE 0 END) AS third_rating
    FROM reviews_rank
    GROUP BY
        employee_id
) AS T
JOIN employees E ON T.employee_id = E.employee_id
WHERE first_rating > second_rating AND second_rating > third_rating
ORDER BY
    improvement_score DESC,
    name ASC



