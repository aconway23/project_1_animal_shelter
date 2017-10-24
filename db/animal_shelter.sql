DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;


CREATE TABLE owners (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  review_date DATE,
  address varchar(255),
  email varchar(255),
  phone varchar(40)
);

CREATE TABLE animals (
  id serial4 primary key,
  name varchar(255),
  city varchar(255),
  admis_date DATE,
  adopt_date DATE,
  breed varchar(255),
  adopted_by int4 references owners(id),
  adoptable boolean

);
