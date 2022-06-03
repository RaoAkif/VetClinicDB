/*Queries that provide answers to the questions from all projects.*/

/*Find all animals whose name ends in "mon".*/
SELECT * from animals WHERE name LIKE '%mon';

/٭List the name of all animals born between 2016 and 2019.٭/
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '01-01-2019';

/٭List the name of all animals that are neutered and have less than 3 escape attempts.٭/
SELECT name FROM animals WHERE neutered=true AND  escape_attempts BETWEEN 0 AND 3;

/٭List date of birth of all animals named either "Agumon" or "Pikachu".٭/
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

/٭List name and escape attempts of animals that weigh more than 10.5kg٭/
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5;

/٭Find all animals that are neutered.٭/
SELECT * from animals WHERE neutered=true;

/٭Find all animals not named Gabumon.٭/
SELECT * from animals WHERE name!='Gabumon';

/٭Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)٭/
SELECT * from animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;

/* TEST Transaction Start*/
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;
/* Transaction End*/

/*digimon species*/
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

/*pokemon species*/
UPDATE animals
SET species = 'pokemon'
WHERE species NOT LIKE '%mon';

/*DELETE Check*/
BEGIN;
DELETE FROM animals;
ROLLBACK;

/*DELETE Specific DOB*/
BEGIN;
DELETE FROM animals
WHERE date_of_birth >= '01-01-2022';

/*Add a SAVEPOINT*/
SAVEPOINT BORN_BEFORE_2022;

/*Add a Wrong Sign*/
UPDATE animals
SET weight_kg = weight_kg * -1;

/* Restore/Rollback to a SAVEPOINT*/
ROLLBACK TO BORN_BEFORE_2022;

/*Make a Commit*/
COMMIT;

/*How many animals are there?*/
SELECT COUNT(*)
FROM animals;

/*How many animals have never tried to escape?*/
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;

/*What is the average weight of animals?*/
SELECT AVG(weight_kg)
FROM animals;

/*Who escapes the most, neutered or not neutered animals?*/
SELECT neutered,
COUNT(escape_attempts)
FROM animals
WHERE escape_attempts > 0
GROUP BY neutered;

/*What is the minimum and maximum weight of each type of animal?*/
SELECT species,
MIN(weight_kg),
MAX(weight_kg)
FROM animals
GROUP BY species;

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth > '01-01-1990' AND date_of_birth < '01-01-2000'
GROUP BY species;

/* ----- Write queries (using JOIN) to answer the following questions: ----- */

/*What animals belong to Melody Pond?*/
SELECT animals.name FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';  

/*List of all animals that are pokemon (their type is Pokemon).*/
SELECT animals.name FROM animals
JOIN species
ON animals.species_id = species.id
WHERE species.id = 1;

/*List all owners and their animals, remember to include those that don't own any animal.*/
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

/*How many animals are there per species?*/
SELECT species.name, COUNT(*)
FROM species
JOIN animals
ON animals.species_id = species.id
GROUP BY species.name;

/*List all Digimon owned by Jennifer Orwell.*/
SELECT animals.name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
JOIN species
ON animals.species_id = species.id
WHERE species.id = 2 AND owners.full_name = 'Jennifer Orwell';

/*List all animals owned by Dean Winchester that haven't tried to escape.*/
SELECT animals.name
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/*Who owns the most animals?*/
SELECT owners.full_name
FROM owners
JOIN animals
ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY COUNT(owner_id) DESC
LIMIT 1;

/* ----Use primary key & foreign key mechanism for joining tables.---- */

/*Who was the last animal seen by William Tatcher?*/
SELECT animals.name FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC
LIMIT 1;

/*How many different animals did Stephanie Mendez see?*/
SELECT COUNT(*) FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties.*/
SELECT vets.name as vet, species.name as speciality FROM vets
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON species.id = specializations.species_id;

/*List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/
SELECT animals.name, date_of_visit FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
WHERE date_of_visit > '04-01-2020' AND date_of_visit < '08-30-2020'
ORDER BY visits.date_of_visit ASC;


/*What animal has the most visits to vets?*/
SELECT animals.name, COUNT(*) FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
GROUP BY animals.name
ORDER BY count DESC
LIMIT 1;

/*Who was Maisy Smith's first visit?*/
SELECT vets.name, animals.name FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON animals.id = visits.animal_id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC
LIMIT 1;

/*Details for most recent visit: animal information, vet information, and date of visit.*/
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, weight_kg, vets.name as Vet_Name, vets.age as Vet_Age, vets.date_of_graduation as Vet_Graduated, date_of_visit FROM animals
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species?*/
SELECT COUNT(*) FROM visits
JOIN animals ON animals.id = visits.animal_id
JOIN vets ON vets.id = visits.vet_id
JOIN specializations ON vets.id = specializations.vet_id
JOIN species ON specializations.species_id = species.id
WHERE animals.species_id != specializations.species_id;

/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/






























