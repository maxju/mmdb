-- Table: custom_map
-- Full Text Description
SELECT description FROM custom_map WHERE CONTAINS ( description, 'Jung Alt' ) > 0;
SELECT description FROM custom_map WHERE CONTAINS ( description, 'Jung and Alt' ) > 0;


-- Table Location
-- Images

-- Get Image Height 
SELECT id, p.image_360.getHeight() as height, p.image_360.getFileFormat() as format
FROM location p WHERE id=1;

-- Get Image Size
SELECT id, p.image_360.getContentLength() as contentLength, p.image_360.getFileFormat() as format
FROM location p WHERE id=1;
 

-- Compare Images
SELECT Q.id, ORDSYS.IMGScore(123) SCORE
FROM location Q, location E
WHERE E.id=1 AND Q.id != E.id
AND ORDSYS.IMGSimilar(Q.image_360_sig, E.image_360_sig,
'color="1"', 100, 123) = 1 ORDER BY SCORE ASC;


SELECT Q.id, ORDSYS.IMGScore(123) SCORE
FROM location Q, location E
WHERE E.id=1 AND Q.id != E.id
AND ORDSYS.IMGSimilar(Q.image_360_sig, E.image_360_sig,
'color="0.5" location="0.1" shape="0.2" texture="0.2"', 100, 123) = 1 ORDER BY SCORE ASC;


-- Select only high res videos
SELECT id, loc.video_360.getFrameResolution() as resolution
FROM location loc WHERE id=5;


SELECT id, loc.video_360.getFrameSize(width, height) as width
FROM location loc WHERE id=5;

SELECT id, loc.video_360.getMimeType() as mimeType,
loc.video_360.getFormat() as format
FROM location loc WHERE id=5;


-- Resolution script
DECLARE
 obj ORDSYS.ORDVideo;
 res INTEGER;
BEGIN
 SELECT loc.video_360 INTO obj FROM location loc 
  WHERE id  = 5;
 res := obj.getFrameResolution();
 DBMS_OUTPUT.PUT_LINE('test');
 DBMS_OUTPUT.PUT_LINE('resolution : ' ||res);
 COMMIT;
END;
/
