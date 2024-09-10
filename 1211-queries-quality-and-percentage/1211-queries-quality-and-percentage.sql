#(복습) quality = AVG(rating/position) & rating이 3 이하인 query 비율 추출

SELECT query_name,
    ROUND(AVG(rating/position),2) as quality,
    ROUND(AVG(rating < 3)*100,2) as poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name
