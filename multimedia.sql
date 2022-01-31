-- Map Text Index
create index myindex on custom_map(description) 
  indextype is ctxsys.context   
  parameters ('DATASTORE CTXSYS.DEFAULT_DATASTORE SYNC (ON COMMIT)');

-- IMG Directory
CREATE OR REPLACE DIRECTORY IMGDIR037 AS '/home/mschaibl/linuxhome/oracle/360-img/';

CREATE OR REPLACE DIRECTORY FLAGDIR037 AS '/home/mschaibl/linuxhome/oracle/flags/';


-- Insert Images Location
DECLARE
imageObj ORDSYS.ORDImage;
ctx RAW(4000) := NULL;
BEGIN
FOR I IN 1..4 LOOP
SELECT image_360 INTO imageObj FROM location WHERE id = I for UPDATE;
imageObj.setSource('file','IMGDIR037', I || '.jpg');
imageObj.import(ctx);
UPDATE location SET image_360 = imageObj WHERE id = I;
END LOOP;
COMMIT;
END;
/

-- Generate IMG_SIG Location
DECLARE
imageObj ORDSYS.ORDImage;
image_sigObj ORDSYS.ORDImageSignature;
BEGIN
FOR I IN 1..4 LOOP
SELECT image_360, image_360_sig INTO imageObj, image_sigObj
FROM location WHERE id=I FOR UPDATE;
-- generate a signature
image_sigObj.generateSignature(imageObj);
UPDATE location SET image_360_sig = image_sigObj WHERE id =I;
END LOOP;
COMMIT;
END;
/

-- Insert Images Country
DECLARE
imageObj ORDSYS.ORDImage;
ctx RAW(4000) := NULL;
BEGIN
FOR I IN 1..4 LOOP
SELECT flag INTO imageObj FROM country WHERE id = I for UPDATE;
imageObj.setSource('file','FLAGDIR037', I || '.jpg');
imageObj.import(ctx);
UPDATE country SET flag = imageObj WHERE id = I;
END LOOP;
COMMIT;
END;
/

-- Generate IMG_SIG Country
DECLARE
imageObj ORDSYS.ORDImage;
image_sigObj ORDSYS.ORDImageSignature;
BEGIN
FOR I IN 1..4 LOOP
SELECT flag, flag_sig INTO imageObj, image_sigObj
FROM country WHERE id=I FOR UPDATE;
-- generate a signature
image_sigObj.generateSignature(imageObj);
UPDATE country SET flag_sig = image_sigObj WHERE id =I;
END LOOP;
COMMIT;
END;
/


-- VID Directory
CREATE OR REPLACE DIRECTORY VIDDIR037 AS '/home/mschaibl/linuxhome/oracle/360-vid/';

    -- Insert Videos
    DECLARE
    videoObj ORDSYS.ORDVideo;
    ctx RAW(4000) := NULL;
    BEGIN
    SELECT video_360 INTO videoObj FROM location WHERE id=5 FOR UPDATE;
    videoObj.setSource('file','VIDDIR037', '2.mpg');
    videoObj.import(ctx);
    videoObj.setProperties(ctx);
    UPDATE location SET video_360 = videoObj WHERE id = 5;
    END;
    /