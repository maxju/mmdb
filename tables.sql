--- DROP TABLES
DROP TABLE custom_user CASCADE CONSTRAINTS;
DROP TABLE custom_map CASCADE CONSTRAINTS;
DROP TABLE country CASCADE CONSTRAINTS;
DROP TABLE location CASCADE CONSTRAINTS;
DROP TABLE location_map_rel CASCADE CONSTRAINTS;
DROP TABLE game CASCADE CONSTRAINTS;
DROP TABLE game_location_rel CASCADE CONSTRAINTS;
DROP TABLE user_game_rel CASCADE CONSTRAINTS;

--- USER
CREATE TABLE custom_user
( id number(10) NOT NULL CONSTRAINT custom_user_pk PRIMARY KEY,
  username varchar2(50) NOT NULL,
  email varchar2(50),
  password varchar2(255)
);
--- MAP
CREATE TABLE custom_map
( id NUMBER(10) NOT NULL,
  PRIMARY KEY(id),
  title varchar2(100) NOT NULL,
  description varchar2(1000),
  hits NUMBER(38) DEFAULT 0,
  modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  custom_user_id NUMBER(10) NOT NULL,
  FOREIGN KEY(custom_user_id) REFERENCES custom_user(id)
);

--- COUNTRY
CREATE TABLE country (
    id number(10) NOT NULL CONSTRAINT country_pk PRIMARY KEY,
    country_name varchar2(50) NOT NULL,
    flag ORDSYS.ORDImage,
    flag_sig ORDSYS.ORDImageSignature
);

--- LOCATION
CREATE TABLE location
( id NUMBER(10) NOT NULL,
    primary key(id),
    country_id NUMBER(10),
    FOREIGN KEY(country_id) REFERENCES country(id),
    latitude NUMBER(9,6) NOT NULL,
    longitude NUMBER(9,6) NOT NULL,
    image_360 ORDSYS.ORDImage,
    image_360_sig ORDSYS.ORDImageSignature,
    video_360 ORDSYS.ORDVideo
);

-- Relationship location-map: MANY TO MANY
CREATE TABLE location_map_rel (
    location_id NUMBER(10) NOT NULL REFERENCES location(id),
    custom_map_id NUMBER(10) NOT NULL REFERENCES custom_map(id),
    primary key(location_id, custom_map_id)
);

--- GAME
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
    score NUMBER(38) NOT NULL
);