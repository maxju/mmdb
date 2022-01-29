-- Map Text Index
create index myindex on custom_map(description) 
  indextype is ctxsys.context   
  parameters ('DATASTORE CTXSYS.DEFAULT_DATASTORE SYNC (ON COMMIT)');

-- IMG Directory
CREATE OR REPLACE DIRECTORY IMGDIR037 AS '/home/mschaibl/linuxhome/oracle/360-img/';

-- Insert Images
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

-- Generate IMG_SIG
DECLARE
imageObj ORDSYS.ORDImage;
image_sigObj ORDSYS.ORDImageSignature;
BEGIN
FOR I IN 1..4 LOOP
SELECT image, image_sig INTO imageObj, image_sigObj
FROM location WHERE id=I FOR UPDATE;
-- generate a signature
image_sigObj.generateSignature(imageObj);
UPDATE location SET image_sig = image_sigObj WHERE id =I;
END LOOP;
COMMIT;
END;
/

-- VID Directory
CREATE OR REPLACE DIRECTORY VIDDIR037 AS '/home/mschaibl/linuxhome/oracle/360-video/';

-- Insert Videos
videoObj ORDSYS.ORDVideo;
ctx RAW(4000) := NULL;
videoObj.setSource('file','VIDDIR037', I || '.mp4');
videoObj.import(ctx);
UDATE location SET video_360 = videoObj WHERE id = 5;
