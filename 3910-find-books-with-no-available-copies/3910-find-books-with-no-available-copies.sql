# 대여 불가능한 책 찾기
-- 대여 = borrowing_records 에 존재하면서, return_date = NULL 인 데이터
-- 대여 불가능인 책 -> 현재 대여 중인 권 수 = 보유 권 수

WITH current_borrow_books AS ( -- -- 1. 대여 중인 책 id 별 대여 횟수 구하기
    SELECT
        book_id,
        COUNT(DISTINCT borrower_name) AS current_borrowers
    FROM borrowing_records
    WHERE return_date IS NULL -- 대여 중인 책 찾기
    GROUP BY book_id
)
-- 2. 보유 권 수 = 대여 권 수 인 책 찾기
SELECT
    lb.book_id,
    title,
    author,
    genre,
    publication_year,
    current_borrowers
FROM library_books lb
JOIN current_borrow_books cbb
ON lb.book_id = cbb.book_id AND lb.total_copies = cbb.current_borrowers
ORDER BY
    current_borrowers DESC,
    title

