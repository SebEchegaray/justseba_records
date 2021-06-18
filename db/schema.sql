CREATE TABLE records_info (
  id SERIAL PRIMARY KEY,
  record_name TEXT,
  artist TEXT,
  year_release INT,
  artwork_url TEXT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email VARCHAR,
  password VARCHAR
);