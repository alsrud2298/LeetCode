# 유효한 email 가지고 있는 유저 정보 추출
# 기준 : 문자로 시작 & 문자,숫자,'_','.','-'로 구성 & @leetcode.com

SELECT *
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9\_\.\-]*@leetcode(\\?com)?\\.com$'