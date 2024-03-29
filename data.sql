INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("어린왕자", 7, 0,"종이책", 0, "어리다..", "많이 어리다..", "김어림", 100, "이 책은 목차가 없습니다.", 20000, "2019-01-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("신데렐라", 10, 0,"종이책", 1,  "유리구두..", "투명 유리구두..", "김구두", 100, "이 책은 목차가 없습니다.", 20000, "2023-12-31");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("백설공주", 60, 1, "종이책", 2, "사과..", "빨간 사과..", "김사과", 100, "이 책은 목차가 없습니다.", 20000, "2024-01-01");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("흥부와 놀부", 90, 2, "종이책", 3,   "제비..", "까만제비..", "김제비", 100, "이 책은 목차가 없습니다.", 20000, "2023-12-25");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("콩쥐 팥쥐", 4,  0, "종이책", 4, "콩팥..", "콩쥐는 계모와 팥쥐에게 시달리면서 살았다..", "김콩쥐", 150, "이 책은 목차가 없습니다.", 23000, "2023-07-25");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("별주부전", 5, 1, "종이책", 5, "토끼..", "토끼는 용궁속으로 가서..", "김별주", 135, "이 책은 목차가 없습니다.", 21000, "2023-06-17");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("해님달님", 15, 2, "e-book", 6,  "깜깜한 밤,", "깜깜한 밤, 오누이를 찾아온 것은 정말 엄마일까요? 호랑이에게 맞서는 오누이의 슬기에 대한 이야기를 읽어 보세요.
오누이는 잔칫집에 일하러 간 엄마를 기다리며 집을 지키고 있었어요. 그런데 누군가 엄마인 척 문을 열어 달라는 거예요. 엄마와 달리 거친 목소리, 시뻘건 눈, 까슬까슬한 손을 가진
수상한 손님을 피해 오누이는 도망치기 시작했어요. 과연 오누이는 무사히 살아남을 수 있을까요?", "박해달", 100, "이 책은 목차가 없습니다.", 19000, "2023-09-07");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("장화홍련", 80, 0, "종이책", 7, "장화와 홍련이..", "장화와 홍련이..", "정장화", 100, "이 책은 목차가 없습니다.", 13000, "2023-05-05");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("견우와 직녀", 8, 1, "e-book", 8,  "견우와 직녀가..", "견우와 직녀가..", "이견우", 100, "이 책은 목차가 없습니다.", 17500, "2023-11-24");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("효녀심청", 12, 0, "종이책", 9,  "효심이 강한 심청이..", "효심이 강한 심청이..", "우효녀", 100, "이 책은 목차가 없습니다.", 14600, "2023-07-28");

INSERT INTO books (title, img, category_id, form, isbn, summary, detail, author, pages, contents, price, pub_date)
VALUES ("혹부리 영감", 22, 2, "e-book", 10,  "슈퍼스타 영감..", "슈퍼스타 영감..", "장영감", 100, "이 책은 목차가 없습니다.", 12000, "2023-10-29");

SELECT * FROM books LEFT
JOIN category ON books.category_id = category.id;

SELECT * FROM books LEFT JOIN category ON books.category_id = category.id WHERE books.id = 1;

SELECT * FROM books WHERE pub_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW();


-- 좋아요 추가
INSERT INTO likes (user_id, liked_book_id) VALUES (1, 1);
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

-- 좋아요 취소
DELETE FROM likes WHERE user_id = 1 AND liked_book_id = 3;

-- 조건을 만족하는 행 개수
SELECT COUNT(*) FROM likes WHERE liked_book_id = 9;

-- 좋아요 개수가 포함된 books 테이블 조회
SELECT *, (SELECT COUNT(*) FROM likes WHERE books.id = liked_book_id) AS likes FROM books

-- 개별 도서 조회 시, 사용자가 좋아요를 했는지 여부를 포함
SELECT EXISTS (SELECT * FROM likes Where user_id = 1 AND liked_book_id = 1); -- true : 1, false : 0
SELECT * FROM likes Where user_id = 1 AND liked_book_id = 1; -- user_id와 liked_book_id가 출력

-- 장바구니 담기
INSERT INTO cartItems (book_id, quantity, user_id) VALUES(1, 1, 1);

-- 장바구니 조회
SELECT cartItems.id, book_id, title, summary, quantity, price  
FROM cartItems LEFT JOIN books 
ON cartItems.book_id = books.id;

-- 장바구니 아이템 삭제
DELETE FROM cartItems WHERE id = ?;

-- 장바구니에서 선택한(장바구니 도서 id) 아이템 목록 조회(= 선택한 장바구니 상품 목록 조회)
SELECT * FROM `Book Store`.cartItems WHERE user_id = 1 AND id IN (1, 3);

-- 주문하기
-- 배송 정보 입력
INSERT INTO delivery (address, receiver, contact) VALUES ("서울시 강서구", "황인환", "010-1234-5678");
const delivery_id = SELECT max(id) FROM delivery;

-- 주문 정보 입력
INSERT INTO orders (book_title, total_quantity, total_price, user_id, delivery_id) 
VALUES ("어린왕자", 3, 60000, 1, delivery_id);
const order_id = SELECT max(id) FROM orders;

-- 주문 상세 목록 입력
INSERT INTO orderedBook (order_id, book_id, quantity)
VALUES (order_id, 1, 1);
INSERT INTO orderedBook (order_id, book_id, quantity)
VALUES (order_id, 3, 2);

SELECT MAX(id) FROM `Book Store`.orderedBook;
SELECT last_insert_id();

-- 결제된 도서 장바구니 삭제
DELETE FROM cartItems WHERE id IN (1,2,3);