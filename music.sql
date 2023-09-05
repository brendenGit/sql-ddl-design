-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  artist_id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

CREATE TABLE producers
(
  producer_id SERIAL PRIMARY KEY,
  producer_name TEXT NOT NULL
);

CREATE TABLE albums
(
  album_id SERIAL PRIMARY KEY,
  album_title TEXT,
  artist_id INT REFERENCES artists,
  producer_id INT REFERENCES producers
);

CREATE TABLE songs
(
  song_id SERIAL PRIMARY KEY,
  song_title TEXT NOT NULL,
  album_id INT REFERENCES albums NOT NULL,
  featured_artist INT REFERENCES artists,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);


INSERT INTO artists
  (artist_name)
VALUES
  ('Queen');

INSERT INTO producers
  (producer_name)
VALUES
  ('Roy Thomas Baker');

INSERT INTO albums
  (album_title, artist_id, producer_id)
VALUES
  ('A Night at the Opera',1,1);

INSERT INTO songs
  (song_title, album_id, duration_in_seconds, release_date)
VALUES
  ('A Night at the Opera',1, 238,'04-15-1997');
