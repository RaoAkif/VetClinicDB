/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered bool,
    weight_kg decimal(5, 2));

ALTER TABLE animals
ADD species varchar(100);
