CREATE TABLE medics (
	id serial primary key,
	cpf TEXT,
	name TEXT,
	crm TEXT,
	specialty INTEGER,
	email TEXT,
	created_at TIMESTAMP WITHOUT TIME ZONE,
	updated_at TIMESTAMP WITHOUT TIME ZONE,
	deleted_at TIMESTAMP WITHOUT TIME ZONE
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
	manufacturer TEXT,
	receipt_ok INTEGER
);

CREATE TABLE pharmacists (
	id serial primary key,
	crf TEXT,
	name TEXT,
	specialty INTEGER,
	email TEXT
);

CREATE TABLE patients (
	id serial primary key,
	name TEXT,
	cpf TEXT,
	medical_history TEXT,
	gender INTEGER,
	weight TEXT,
	email TEXT
);

CREATE TABLE treatments (
	id serial primary key,
	medic_id INTEGER REFERENCES medics(id) ON DELETE CASCADE,
	patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
	pharmacist_id INTEGER REFERENCES pharmacists(id) ON DELETE CASCADE,
	title TEXT,
	status INTEGER,
	start_date INTEGER,
	finish_date INTEGER,
	dose TEXT
);

CREATE TABLE prescriptions (
	id serial primary key,
	treatment_id INTEGER REFERENCES treatments(id) ON DELETE CASCADE,
	medication_id INTEGER REFERENCES medications(id) ON DELETE CASCADE,
	starting_at INTEGER,
	finishing_at INTEGER,
	frequency INTEGER
);

CREATE TABLE feed_events (
	id serial primary key,
	patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
	title TEXT,
	tags TEXT,
	description TEXT,
	hypermidia TEXT,
	created_at TIMESTAMP WITHOUT TIME ZONE,
	updated_at TIMESTAMP WITHOUT TIME ZONE,
	deleted_at TIMESTAMP WITHOUT TIME ZONE
);
