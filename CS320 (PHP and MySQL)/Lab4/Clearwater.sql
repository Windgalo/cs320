DROP TABLE IF EXISTS CLEAR_ORDER_LINE;
DROP TABLE IF EXISTS CLEAR_SHIPMENT_LINE;
DROP TABLE IF EXISTS CLEAR_INVENTORY;
DROP TABLE IF EXISTS CLEAR_SHIPMENT;
DROP TABLE IF EXISTS CLEAR_COLOR;
DROP TABLE IF EXISTS CLEAR_ITEM;
DROP TABLE IF EXISTS CLEAR_CATEGORY;
DROP TABLE IF EXISTS CLEAR_ORDERS;
DROP TABLE IF EXISTS CLEAR_ORDER_SOURCE;
DROP TABLE IF EXISTS CLEAR_CUSTOMER;

CREATE TABLE CLEAR_CUSTOMER(cust_id int primary key, cust_last varchar(30), cust_first varchar(30), cust_mi char(1), cust_birthdate date, cust_address varchar(50), cust_city varchar(30), cust_state char(2), cust_zip char(5));
CREATE TABLE CLEAR_ORDER_SOURCE(os_id int primary key, os_desc varchar(30));
CREATE TABLE CLEAR_ORDERS(ord_id int primary key, ord_date date, ord_methpmt varchar(16), cust_id int, os_id int, 
	CONSTRAINT FOREIGN KEY (cust_id)
	REFERENCES CLEAR_CUSTOMER(cust_id),
	CONSTRAINT FOREIGN KEY (os_id) 
	REFERENCES CLEAR_ORDER_SOURCE(os_id) );
CREATE TABLE CLEAR_CATEGORY(cat_id int primary key, cat_desc varchar(50));
CREATE TABLE CLEAR_ITEM(item_id int primary key, item_desc varchar(50), cat_id int, item_image varchar(30),
	CONSTRAINT FOREIGN KEY (cat_id)
	REFERENCES CLEAR_CATEGORY(cat_id));
CREATE TABLE CLEAR_COLOR(color varchar(20));
CREATE TABLE CLEAR_SHIPMENT(ship_id int primary key, ship_date_expected date);
CREATE TABLE CLEAR_INVENTORY(inv_id int primary key, item_id int, color varchar(20), inv_size char(2), inv_price decimal (5,2), inv_qoh smallint,
	CONSTRAINT FOREIGN KEY (item_id)
	REFERENCES CLEAR_ITEM(item_id));
CREATE TABLE CLEAR_SHIPMENT_LINE(ship_id int, inv_id int, sl_quantity smallint, sl_date_received date,
	CONSTRAINT FOREIGN KEY (ship_id)
    REFERENCES CLEAR_SHIPMENT(ship_id),
    CONSTRAINT FOREIGN KEY (inv_id)
	REFERENCES CLEAR_INVENTORY(inv_id));
CREATE TABLE CLEAR_ORDER_LINE(ord_id int, inv_id int, ol_quantity smallint,
	CONSTRAINT FOREIGN KEY (ord_id)
    REFERENCES CLEAR_ORDERS(ord_id),
    CONSTRAINT FOREIGN KEY (inv_id)
    REFERENCES CLEAR_INVENTORY(inv_id));