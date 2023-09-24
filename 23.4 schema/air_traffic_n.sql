-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE countries
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE cities
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE
);

CREATE TABLE customers
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE flights
(
    id SERIAL PRIMARY KEY,
    airline_id INTEGER NOT NULL REFERENCES airlines ON DELETE CASCADE,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    origin_id INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE,
    destination_id INTEGER NOT NULL REFERENCES cities ON DELETE CASCADE
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers ON DELETE SET NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER NOT NULL REFERENCES flights ON DELETE SET NULL
);

INSERT INTO countries
    (name)
VALUES
    ('United States'),
    ('Japan'),
    ('France'),
    ('China'),
    ('Brazil'),
    ('United Kingdom'),
    ('Mexico'),
    ('Morocco'),
    ('Chile'),
    ('UAE');

INSERT INTO cities
    (name, country_id)
VALUES
    ('Washington DC', 1),
    ('Seattle', 1),
    ('Tokyo', 2),
    ('London', 6),
    ('Los Angeles', 1),
    ('Las Vegas', 1),
    ('Mexico City', 7),
    ('Paris', 3),
    ('Casablanca', 8),
    ('Dubai', 10),
    ('Beijing', 4),
    ('New York', 1),
    ('Charlotte', 1),
    ('Cedar Rapids', 1),
    ('Chicago', 1),
    ('New Orleans', 1),
    ('Sao Paolo', 5),
    ('Santiago', 9);

INSERT INTO customers
    (first_name, last_name)
VALUES
    ('Jennifer', 'Finch'),
    ('Thadeus', 'Gathercoal'),
    ('Sonja', 'Pauley'),
    ('Wanneta', 'Skeleton'),
    ('Berkie', 'Wycliff'),
    ('Alvin', 'Leathes'),
    ('Cory', 'Squibbes');

INSERT INTO airlines
    (name)
VALUES
    ('United'),
    ('British Airways'),
    ('Delta'),
    ('TUI Fly Belgium'),
    ('Air China'),
    ('American Airlines'),
    ('Avianca Brasil');

INSERT INTO flights
    (airline_id, departure_time, arrival_time, origin_id, destination_id)
VALUES
    (1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2),
    (2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 3, 4),
    (3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 6),
    (3, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 7),
    (4, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 8, 9),
    (5, '2018-10-31 01:15:00', '2018-10-31 12:55:00', 10, 11),
    (1, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 12, 13),
    (6, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 14, 15),
    (6, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 13, 16),
    (7, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 18);

INSERT INTO tickets
    (customer_id, seat, flight_id)
VALUES
    (1, '33B', 1),
    (2, '8A', 2),
    (3, '12F', 3),
    (1, '20A', 4),
    (4, '23D', 5),
    (2, '18C', 6),
    (5, '9E', 7),
    (6, '1A', 8),
    (5, '32B', 9),
    (7, '10D', 10);