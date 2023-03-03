CREATE DATABASE catalog;

DROP TABLE IF EXISTS labels
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(200) NOT NULL
)

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR(200) NOT NULL,
  cover_state VARCHAR(200) NOT NULL,
  item_id INT,
  FOREIGN KEY (item_id) REFERENCES item(id) 
)

DROP TABLE IF EXISTS genre
CREATE TABLE genre (
  id SERIAL  PRIMARY key,
  name VARCHAR(100) NOT NULL
)

DROP TABLE IF EXISTS musicalbum
CREATE TABLE musicalbum (
  id SERIAL  PRIMARY key,
  on_spotify BOOLEAN,
  item_id INT,
  FOREIGN KEY (item_id) REFERENCES item(id) 
)

DROP TABLE IF EXISTS item
CREATE TABLE item(
  id SERIAL  PRIMARY key,
  publish_date DATA NOT NULL,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_genre_id FOREIGN KEY(genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)  
)

DROP TABLE IF EXISTS authors 
CREATE TABLE authors (
  id SERIAL PRIMARY KEY, 
  first_name VARCHAR(100) NOT NULL
  last_name VARCHAR(100) NOT NULL
)

DROP TABLE IF EXISTS games
CREATE TABLE games (
  id SERIAL PRIMARY key,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE, NOT NULL,
  author_id INT REFERENCES authors(id)
)

CREATE INDEX labels_index ON item(label_id);
CREATE INDEX genres_index ON item(genre_id);
CREATE INDEX authers_index ON item(author_id)

