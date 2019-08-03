
DROP TABLE IF EXISTS sunray_rental;
DROP TABLE IF EXISTS sunray_purchase;
DROP TABLE IF EXISTS sunray_video;
DROP TABLE IF EXISTS sunray_format;
DROP TABLE IF EXISTS sunray_category;
DROP TABLE IF EXISTS sunray_customer;


CREATE TABLE sunray_category
(category_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
category_desc VARCHAR(30));

CREATE TABLE sunray_customer
(customer_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
last_name VARCHAR(30),
first_name VARCHAR(30),
cust_address VARCHAR(30),
city VARCHAR(30),
state CHAR(2),
zip VARCHAR(10));

CREATE TABLE sunray_format
(format_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
format_desc VARCHAR(20));

CREATE TABLE sunray_video
(video_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(50),
format_id SMALLINT,
cost DECIMAL (4,2),
category_id SMALLINT,
CONSTRAINT FOREIGN KEY (format_id) REFERENCES sunray_format(format_id),
CONSTRAINT FOREIGN KEY (category_id) REFERENCES sunray_category(category_id));


CREATE TABLE sunray_rental
(rental_id SMALLINT AUTO_INCREMENT PRIMARY KEY,
date_out DATE,
date_due DATE,
date_in DATE,
delivery_status VARCHAR(20),
cost DECIMAL(4,2),
late_fee DECIMAL (4,2),
customer_id SMALLINT,
CONSTRAINT FOREIGN KEY (customer_id) REFERENCES sunray_customer(customer_id),
video_id SMALLINT,
CONSTRAINT FOREIGN KEY (video_id) REFERENCES sunray_video(video_id));