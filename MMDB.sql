CREATE TABLE custom_user
( id number(10) NOT NULL,
  username varchar2(50) NOT NULL,
  email varchar2(50),
  password varchar2(255),
  PRIMARY KEY(id)
);

CREATE TABLE map
( id NUMBER(10) NOT NULL,
  title varchar2(100) NOT NULL,
  description text(1000),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  views integer,
  PRIMARY KEY(id)
);