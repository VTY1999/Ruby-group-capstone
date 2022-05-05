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
