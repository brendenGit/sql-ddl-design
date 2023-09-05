-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE airlines
(
  airline_id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE countries
(
  country_id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
);

CREATE TABLE cities
(
  city_id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_id INT REFERENCES countries
);

CREATE TABLE flights
(
  flight_id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INT REFERENCES airlines NOT NULL,
  from_city_id INT REFERENCES cities NOT NULL,
  to_city_id INT REFERENCES cities NOT NULL
);

CREATE TABLE passengers
(
  passenger_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INT REFERENCES flights
);



INSERT INTO airlines
  (airline_name)
VALUES
  ('United');

INSERT INTO countries
  (country_name)
VALUES
  ('United States');

INSERT INTO cities
  (city_name, country_id)
VALUES
  ('Seattle', 1),
  ('San Francisco', 1);

INSERT INTO flights
  (departure, arrival, airline_id, from_city_id, to_city_id)  
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 2);

INSERT INTO passengers
  (first_name, last_name, seat, flight_id)  
VALUES
  ('Brenden', 'Arias', '1A', 1);