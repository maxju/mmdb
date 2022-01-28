-- INSERT STATEMENTS

-- User
INSERT INTO custom_user VALUES ( 1, 'tom', 'tom@mail.com' , 'hashed' );
INSERT INTO custom_user VALUES ( 2, 'crazy_martin', 'martin@mail.com' , 'hashed' );

-- Country
INSERT INTO country VALUES (1, 'Deutschland', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT);
INSERT INTO country VALUES (2, 'Spanien', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT);
INSERT INTO country VALUES (3, 'Brasilien', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT);
INSERT INTO country VALUES (4, 'Frankreich', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT);

-- Map
INSERT INTO custom_map VALUES ( 1, 'My first Map', 'Diese Sammlung von Orten sollte sowohl Jung als auch Alt zum grübeln bringen. Viel Spaß mit diesem Geniestreich!', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO custom_map VALUES ( 2, 'Die große Herausforderung' , 'Wer eine gehörige Portion Mut mitbringt, könnte diese große Herausforderung schaffen.', DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO custom_map VALUES ( 3, 'Spanien', 'Weite Steppen, einige Bäume und vor allem eine Unmenge an kniffligen Orten warten in dieser Map auf euch.', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO custom_map VALUES ( 4, 'Leipzig', 'Ah ja, Leipzig. Warum auch nicht?', DEFAULT, DEFAULT, DEFAULT, 1);

-- Location
-- Location Objects
    INSERT INTO location VALUES (1, 1, 22.343566, 76.867868, NULL, NULL, NULL);
    INSERT INTO location VALUES (2, 2, 55.343566, 9.476657, ORDSYS.ORDImage().init(), ORDSYS.ORDImageSignature.init(), NULL);
    INSERT INTO location VALUES (3, 4, 44.343566, 0.564456, ORDSYS.ORDImage().init(), ORDSYS.ORDImageSignature.init(), NULL);
    INSERT INTO location VALUES (4, 2, 11.343566, -89.756756, ORDSYS.ORDImage().init(), ORDSYS.ORDImageSignature.init(), NULL);
    INSERT INTO location VALUES (5, 3, -45.343566, 0.888756, NULL, NULL, ORDSYS.ORDVideo().init());
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

-- Gernerate IMG_SIG
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

-- Insert Videos
videoObj ORDSYS.ORDVideo;
ctx RAW(4000) := NULL;
videoObj.setSource('file','VIDDIR037', I || '.mp4');
videoObj.import(ctx);
UDATE location SET video_360 = videoObj WHERE id = 5;





-- User plays game
-- Game and relationships
INSERT INTO game VALUES (1, 1)
INSERT INTO game_location_rel VALUES(1, 1);
INSERT INTO game_location_rel VALUES(1, 2);
INSERT INTO game_location_rel VALUES(1, 3);
INSERT INTO game_location_rel VALUES(1, 4);
INSERT INTO game_location_rel VALUES(1, 5);
--Game score
INSERT INTO user_game_rel VALUES(1,1,7566);