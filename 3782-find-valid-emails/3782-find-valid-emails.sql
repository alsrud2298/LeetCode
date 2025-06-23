-- 1. @ 한개만 포함할 것
-- 2. @ 이전에는 알파벳, 숫자, _ 만 포함할 것
-- 3. @ 이후 & .com 까지는 문자열만 포함할 것
SELECT *
FROM Users
WHERE email REGEXP '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$'
ORDER BY user_id;
    