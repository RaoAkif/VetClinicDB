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

INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45, '04-23-2000');

INSERT INTO vets (name, age, date_of_graduation)
VALUES('Maisy Smith', 26, '01-17-2019');

INSERT INTO vets (name, age, date_of_graduation)
VALUES('Stephanie Mendez', 64, '05-04-1981');

INSERT INTO vets (name, age, date_of_graduation)
VALUES('Jack Harkness', 38, '06-08-2008');

INSERT INTO specializations (vet_id, species_id)
VALUES(1, 1);

INSERT INTO specializations (vet_id, species_id)
VALUES(3, 1);

INSERT INTO specializations (vet_id, species_id)
VALUES(3, 2);

INSERT INTO specializations (vet_id, species_id)
VALUES(4, 2);

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 1, '05-24-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 3, '07-22-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(2, 4, '02-02-2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(3, 2, '01-05-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(3, 2, '03-08-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(3, 2, '05-14-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(4, 3, '05-04-2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 4, '02-24-2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 2, '12-21-2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 1, '08-10-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 2, '04-07-2021');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 3, '09-29-2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(8, 4, '10-03-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(8, 4, '11-04-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(9, 2, '01-24-2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(9, 2, '05-15-2019');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(9, 2, '02-27-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(9, 2, '08-03-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(10, 3, '05-24-2020');

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(10, 1, '01-11-2021');
