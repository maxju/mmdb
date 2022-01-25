CREATE TABLE custom_user
( id number(10) NOT NULL CONSTRAINT custom_user_pk PRIMARY KEY,
  username varchar2(50) NOT NULL,
  email varchar2(50),
  password varchar2(255),
  PRIMARY KEY(id)
);

CREATE TABLE map
( id NUMBER(10) NOT NULL CONSTRAINT map_pk PRIMARY KEY,
  title varchar2(100) NOT NULL,
  description varchar2(1000),
  hits NUMBER(38) DEFAULT 0,
  modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO map VALUES ( 1, 'My first Map', 'Weiterhin sind – entgegen der Dokumentation – erstellte Indizes nicht immer case-insensitive.
Um explizit einen case-insensitive Index zu erstellen gehen Sie wie folgt vor.' , DEFAULT, DEFAULT, DEFAULT);
INSERT INTO map VALUES ( 2, 'The fox jumped over the dog' );
INSERT INTO map VALUES ( 3, 'The cow barked like a dog' );
INSERT INTO map VALUES ( 4, 'The mouse cheeped and left the house' );

create index myindex on map(description) 
  indextype is ctxsys.context 
  parameters ('DATASTORE CTXSYS.DEFAULT_DATASTORE');


DROP INDEX myindex

DROP TABLE map