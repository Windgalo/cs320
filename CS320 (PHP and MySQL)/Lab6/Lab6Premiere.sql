/* EXERCISE 1 */
SELECT order_num, order_date, cus.customer_num, customer_name
FROM premiere_orders ord JOIN premiere_customer cus
ON ord.customer_num = cus.customer_num;
/* EXERCISE 3 */
SELECT ord.order_num, ord.order_date, ol.part_num, ol.num_ordered, ol.quoted_price
FROM premiere_orders ord JOIN premiere_order_line ol
ON ord.order_num = ol.order_num;
/* EXERCISE 4 */
SELECT customer_num, customer_name
FROM premiere_customer
WHERE customer_num IN 
	(SELECT customer_num
     FROM premiere_orders
     WHERE order_date = '2007-10-21');
     
/* EXERCISE 8 */
SELECT o.order_num, order_date, p.part_num, description, class
FROM premiere_orders o JOIN premiere_order_line ol
ON o.order_num = ol.order_num
JOIN premiere_part p
ON ol.part_num = p.part_num 
ORDER BY class, order_num;

/* EXERCISE 9 */
SELECT DISTINCT rep_num, last_name, first_name
FROM premiere_rep
WHERE rep_num IN
	(SELECT rep_num
     FROM premiere_customer
     WHERE credit_limit = 5000);

/* EXERCISE 10 */
SELECT DISTINCT rep.rep_num, last_name, first_name
FROM premiere_rep rep JOIN premiere_customer cus
ON rep.rep_num = cus.rep_num
WHERE credit_limit = 5000;

/* EXERCISE 15 */
SELECT ord.order_num, order_date
FROM premiere_orders ord JOIN premiere_customer cus
ON ord.customer_num = cus.customer_num
JOIN premiere_order_line ol
ON ol.order_num = ord.order_num
JOIN premiere_part par
ON par.part_num = ol.part_num
WHERE customer_name = "Johnson's Department Store" OR description = 'Gas Range' ;

/* EXERCISE 20 */
SELECT par.part_num, description, on_hand, ol.order_num, num_ordered
FROM premiere_part par LEFT JOIN premiere_order_line ol
ON par.part_num = ol.part_num
ORDER BY part_num;

/* TASK 2 */
CREATE OR REPLACE VIEW sales_view AS
SELECT rep.last_name, cus.customer_name, ord.order_date, par.description, ol.num_ordered, quoted_price
FROM premiere_rep rep JOIN premiere_customer cus
ON rep.rep_num = cus.rep_num
JOIN premiere_orders ord 
ON ord.customer_num = cus.customer_num
JOIN premiere_order_line ol
ON ol.order_num = ord.order_num
JOIN premiere_part par
ON par.part_num = ol.part_num;

SELECT DISTINCT rep.last_name, (ol.quoted_price * num_ordered)AS 'revenue'
FROM premiere_rep rep JOIN premiere_customer cus
ON rep.rep_num = cus.rep_num
JOIN premiere_orders ord 
ON ord.customer_num = cus.customer_num
JOIN premiere_order_line ol
ON ol.order_num = ord.order_num
ORDER BY revenue DESC;


