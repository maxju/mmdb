CREATE TABLE location
( id NUMBER(10) NOT NULL CONSTRAINT location_pk PRIMARY KEY,
  latitude NUMBER(9,6) NOT NULL,
  longitude NUMBER(9,6) NOT NULL,
  CONSTRAINT fk_map
    FOREIGN KEY (map_id)
    REFERENCES map(id)
);


INSERT INTO map VALUES ( 1, 'My first Map', 'Diese Sammlung von Orten sollte sowohl Jung als auch Alt zum grübeln bringen. Viel Spaß mit diesem Geniestreich!' , DEFAULT, DEFAULT, DEFAULT);
