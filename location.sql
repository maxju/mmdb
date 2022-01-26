CREATE TABLE location
( id NUMBER(10) NOT NULL CONSTRAINT location_pk PRIMARY KEY,
  latitude NUMBER(9,6) NOT NULL,
  longitude NUMBER(9,6) NOT NULL,
  CONSTRAINT fk_map
    FOREIGN KEY (map_pk)
    REFERENCES map(id)
);