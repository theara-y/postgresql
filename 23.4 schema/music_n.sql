DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL REFERENCES albums ON DELETE CASCADE
);

CREATE TABLE album_producer
(
    id SERIAL PRIMARY KEY,
    album_id INTEGER NOT NULL REFERENCES albums ON DELETE CASCADE,
    producer_id INTEGER NOT NULL REFERENCES producers ON DELETE CASCADE
);

CREATE TABLE song_artist
(
  id SERIAL PRIMARY KEY,
  song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
  artist_id INTEGER NOT NULL REFERENCES artists ON DELETE CASCADE
);

INSERT INTO artists
    (name)
VALUES
    ('Hanson'),
    ('Queen'),
    ('Mariah Carey'),
    ('Boyz II Men'),
    ('Lady Gaga'),
    ('Bradley Cooper'),
    ('Nickelback'),
    ('Jay Z'),
    ('Alicia Keys'),
    ('Katy Perry'),
    ('Juicy J'),
    ('Maroon 5'),
    ('Christina Aguilera'),
    ('Avril Lavigne'),
    ('Destiny''s Child');

INSERT INTO producers
    (name)
VALUES
    ('Dust Brothers'),
    ('Stephen Lironi'),
    ('Roy Thomas Baker'),
    ('Walter Afanasieff'),
    ('Benjamin Rice'),
    ('Rick Parashar'),
    ('Al Shux'),
    ('Max Martin'),
    ('Cirkut'),
    ('Shellback'),
    ('Benny Blanco'),
    ('The Matrix'),
    ('Darkchild');

INSERT INTO albums
    (name, release_date)
VALUES
    ('Middle of Nowhere', '04-15-1997'),
    ('A Night at the Opera', '10-31-1975'),
    ('Daydream', '11-14-1995'),
    ('A Star Is Born', '09-27-2018'),
    ('Silver Side Up', '08-21-2001'),
    ('The Blueprint 3', '10-20-2009'),
    ('Prism', '12-17-2013'),
    ('Hands All Over', '06-21-2011'),
    ('Let Go', '05-14-2002'),
    ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs
    (title, duration_in_seconds, album_id)
VALUES
    ('MMMBop', 238, 1),
    ('Bohemian Rhapsody', 355, 2),
    ('One Sweet Day', 282, 3),
    ('Shallow', 216, 4),
    ('How You Remind Me', 223, 5),
    ('New York State of Mind', 276, 6),
    ('Dark Horse', 215, 7),
    ('Moves Like Jagger', 201, 8),
    ('Complicated', 244, 9),
    ('Say My Name', 240, 10);

INSERT INTO album_producer
    (album_id, producer_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8),
    (7, 9),
    (8, 10),
    (8, 11),
    (9, 12),
    (10, 13);

INSERT INTO song_artist
    (song_id, artist_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (3, 4),
    (4, 5),
    (4, 6),
    (5, 7),
    (6, 8),
    (6, 9),
    (7, 10),
    (7, 11),
    (8, 12),
    (8, 13),
    (9, 14),
    (10, 15);