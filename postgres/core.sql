CREATE TABLE medics (
	id serial primary key,
	cpf TEXT,
	name TEXT,
	crm TEXT,
	avatar BLOB,
	specialty TEXT,
	created_at TIMESTAMP WITHOUT TIME ZONE,
	updated_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE medications (
	id serial primary key,
	active_agent TEXT,
	label INTEGER,
	dosage TEXT,
	bula TEXT,
	type INTEGER,
	intake_mean INTEGER,
	name TEXT,
	br_register TEXT,
	terapeutic_class TEXT,
	manufacturer TEXT
);

CREATE TABLE pharmaceutics (
	id serial primary key,
	cpf TEXT,
	name TEXT,
	specialty TEXT,
	email TEXT
);

CREATE TABLE patients (
	id serial primary key,
	name TEXT,
	cpf TEXT,
	label INTEGER,
	medical_history TEXT,
	gender INTEGER,
	weigth TEXT,
	email TEXT
);
