/* EXERCISE 1 */
SELECT customer_name, 
	CONCAT('$', FORMAT(balance, 2)) AS balance, 
    CONCAT('$', FORMAT(credit_limit, 2)) AS credit_limit
FROM premiere_customer;

/* EXERCISE 2 */
SELECT order_num, CONVERT(DATE_FORMAT(order_date, '%b %e, %Y') USING latin1)
FROM premiere_orders
WHERE (customer_num = 148);
