CREATE TABLE products (
	id serial primary key,
	name TEXT,
	type INTEGER,
	description TEXT,
	curr_quantity INTEGER,
	min_quantity INTEGER
);

CREATE TABLE orders (
	id serial primary key,
	created_at INTEGER,
	closed_at INTEGER,
	approved BOOLEAN DEFAULT FALSE, 
	canceled BOOLEAN DEFAULT FALSE
);

CREATE TABLE purchases (
	id serial primary key,
	created_at INTEGER,
	confirmed_at INTEGER,
	concluded_at INTEGER,
	total_value REAL,
	order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE purchase_products (
	id serial primary key,
	product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
	value REAL,
	quantity INTEGER,
	order_id INTEGER REFERENCES orders(id) ON DELETE CASCADE
);

CREATE TABLE withdrawals (
	id serial primary key,
	product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
	quantity INTEGER,
	issued_at INTEGER
);
