-- Q2:
-- creating the pizza shop database
CREATE DATABASE IF NOT EXISTS pizza_shop;

-- set to use the database
USE pizza_shop;

-- create three main tables 
CREATE TABLE IF NOT EXISTS customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone_number BIGINT,
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS orders (
	order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_amount DECIMAL (8,2),
    order_date DATETIME,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS menu_items(
	item_id INT NOT NULL AUTO_INCREMENT,
    item_name VARCHAR(255),
    item_price DECIMAL(8,2),
    PRIMARY KEY (item_id)
);

-- create the join tables for two many-to-many relationships
CREATE TABLE IF NOT EXISTS customer_orders (
	customer_orders_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY (customer_orders_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE IF NOT EXISTS order_items (
	order_items_id INT NOT NULL AUTO_INCREMENT,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_items_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);


-- Q3: populating tables with data
-- customers table
INSERT INTO customers (first_name, last_name, phone_number)
VALUES ('Trevor','Page', 2265554982);

INSERT INTO customers (first_name, last_name, phone_number)
VALUES ('John','Doe', 5555559498);

-- order table
INSERT INTO orders (order_amount, order_date, customer_id)
VALUES (22.98,'2014-09-10 09:47:00',1);

INSERT INTO orders (order_amount, order_date, customer_id)
VALUES (39.97,'2014-09-10 13:20:00',2);

INSERT INTO orders (order_amount, order_date, customer_id)
VALUES (27.98,'2014-09-10 09:47:00',1);

-- menu_items table
INSERT INTO menu_items (item_name, item_price)
VALUES ('Pepperoni & Cheese', 7.99);

INSERT INTO menu_items (item_name, item_price)
VALUES ('Vegetarian', 9.99);

INSERT INTO menu_items (item_name, item_price)
VALUES ('Meat Lovers', 14.99);

INSERT INTO menu_items (item_name, item_price)
VALUES ('Pepperoni & Cheese', 12.99);


-- customer_orders table
INSERT INTO customer_orders(customer_id,order_id)
VALUES (1,1);

INSERT INTO customer_orders(customer_id,order_id)
VALUES (2,2);

INSERT INTO customer_orders(customer_id,order_id)
VALUES (1,3);


-- order_items table
INSERT INTO order_items (order_id, item_id, quantity)
VALUES(1,1,1);

INSERT INTO order_items (order_id, item_id, quantity)
VALUES(1,3,1);

INSERT INTO order_items (order_id, item_id, quantity)
VALUES(2,2,1);

INSERT INTO order_items (order_id, item_id, quantity)
VALUES(2,3,2);

INSERT INTO order_items (order_id, item_id, quantity)
VALUES(3,3,1);

INSERT INTO order_items (order_id, item_id, quantity)
VALUES(3,4,1);


-- Q4: How much money each individual customer has spent.
SELECT customers.customer_id, customers.first_name, customers.last_name,
SUM(orders.order_amount) 
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customer_id;


-- Q5: How much money each individual customer has spent on what date.
SELECT customers.customer_id, customers.first_name, customers.last_name, 
DATE_FORMAT (orders.order_date, '%Y-%m-%d %h:%i:%s %p') AS order_date,
SUM(orders.order_amount) 
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customer_id, orders.order_date;







