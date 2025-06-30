# 아래 조건 중 하나라도 만족하면 유효하지 않은 IP 주소임
# 1. 255보다 더 큰 숫자를 포함한다.
# 2. 01, 02 처럼 0으로 시작하는 숫자가 있다.
# 3. 4자리보다 적거나 많다.

SELECT
	ip,
	COUNT(*) AS invalid_count
FROM
	logs
WHERE
	-- Condition 1: Must have exactly 4 octets
	LENGTH(ip) - LENGTH(REPLACE(ip, '.', '')) != 3
	-- Condition 2: Leading zero in any octet
	OR ip REGEXP '\\.0[0-9]+|^0[0-9]+'
	-- Condition 3: Octet value out of range
	OR NOT (
		SUBSTRING_INDEX(ip, '.',1) REGEXP '^(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$' AND
		SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', 2), '.', -1) REGEXP '^(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$' AND
		SUBSTRING_INDEX(SUBSTRING_INDEX(ip, '.', -2), '.', 1) REGEXP '^(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$' AND
		SUBSTRING_INDEX(ip, '.', -1) REGEXP '^(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$'
	)
	GROUP BY ip
	ORDER BY invalid_count DESC, ip DESC;

    -- `'^(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2})$’`
    -- ^()$ : 문자열 전체가 이 패턴에 부합해야 함.
    -- 250~255, 200~249,
    -- 1? : 1은 있어도되고 없어도됨.
    -- 0 ~ 199