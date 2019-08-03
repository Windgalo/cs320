/* QUESTION 1a */
CREATE TABLE sunray_purchase
(customer_id SMALLINT, video_id SMALLINT, purchase_date DATE, price DECIMAL(4,2),
PRIMARY KEY (customer_id, video_id),
CONSTRAINT FOREIGN KEY (customer_id) REFERENCES sunray_customer(customer_id),
CONSTRAINT FOREIGN KEY (video_id) REFERENCES sunray_video(video_id));

/* Not sure if we are allowed to add columns to that table on the test, 
but I would add a 'purchase_id INT PRIMARY KEY' as the primary key if I were them */

/* QUESTION 1b */
/*  -rental, purhcase, video, format, customer, category
	-purchase, rental, video, format, customer, category
    -rental, purchase, video, format, category, customer */

/* QUESTION 2a */
SELECT prod_desc
FROM candy_product
WHERE (prod_cost < 10);

/* QUESTION 2b */
SELECT purch_id, purch_date, delivery_date, pounds
FROM candy_purchase
ORDER BY delivery_date, pounds DESC; 

/* QUESTION 2c */
SELECT status, SUM(pounds)
FROM candy_purchase
GROUP BY status;

/* QUESTION 2d */
SELECT purch_id, prod_id, status
FROM candy_purchase
WHERE delivery_date IS NULL;

/* QUESTION 2e */
SELECT prod_id, prod_desc
FROM candy_product
WHERE prod_desc LIKE '%nut%';

/* QUESTION 2f */
SELECT COUNT(customer_num)
FROM premiere_customer
WHERE (balance > credit_limit);

/* QUESTION 2g */
SELECT *
FROM premiere_part
ORDER BY description;

/* QUESTION 2h */
SELECT part_num, description, on_hand
FROM premiere_part
WHERE (on_hand >= 10 AND on_hand <=25);

/* QUESTION 3a */
SELECT book_code, title, price
FROM henry_book bk JOIN henry_publisher pb
ON bk.publisher_code = pb.publisher_code
WHERE (publisher_name = 'Plume');

/* QUESTION 3b */
SELECT book_code, title, price
FROM henry_book
WHERE publisher_code =
(SELECT publisher_code
FROM henry_publisher
WHERE (publisher_name = 'Plume'));

/* QUESTION 3c */
SELECT bk.book_code, title, au.author_last
FROM henry_book bk JOIN henry_wrote wr
ON bk.book_code = wr.book_code
JOIN henry_author au
ON wr.author_num = au.author_num
WHERE author_last = 'Rowling';

/* QUESTION 3d */
SELECT bk.book_code, title, au.author_last, br.branch_name
FROM henry_book bk JOIN henry_wrote wr
ON bk.book_code = wr.book_code
JOIN henry_author au
ON wr.author_num = au.author_num
JOIN henry_inventory inv 
ON bk.book_code = inv.book_code
JOIN henry_branch br
ON inv.branch_num = br.branch_num
WHERE author_last = 'Rowling';



