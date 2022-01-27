DROP TABLE location;

CREATE TABLE location
( id NUMBER(10) NOT NULL,
  PRIMARY KEY(id),
  custom_map_id NUMBER(10) NOT NULL,
  FOREIGN KEY(custom_map_id) REFERENCES custom_map(id),
  country_id NUMBER(10),
  FOREIGN KEY(country_id) REFERENCES country_id(id),
  latitude NUMBER(9,6) NOT NULL,
  longitude NUMBER(9,6) NOT NULL
);

-- Relationship location-map: MANY TO MANY
CREATE TABLE location_map_rel (
  location_id NUMBER(10) NOT NULL REFERENCES location(id),
  map_id NUMBER(10) NOT NULL REFERENCES map(id),
  primary key(location_id, map_id)
);

INSERT INTO location VALUES (1, 1, 2, 22.343566, 0.564456);