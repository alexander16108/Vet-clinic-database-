/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE full_name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN 2016 AND 2019;

SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE full_name IN (Agumon AND Pikachu);

SELECT full_name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE full_name != (Gabumon);

SELECT * FROM animals WHERE weight_kg >= 10.4 AND <= 17.3;

                                ---DAY 2 ---


UPDATE animals SET species = 'Digamon' WHERE full_name LIKE '%mon%';

UPDATE animals SET species = 'pikachu' WHERE species IS NULL;

DELETE FROM animals WHERE date_of_birth > '2022-1-1';

UPDATE animals SET weight_kg = weight_kg * -1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;


--How many animals are there?
SELECT COUNT(id) FROM animals; 5

--How many animals have never tried to escape?
SELECT MIN(escape_attempts) FROM animals;

--What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;  21.1060000000000000

--Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
 neutered | max
----------+-----
 f        |   3
 t        |   7

--What is the minimum and maximum weight of each type of animal?
-- for Digamon--
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals WHERE species LIKE '%mon%';
 max | min
-----+------
  45 | 20.4

  --for Pikachu--
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals WHERE species= 'pikachu';
 max | min
-----+-----
  17 |  11

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?

SELECT date_of_birth, AVG(escape_attempts)
FROM animals 
WHERE date_of_birth
BETWEEN '1990-1-1' AND '2000-1-1' 
GROUP BY date_of_birth;

 date_of_birth |        avg
---------------+--------------------
 1993-04-02    | 3.0000000000000000
 1998-10-13    | 3.0000000000000000


--DAY 3 
--What animals belong to Melody Pond?
SELECT animal_name
FROM animals
JOIN owners ON animals.owner_id = owners.owner_id
WHERE full_name = 'Melody Pond';
--List of all animals that are pokemon (their type is Pokemon).
SELECT animal_species_id, animal_name
FROM animals
JOIN species ON animals.animal_species_id = species.species_id
WHERE animal_species_id = 2;
--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.id, owners.full_name,animals.animal_id,animals.animal_name
FROM owners
INNER JOIN animals ON owners.id = animals.owner_id
--How many animals are there per species?
SELECT species.name_of_species, COUNT(name_of_species)
FROM animals
JOIN species ON animals.animal_species_id = species.species_id
GROUP BY species.name_of_species;
--List all Digimon owned by Jennifer Orwell.
SELECT species.name_of_species,  animals.animal_name, id, owners.full_name
FROM animals 
JOIN species on animals.animal_id = animals.owner_id
JOIN owners on owners.id = animals.owner_id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name_of_species = 'Digimon';
--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.animal_id, animals.animal_name, animals.escape_attempts, owners.full_name
FROM owners
JOIN animals on owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester' AND  animals.escape_attempts = 0;
--Who owns the most animals?
SELECT owners.full_name, COUNT(animal_name)
FROM animals
JOIN owners on owners.id = animals.owner_id
GROUP BY owners.full_name;