CREATE TABLE clients(
	id int NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL
);
CREATE TABLE grocery_shops(
	id int NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL,
	client_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES clients(id)
);
CREATE TABLE vendors(
	id int PRIMARY KEY NOT NULL,
	name varchar(30) NOT NULL,
	location varchar(30) NOT NULL,
	email varchar(30) NOT NULL,
	contact int NOT NULL,
	grocery_id int NOT NULL,
	FOREIGN KEY(grocery_id) REFERENCES grocery_shops(id)
);
CREATE TABLE customers(
    id int NOT NULL PRIMARY KEY,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
	contact int NOT NULL,
	password varchar(255) NOT NULL,
	location varchar(255) NOT NULL,
	product_id int NOT NULL,
	FOREIGN KEY(product_id) REFERENCES products(id),
	grocery_id int NOT NULL,
	FOREIGN KEY(grocery_id) REFERENCES grocery_shops(id)
);
CREATE TABLE categories(
	id int NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL
);
CREATE TABLE products(
	id int NOT NULL PRIMARY KEY,
	name varchar(30) NOT NULL,
	price int NOT NULL,
	descrition varchar(30) NOT NULL,
	image bytea NOT NULL,
	grocery_shop_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES grocery_shops(id),
	category_id int NOT NULL,
	FOREIGN KEY(id) REFERENCES categories(id)
);
CREATE TABLE orders(
	id int NOT NULL PRIMARY KEY,
	status varchar(30) NOT NULL,
	quantity varchar(30) NOT NULL,
	customer_id int NOT NULL,
	FOREIGN KEY(customer_id)REFERENCES customers(id),
	product_id int NOT NULL,
	FOREIGN KEY(product_id)REFERENCES products(id),
	grocery_id int NOT NULL,
	FOREIGN KEY(grocery_id)REFERENCES grocery_shops(id),
	vendors_id int NOT NULL,
	FOREIGN KEY(vendors_id)REFERENCES vendors(id),
	client_id int NOT NULL,
	FOREIGN KEY(client_id) REFERENCES clients(id)
);
CREATE TABLE order_stsatuses(
	id int NOT NULL PRIMARY KEY,
	pending varchar(30) NOT NULL,
	confirmed varchar(30) NOT NULL,
	order_id int NOT NULL,
	FOREIGN KEY(order_id) REFERENCES orders(id),
	product_id int NOT NULL,
	FOREIGN KEY(product_id) REFERENCES products(id),
	customer_id int NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);
CREATE TABLE cakes(
	id int PRIMARY KEY NOT NULL,
	name varchar(30) NOT NULL,
	category  varchar(30) NOT NULL,
	image bytea NOT NULL,
	price int NOT NULL,
	description varchar(30) NOT NULL,
	recipes varchar(30) NOT NULL,
	vendor_id int NOT NULL,
	FOREIGN KEY(vendor_id) REFERENCES vendors(id),
	customer_id int NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(id),
	order_id int NOT NULL,
	FOREIGN KEY(order_id) REFERENCES orders(id),
	order_status_id int NOT NULL,
	FOREIGN KEY(order_status_id) REFERENCES order_statuses(id)
);
CREATE TABLE delivery_men(
	id int PRIMARY KEY NOT NULL,
	name varchar(30) NOT NULL,
	contact varchar(30) NOT NULL,
	email varchar(30) NOT NULL,
	order_id int NOT NULL,
	FOREIGN KEY(order_id) REFERENCES orders(id),
	product_id int NOT NULL,
	FOREIGN KEY(product_id) REFERENCES products(id),
	cake_id int NOT NULL,
	FOREIGN KEY(cake_id) REFERENCES cakes(id)
);
CREATE TABLE users(
	id int PRIMARY KEY NOT NULL,
	name varchar(30) NOT NULL,
	user_type varchar(30) NOT NULL
);
