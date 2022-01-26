DROP INDEX myindex

DROP TABLE map

CREATE TABLE map
( id NUMBER(10) NOT NULL CONSTRAINT map_pk PRIMARY KEY,
  title varchar2(100) NOT NULL,
  description varchar2(1000),
  hits NUMBER(38) DEFAULT 0,
  modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO map VALUES ( 1, 'My first Map', 'Diese Sammlung von Orten sollte sowohl Jung als auch Alt zum grübeln bringen. Viel Spaß mit diesem Geniestreich!' , DEFAULT, DEFAULT, DEFAULT);
INSERT INTO map VALUES ( 2, 'Die große Herausforderung' , 'Wer eine gehörige Portion Mut mitbringt, könnte diese große Herausforderung schaffen.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO map VALUES ( 3, 'Spanien', 'Weite Steppen, einige Bäume und vor allem eine Unmenge an kniffligen Orten warten in dieser Map auf euch.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO map VALUES ( 4, 'Leipzig', 'Ah ja, Leipzig. Warum auch nicht?', DEFAULT, DEFAULT, DEFAULT);

create index myindex on map(description) 
  indextype is ctxsys.context 
  parameters ('DATASTORE CTXSYS.DEFAULT_DATASTORE SYNC (ON COMMIT)');

SELECT description FROM map WHERE CONTAINS ( description, 'Jung Alt' ) > 0;
SELECT description FROM map WHERE CONTAINS ( description, 'Jung and Alt' ) > 0;
