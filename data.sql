INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("어린왕자", 7, 0,"종이책", 0, "어리다..", "많이 어리다..", "김어림", 100, "목차입니다.", 20000, "2019-01-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("신데렐라", 10, 0,"종이책", 1,  "유리구두..", "투명 유리구두..", "김구두", 100, "목차입니다.", 20000, "2023-12-31");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("백설공주", 60, 1, "종이책", 2, "사과..", "빨간 사과..", "김사과", 100, "목차입니다.", 20000, "2024-01-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("흥부와 놀부", 90, 2, "종이책", 3,   "제비..", "까만제비..", "김제비", 100, "목차입니다.", 20000, "2023-12-25");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("콩쥐 팥쥐", 4,  0, "종이책", 4, "콩팥..", "콩쥐는 계모와 팥쥐에게 시달리면서 살았다..", "김콩쥐", 150, "목차입니다.", 23000, "2023-07-25");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("별주부전", 5, 1, "종이책", 5, "토끼..", "토끼는 용궁속으로 가서..", "김별주", 135, "목차입니다.", 21000, "2023-06-17");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("해님달님", 15, 2, "ebook", 6,  "옛날에 오누이..", "옛날에 오누이..", "박해달", 100, "목차입니다.", 19000, "2023-09-07");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("장화홍련", 80, 0, "종이책", 7, "장화와 홍련이..", "장화와 홍련이..", "정장화", 100, "목차입니다.", 13000, "2023-05-05");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("견우와 직녀", 8, 1, "ebook", 8,  "견우와 직녀가..", "견우와 직녀가..", "이견우", 100, "목차입니다.", 17500, "2023-11-24");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("효녀심청", 12, 0, "종이책", 9,  "효심이 강한 심청이..", "효심이 강한 심청이..", "우효녀", 100, "목차입니다.", 14600, "2023-07-28");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("혹부리 영감", 22, 2, "ebook", 10,  "슈퍼스타 영감..", "슈퍼스타 영감..", "장영감", 100, "목차입니다.", 12000, "2023-10-29");


SELECT * FROM books LEFT
JOIN category ON books.category_id = category.id;

SELECT * FROM books LEFT JOIN category ON books.category_id = category.id WHERE books.id = 1;

SELECT * FROM books WHERE pub_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW();


-- 좋아요 추가
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 1);

-- 좋아요 취소
DELETE FROM likes WHERE user_id = 1 AND liked_book_id = 3;

INSERT INTO likes (user_id, liked_book_id) VALUES (1, 1);
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 2);
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 3);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 1);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 2);
INSERT INTO likes (user_id, liked_book_id) VALUES (2, 3);
INSERT INTO likes (user_id, liked_book_id) VALUES (3, 1);
INSERT INTO likes (user_id, liked_book_id) VALUES (4, 4);
INSERT INTO likes (user_id, liked_book_id) VALUES (4, 3);
INSERT INTO likes (user_id, liked_book_id) VALUES (4, 5);

-- 조건을 만족하는 행 개수
SELECT COUNT(*) FROM likes WHERE liked_book_id = 9;

-- 좋아요 개수가 포함된 books 테이블 조회
SELECT *, (SELECT COUNT(*) FROM likes WHERE books.id = liked_book_id) AS likes FROM books

-- 개별 도서 조회 시, 사용자가 좋아요를 했는지 여부를 포함
SELECT EXISTS (SELECT * FROM likes Where user_id = 1 AND liked_book_id = 1); -- true : 1, false : 0
SELECT * FROM likes Where user_id = 1 AND liked_book_id = 1; -- user_id와 liked_book_id가 출력