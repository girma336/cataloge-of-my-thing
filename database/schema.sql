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
  CONSTRAINT fk_genre_id FOREIGN KEY(genre_id) REFERENCES genre(id),
  musicalbum_id INT,
  CONSTRAINT fk_musicalbum_id FOREIGN KEY(musicalbum_id) REFERENCES musicalbum(id),
  author_id INT,
  FOREIGN KEY (author_id) REFERENCES authors(id),
  label_id INT,
  FOREIGN KEY (label_id) REFERENCES labels(id)  
)

CREATE INDEX labels_id_asc ON labels(id ASC);
CREATE INDEX kfk_genre ON item(genre_id);
CREATE INDEX Kfk_item_type ON item(item_type_id);
