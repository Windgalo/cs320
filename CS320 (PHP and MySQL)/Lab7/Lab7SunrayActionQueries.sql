/* deletes */
DELETE FROM sunray_rental;
DELETE FROM sunray_video;
DELETE FROM sunray_format;
DELETE FROM sunray_customer;
DELETE FROM sunray_category;


/* inserts for sunray_category */
INSERT INTO sunray_category (category_desc)
VALUES ('New Release');

INSERT INTO sunray_category (category_desc)
VALUES ('Action');

INSERT INTO sunray_category (category_desc)
VALUES ('Horror');

INSERT INTO sunray_category (category_desc)
VALUES ('Comedy');

INSERT INTO sunray_category (category_desc)
VALUES ('Children\'s');

/* inserts for sunray_customer */
INSERT INTO sunray_customer (last_name, first_name, cust_address, city, state, zip)
VALUES ('Johnson', 'Edward', '222 Main Street', 'Boston', 'MA', '09222');

INSERT INTO sunray_customer (last_name, first_name, cust_address, city, state, zip)
VALUES ('Bailey', 'Bill', '4233 Oxford Drive', 'Cheyenne', 'WY', '82001');

INSERT INTO sunray_customer (last_name, first_name, cust_address, city, state, zip)
VALUES ('Freeman', 'Mary', '9822 Boston Road', 'Austin', 'TX', '54772');

INSERT INTO sunray_customer (last_name, first_name, cust_address, city, state, zip)
VALUES ('Harrison', 'Susan', '822 Water Street', 'Eau Claire', 'WI', '54703');

INSERT INTO sunray_customer (last_name, first_name, cust_address, city, state, zip)
VALUES ('Clemons', 'Arlo', '9833 Guthrie Street', 'Enid', 'OK', '77355');

/* inserts for sunray_format */
INSERT INTO sunray_format (format_desc)
VALUES ('VHS');

INSERT INTO sunray_format (format_desc)
VALUES ('DVD');

INSERT INTO sunray_format (format_desc)
VALUES ('Playstation 2');

INSERT INTO sunray_format (format_desc)
VALUES ('Nintendo 64');

INSERT INTO sunray_format (format_desc)
VALUES ('Sega');

/* inserts for sunray_video */
INSERT INTO sunray_video (title, format_id, cost, category_id)
VALUES ('The Matrix', 1, 2.00, 2);

INSERT INTO sunray_video (title, format_id, cost, category_id)
VALUES ('The Evil', 1, 2.00, 3);

INSERT INTO sunray_video (title, format_id, cost, category_id)
VALUES ('Super Mario World', 4, 1.00, 5);

INSERT INTO sunray_video (title, format_id, cost, category_id)
VALUES ('The Princess Bride', 1, 2.00, 5);

INSERT INTO sunray_video (title, format_id, cost, category_id)
VALUES ('Men In Tights', 2, 2.00, 4);

/* inserts for sunray_rental */
INSERT INTO sunray_rental (date_out, date_due, date_in, delivery_status, cost, late_fee, customer_id, video_id)
VALUES ('2002-09-22', '2002-09-24', '2002-09-24', 'pickup', 2.00, 0.00, 1, 3);

INSERT INTO sunray_rental (date_out, date_due, date_in, delivery_status, cost, late_fee, customer_id, video_id)
VALUES ('2002-09-23', '2002-09-25', NULL, 'delivery', 3.00, 1.00, 2, 4);

INSERT INTO sunray_rental (date_out, date_due, date_in, delivery_status, cost, late_fee, customer_id, video_id)
VALUES ('2002-09-25', '2002-09-27', '2002-09-26', 'pickup', 2.00, 0.00, 2, 2);

INSERT INTO sunray_rental (date_out, date_due, date_in, delivery_status, cost, late_fee, customer_id, video_id)
VALUES ('2002-09-25', '2002-09-27', '2002-09-26', 'pickup', 2.00, 0.00, 2, 5);

INSERT INTO sunray_rental (date_out, date_due, date_in, delivery_status, cost, late_fee, customer_id, video_id)
VALUES ('2002-09-27', '2002-09-28', NULL, 'delivery', 1.00, 0.00, 4, 4);

/* updating */
UPDATE sunray_rental
    SET date_in = CURRENT_DATE()
    WHERE rental_id = 2;

UPDATE sunray_rental
    SET delivery_status = 'PICKUP'
    WHERE delivery_status = 'pickup';
    
UPDATE sunray_rental
    SET delivery_status = 'DELIVERY'
    WHERE delivery_status = 'delivery';
    
UPDATE sunray_video
    SET cost = (cost * 1.1);
    
