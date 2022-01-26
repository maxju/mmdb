CREATE TABLE country (
    id number(10) NOT NULL CONSTRAINT country_pk PRIMARY KEY,
    country_name varchar2(50) NOT NULL,
    flag ORDSYS.ORDImage,
    flag_sig ORDSYS.ORDImageSignature,
    FOREIGN KEY (location_id) REFERENCES (location)    
);

INSERT INTO country VALUES (1, 'Deutschland', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT)
INSERT INTO country VALUES (2, 'Spanien', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT)
INSERT INTO country VALUES (3, 'Brasilien', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT)
INSERT INTO country VALUES (4, 'Frankreich', ORDSYS.ORDImage.init(),ORDSYS.ORDImageSignature.init(), DEFAULT)