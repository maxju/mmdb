CREATE TABLE game (
    id number(10) NOT NULL CONSTRAINT game_pk PRIMARY KEY,
    map_id NUMBER(10) NOT NULL,
    FOREIGN KEY (map_id) REFERENCES (map)    
);

-- Relationship game-location: MANY TO MANY
CREATE TABLE game_location_rel (
     game_id NUMBER(10) NOT NULL REFERENCES game(id),
     location_id NUMBER(10) NOT NULL REFERENCES location(id),
     primary key(game_id, location_id)
);