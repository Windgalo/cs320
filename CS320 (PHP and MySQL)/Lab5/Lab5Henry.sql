/* Exercise 1 */
SELECT BOOK_CODE, TITLE
FROM HENRY_BOOK;

/* Exercise 2 */
SELECT *
FROM HENRY_PUBLISHER;

/* Exercise 3 */
SELECT PUBLISHER_NAME
FROM HENRY_PUBLISHER
WHERE (CITY = "Boston");

/* Exercise 4 */
SELECT PUBLISHER_NAME
FROM HENRY_PUBLISHER
WHERE (CITY != "Boston");

/* Exercise 5 */
SELECT BRANCH_NAME
FROM HENRY_BRANCH
WHERE (NUM_EMPLOYEES <= 9);

/* Exercise 6 */
SELECT BOOK_CODE, TITLE
FROM HENRY_BOOK
WHERE (TYPE = "SFI");

/* Exercise 7 */
SELECT BOOK_CODE, TITLE
FROM HENRY_BOOK
WHERE (TYPE = "SFI" AND PAPERBACK = "Y");

/* Exercise 8 */
SELECT BOOK_CODE, TITLE
FROM HENRY_BOOK
WHERE (TYPE = "SFI" OR PUBLISHER_CODE = "SC"); 

/* Exercise 9 */
SELECT book_code, title, price
FROM henry_book
WHERE (price > 20 AND price < 30);

/* Exercise 10 */
SELECT book_code, title
FROM henry_book
WHERE (type = "MYS" AND price < 20);

/* Exercise 11 */
SELECT book_code, title, price, (price - (price / 10)) AS discounted_price
FROM henry_book;

/* Exercise 12 */
SELECT publisher_name
FROM henry_publisher
WHERE publisher_name LIKE '% AND %';

/* Exercise 13 */
SELECT book_code, title
FROM henry_book
WHERE (type IN("SFI","MYS","ART"));

/* Exercise 14 */
SELECT book_code, title
FROM henry_book
WHERE (type IN("SFI","MYS","ART"))
ORDER BY title ASC;

/* Exercise 15 */
SELECT book_code, title, price
FROM henry_book
WHERE (type IN("SFI","MYS","ART"))
ORDER BY price DESC, title; 

/* Exercise 16 */
SELECT DISTINCT type
FROM henry_book;

/* Exercise 17 */
SELECT type, COUNT(*) 
FROM henry_book
WHERE type = "SFI";

/* Exercise 18 */
SELECT type, AVG(price)
FROM henry_book
GROUP BY type;

/* Exercise 19 */
SELECT type, AVG(price)
FROM henry_book
WHERE (paperback = "Y")
GROUP BY type;

/* Exercise 20 */
SELECT type, AVG(price)
FROM henry_book
WHERE (paperback = "Y")
GROUP BY type
HAVING (AVG(price) > 10);
