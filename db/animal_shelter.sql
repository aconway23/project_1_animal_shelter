DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  review_date DATE,
  address varchar(255),
  email varchar(255),
  phone varchar(40)
);
