CREATE DATABASE catalog;

CREATE TABLE authors(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  name VARCHAR(100),
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  archived BOOLEAN,
  author_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

--- Create database for book and item --------

CREATE TABLE labels(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  color VARCHAR(100) NOT NULL
);

CREATE TABLE books(
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  publisher VARCHAR(100) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  CONSTRAINT FK_bookId FOREIGN KEY(id) REFERENCES labels(id)
);


CREATE TABLE movies (
  id  INT,
  silet BOOLEAN,
  FOREIGN KEY(id) REFERENCES sources(id)
);

CREATE TABLE sources (
  id  INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);
