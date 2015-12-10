CREATE TABLE boxes (
	id SERIAL PRIMARY KEY,
	status INTEGER,
	start_date INTEGER,
	end_date INTEGER,
	treatment_id INTEGER,
	patient_id INTEGER,
	value REAL
);

CREATE TABLE packs (
  id SERIAL PRIMARY KEY,
	box_id INTEGER REFERENCES boxes(id) ON DELETE CASCADE,
	date INTEGER,
	tracking_code TEXT
);

CREATE TABLE pack_medications (
	id SERIAL PRIMARY KEY,
	medication_id INTEGER,
	pack_id INTEGER REFERENCES packs(id) ON DELETE CASCADE,
	quantity INTEGER
);
