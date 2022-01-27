CREATE TABLE game (
    id number(10) NOT NULL CONSTRAINT game_pk PRIMARY KEY,
    custom_map_id NUMBER(10) NOT NULL,
    FOREIGN KEY (custom_map_id) REFERENCES custom_map(id)    
);

-- Relationship game-location: MANY TO MANY
CREATE TABLE game_location_rel (
     game_id NUMBER(10) NOT NULL REFERENCES game(id),
     location_id NUMBER(10) NOT NULL REFERENCES location(id),
     primary key(game_id, location_id)
);