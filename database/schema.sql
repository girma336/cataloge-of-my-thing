DROP TABLE IF EXISTS genre
CREATE TABLE genre (
    id SERIAL NOT NULL PRIMARY key,
    name VARCHAR(100) NOT NULL
)

DROP TABLE IF EXISTS itemType
CREATE TABLE itemType (
    id SERIAL NOT NULL PRIMARY key,
    name VARCHAR(100),
)

DROP TABLE IF EXISTS item
CREATE TABLE item(
    id SERIAL NOT NULL PRIMARY key,
    publish_date DATA NOT NULL,
    archived BOOLEAN
    genre_id INT,
    CONSTRAINT fk_genre_id FOREIGN KEY(genre_id) REFERENCES genre(id),
    item_type_id INT,
    CONSTRAINT fk_itemtype_id FOREIGN KEY(item_type_id) REFERENCES itemType(id)
)

CREATE INDEX kfk_genre ON item(genre_id);
CREATE INDEX Kfk_item_type ON item(item_type_id);

