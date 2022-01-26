CREATE TABLE custom_user
( id number(10) NOT NULL CONSTRAINT custom_user_pk PRIMARY KEY,
  username varchar2(50) NOT NULL,
  email varchar2(50),
  password varchar2(255),
  PRIMARY KEY(id)
);