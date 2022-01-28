DROP TABLE location;

CREATE TABLE location
( id NUMBER(10) NOT NULL,
    primary key(id),
    country_id NUMBER(10),
    FOREIGN KEY(country_id) REFERENCES country(id),
    latitude NUMBER(9,6) NOT NULL,
    longitude NUMBER(9,6) NOT NULL,
    image_360 ORDSYS.ORDImage,
    image_360_sig ORDSYS.ORDImageSignature,
    video360 ORDSYS.ORDVideo
);

-- Relationship location-map: MANY TO MANY
CREATE TABLE location_map_rel (
    location_id NUMBER(10) NOT NULL REFERENCES location(id),
    custom_map_id NUMBER(10) NOT NULL REFERENCES custom_map(id),
    primary key(location_id, custom_map_id)
);


-- Compare Pictures

SELECT Q.id, ORDSYS.IMGScore(123) SCORE
FROM location Q, location E
WHERE E.id=0 AND Q.id != E.id
AND ORDSYS.IMGSimilar(Q.image_sig, E.image_sig,
'color="<color>" location="<location>" shape="<shape>" texture="<texture>"',
<threshold>, 123) = 1 ORDER BY SCORE ASC;
