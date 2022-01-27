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

-- Relationship user-game-score: MANY TO MANY
CREATE TABLE user_game_rel (
    custom_user_id NUMBER(10) NOT NULL REFERENCES custom_user(id),
    game_id NUMBER(10) NOT NULL REFERENCES game(id),
    primary key(custom_user_id, game_id),
    score NUMBER(38) NOT NULL,
);