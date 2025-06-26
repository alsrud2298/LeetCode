#  description에 유효한 시리얼 넘버를 포함하고 있는 제품 정보 찾기 
-- 조건 | SN으로 시작 + 4자리 숫자 + '-' + 4자리 숫자
-- product_id 기준 오름차순 정렬

SELECT
    *
FROM products
WHERE
    description REGEXP '(^|[^A-Za-z0-9])SN[0-9]{4}-[0-9]{4}($|[^0-9])'
ORDER BY
    product_id;