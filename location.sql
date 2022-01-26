DROP TABLE location;

CREATE TABLE location
( id NUMBER(10) NOT NULL,
  PRIMARY KEY(id),
  map_id NUMBER(10) NOT NULL,
  FOREIGN KEY(custom_map_id) REFERENCES custom_map(id),
  latitude NUMBER(9,6) NOT NULL,
  longitude NUMBER(9,6) NOT NULL
);

INSERT INTO location VALUES (1, 1, 22.343566, 0.564456);