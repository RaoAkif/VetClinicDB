/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(1, 'Agumon', '02-03-2020', 0, true, 10.23);

INSERT INTO animals
VALUES(2, 'Gabumon', '11-15-2018', 2, true, 8);

INSERT INTO animals
VALUES(3, 'Pikachu', '01-07-2021', 1, false, 15.04);

INSERT INTO animals
VALUES(4, 'Devimon', '05-12-2021', 5, true, 11);

INSERT INTO animals
VALUES(5, 'Charmander', '02-08-2020', 0, false, 11);

INSERT INTO animals
VALUES(6, 'Plantmon', '11-15-2021', 2, true, 5.7);

INSERT INTO animals
VALUES(7, 'Squirtle', '04-02-1993', 3, false, 12.13);

INSERT INTO animals
VALUES(8, 'Angemon', '06-12-2005', 1, true, 45);

INSERT INTO animals
VALUES(9, 'Boarmon', '06-07-2005', 7, true, 20.04);

INSERT INTO animals
VALUES(10, 'Blossom', '10-13-1998', 3, true, 17);

INSERT INTO animals
VALUES(11, 'Ditto', '05-14-2022', 4, true, 22);

INSERT INTO owners (id, full_name, age)
VALUES(1, 'Sam Smith', 34);

INSERT INTO owners
VALUES(2, 'Jennifer Orwell', 19);

INSERT INTO owners
VALUES(3, 'Bob', 45);

INSERT INTO owners
VALUES(4, 'Melody Pond', 77);

INSERT INTO owners
VALUES(5, 'Dean Winchester', 14);

INSERT INTO owners
VALUES(6, 'Jodie Whittaker', 38);

INSERT INTO species (id, name)
VALUES(1, 'Pokemon');

INSERT INTO species
VALUES(2, 'Digimon');

UPDATE animals
SET species_id = 1
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon';

UPDATE animals
SET species_id = 2
WHERE name NOT LIKE '%mon';

UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';
