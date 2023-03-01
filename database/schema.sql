CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(200) NOT NULL
)

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)  
)

CREATE INDEX labels_id_asc ON labels(id ASC);