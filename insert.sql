-- INSERT STATEMENTS

-- User
INSERT INTO custom_user VALUES ( 1, 'tom', 'tom@mail.com' , 'hashed' );
INSERT INTO custom_user VALUES ( 2, 'crazy_martin', 'martin@mail.com' , 'hashed' );

-- Country
INSERT INTO country VALUES (1, 'Deutschland', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init());
INSERT INTO country VALUES (2, 'Spanien', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init());
INSERT INTO country VALUES (3, 'Brasilien', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init());
INSERT INTO country VALUES (4, 'Frankreich', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init());

-- Map
INSERT INTO custom_map VALUES ( 1, 'My first Map', 'Diese Sammlung von Orten sollte sowohl Jung als auch Alt zum Grübeln bringen. Viel Spaß mit diesem Geniestreich!', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO custom_map VALUES ( 2, 'Die große Herausforderung' , 'Wer eine gehörige Portion Mut mitbringt, könnte diese große Herausforderung schaffen.', DEFAULT, DEFAULT, DEFAULT, 1);
INSERT INTO custom_map VALUES ( 3, 'Spanien', 'Weite Steppen, einige Bäume und vor allem eine Unmenge an kniffligen Orten warten in dieser Map auf euch.', DEFAULT, DEFAULT, DEFAULT, 2);
INSERT INTO custom_map VALUES ( 4, 'Leipzig', 'Ah ja, Leipzig. Warum auch nicht?', DEFAULT, DEFAULT, DEFAULT, 1);

-- Location
-- Location Objects
INSERT INTO location VALUES (1, 1, 22.343566, 76.867868, ORDSYS.ORDImage.init(), ORDSYS.ORDImageSignature.init(), NULL);
INSERT INTO location VALUES (2, 2, 55.343566, 9.476657, ORDSYS.ORDImage.init(), ORDSYS.ORDImageSignature.init(), NULL);
INSERT INTO location VALUES (3, 4, 44.343566, 0.564456, ORDSYS.ORDImage.init(), ORDSYS.ORDImageSignature.init(), NULL);
INSERT INTO location VALUES (4, 2, 11.343566, -89.756756, ORDSYS.ORDImage.init(), ORDSYS.ORDImageSignature.init(), NULL);
INSERT INTO location VALUES (5, 3, -45.343566, 0.888756, NULL, NULL, ORDSYS.ORDVideo.init());

-- User plays game
-- Game and relationships
INSERT INTO game VALUES (1, 1);
INSERT INTO game_location_rel VALUES(1, 1);
INSERT INTO game_location_rel VALUES(1, 2);
INSERT INTO game_location_rel VALUES(1, 3);
INSERT INTO game_location_rel VALUES(1, 4);
INSERT INTO game_location_rel VALUES(1, 5);
--Game score
INSERT INTO user_game_rel VALUES(1,1,7566);