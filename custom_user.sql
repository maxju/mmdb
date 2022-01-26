DROP TABLE custom_user

CREATE TABLE custom_user
( id number(10) NOT NULL CONSTRAINT custom_user_pk PRIMARY KEY,
  username varchar2(50) NOT NULL,
  email varchar2(50),
  password varchar2(255)
);

INSERT INTO custom_user VALUES ( 1, 'tom', 'tom@mail.com' , 'hashed' );
INSERT INTO custom_user VALUES ( 2, 'crazy_martin', 'martin@mail.com' , 'hashed' );
