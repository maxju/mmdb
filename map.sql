CREATE OR REPLACE DIRECTORY IMGDIR021 AS '/home/mschaibl/oracle/360';

DROP INDEX myindex
DROP TABLE custom_map
DROP TABLE map
DROP TABLE custom_map,custom_user,location;

CREATE TABLE custom_map
( id NUMBER(10) NOT NULL,
  PRIMARY KEY(id),
  title varchar2(100) NOT NULL,
  description varchar2(1000),
  image ORDSYS.ORDImage,
  image_sig ORDSYS.ORDImageSignature,
  hits NUMBER(38) DEFAULT 0,
  modified TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  custom_user_id NUMBER(10) NOT NULL,
  FOREIGN KEY(custom_user_id) REFERENCES custom_user(id)
);

INSERT INTO custom_map VALUES ( 1, 'My first Map', 'Diese Sammlung von Orten sollte sowohl Jung als auch Alt zum grübeln bringen. Viel Spaß mit diesem Geniestreich!', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO custom_map VALUES ( 2, 'Die große Herausforderung' , 'Wer eine gehörige Portion Mut mitbringt, könnte diese große Herausforderung schaffen.', DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO custom_map VALUES ( 3, 'Spanien', 'Weite Steppen, einige Bäume und vor allem eine Unmenge an kniffligen Orten warten in dieser Map auf euch.', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO custom_map VALUES ( 4, 'Leipzig', 'Ah ja, Leipzig. Warum auch nicht?', DEFAULT, DEFAULT, DEFAULT, 1);

create index myindex on custom_map(description) 
  indextype is ctxsys.context 
  parameters ('DATASTORE CTXSYS.DEFAULT_DATASTORE SYNC (ON COMMIT)');

SELECT description FROM custom_map WHERE CONTAINS ( description, 'Jung Alt' ) > 0;
SELECT description FROM custom_map WHERE CONTAINS ( description, 'Jung and Alt' ) > 0;


DECLARE
imageObj ORDSYS.ORDImage;
ctx RAW(4000) := NULL;
BEGIN
FOR I IN 1..1 LOOP
SELECT image INTO imageObj FROM custom_map WHERE id = I for UPDATE;
imageObj.setSource('file','IMGDIR021', I || '.jpg');
imageObj.import(ctx);
UPDATE custom_map SET image = imageObj WHERE id = I;
END LOOP;
COMMIT;
END;
/


DECLARE
-- application variables
imageObj ORDSYS.ORDImage;
ctx RAW(4000) := NULL;
fileName VARCHAR(20);
BEGIN
FOR I IN 1..[ANZAHL DER ZU LADENDEN BILDER, z.B. 227] LOOP
fileName := 'picture';
IF I < 100 THEN
fileName := fileName || '0';
END IF;
IF I < 10 THEN
fileName := fileName || '0';
END IF;
INSERT INTO custom_map
VALUES ( I, ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init() );
-- Select the newly inserted row for update
SELECT image INTO custom_map FROM photos WHERE id = I for UPDATE;
-- fill in the image BLOB.
-- This example imports the image from the IMGDIR
-- directory on a local file system
-- (srcType=FILE) and automatically sets the properties.
imageObj.setSource('file','IMGDIR021',fileName || I || '.jpg');
imageObj.import(ctx);
UPDATE photos SET image = imageObj WHERE id = I;
END LOOP;
COMMIT;
-- Continue processing
END;
/