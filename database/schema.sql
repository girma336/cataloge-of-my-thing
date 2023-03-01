DROP TABLE IF EXISTS labels
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  color VARCHAR(200) NOT NULL
)

DROP TABLE IF EXISTS books
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)  
)

DROP TABLE IF EXISTS genre
CREATE TABLE genre (
    id SERIAL  PRIMARY key,
    name VARCHAR(100) NOT NULL
)

DROP TABLE IF EXISTS itemType
CREATE TABLE itemType (
    id SERIAL  PRIMARY key,
    name VARCHAR(100)
)

DROP TABLE IF EXISTS item
CREATE TABLE item(
    id SERIAL  PRIMARY key,
    publish_date DATA NOT NULL,
    archived BOOLEAN,
    genre_id INT,
    CONSTRAINT fk_genre_id FOREIGN KEY(genre_id) REFERENCES genre(id),
    item_type_id INT,
    CONSTRAINT fk_itemtype_id FOREIGN KEY(item_type_id) REFERENCES itemType(id),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    label_id INT,
    FOREIGN KEY (label_id) REFERENCES labels(id)  
)

CREATE INDEX labels_id_asc ON labels(id ASC);
CREATE INDEX kfk_genre ON item(genre_id);
CREATE INDEX Kfk_item_type ON item(item_type_id);
