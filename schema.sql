/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered bool,
    weight_kg decimal(5, 2)
);

ALTER TABLE animals
ADD species varchar(100);

CREATE TABLE owners(
    id SERIAL PRIMARY KEY,
    full_name varchar(100),
    age int
);

CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name varchar(100)
);

ALTER TABLE animals
ADD PRIMARY KEY (id);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id int;

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals
ADD owner_id int;

ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    age int,
    date_of_graduation date
);

CREATE TABLE specializations (
  id serial,
  vet_id int NOT NULL,
  species_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  id serial,
  animal_id int NOT NULL,
  vet_id int NOT NULL,
  date_of_visit date,
  PRIMARY KEY (id),
  FOREIGN KEY (animal_id) REFERENCES animals(id),
  FOREIGN KEY (vet_id) REFERENCES vets(id)
);
