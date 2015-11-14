CREATE TABLE products (
	id serial primary key,
	name TEXT,
	type INTEGER,
	description TEXT,
	curr_quantity INTEGER,
	min_quantity INTEGER,
	curr_value REAL
);

CREATE TABLE orders (
	id serial primary key,
	created_at INTEGER,
	closed_at INTEGER,
	approved BOOLEAN, 
	canceled BOOLEAN
);

CREATE TABLE order_products (
	order_id INTEGER REFERENCES orders(id),
	product_id INTEGER REFERENCES products(id)
);


CREATE TABLE purchases (
	id serial primary key,
	created_at INTEGER,
	confirmed_at INTEGER,
	concluded_at INTEGER,
	total_value REAL,
	order_id INTEGER REFERENCES orders(id),

);

CREATE TABLE invoices (
	id serial primary key,
	product_id INTEGER REFERENCES products(id),
	value REAL,
	quantity INTEGER,
	purchase_id INTEGER REFERENCES purchases(id)
);

CREATE TABLE withdrawal (
	id serial primary key,
	product_id INTEGER REFERENCES products(id),
	quantity INTEGER,
	issued_at INTEGER,
	approved_at INTEGER
);
