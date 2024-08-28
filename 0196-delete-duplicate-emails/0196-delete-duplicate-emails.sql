# id가 최소인 이메일 1개 제외하고는 중복 이메일 모두 삭제하기

DELETE p1
FROM Person p1, Person p2
WHERE p1.Email = p2.Email AND p1.id > p2.id