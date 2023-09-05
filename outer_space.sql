-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  galaxy_id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE planets
(
  planet_id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies NOT NULL
);

CREATE TABLE moons
(
  moon_id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  planet_id INT REFERENCES planets NOT NULL
);



INSERT INTO galaxies
  (galaxy_name)
VALUES
  ('Milky Way');



INSERT INTO planets
  (planet_name, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1),
  ('Mars', 1.88, 'The Sun', 1),
  ('Venus', 0.62, 'The Sun', 1),
  ('Neptune', 164.8, 'The Sun', 1),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1);



INSERT INTO moons
  (moon_name, planet_id)
VALUES
  ('The Moon',(SELECT planet_id FROM planets WHERE planet_name = 'Earth')),
  ('Phobos',(SELECT planet_id FROM planets WHERE planet_name = 'Mars')),
  ('Deimos',(SELECT planet_id FROM planets WHERE planet_name = 'Mars')),
  ('Naiad',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')),
  ('Thalassa',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')),
  ('Despina',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')),
  ('Galatea',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Larissa',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('S/2004 N 1',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')),
  ('Proteus',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Triton',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Nereid',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Halimede',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Sao',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Laomedeia',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Psamathe',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune')), 
  ('Neso',(SELECT planet_id FROM planets WHERE planet_name = 'Neptune'));