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

---Write queries to answer the following questions:
--How many animals are there?
--How many animals have never tried to escape?
--What is the average weight of animals?
--Who escapes the most, neutered or not neutered animals?
--What is the minimum and maximum weight of each type of animal?
--What is the average number of escape attempts per animal type of those born --between 1990 and 2000?

SELECT COUNT(id) FROM animals; 5
SELECT MIN(escape_attempts) FROM animals; 1
SELECT AVG(weight_kg) FROM animals;  21.1060000000000000
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
 neutered | max
----------+-----
 f        |   3
 t        |   7

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

SELECT date_of_birth, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1' GROUP BY date_of_birth;
 date_of_birth |        avg
---------------+--------------------
 1993-04-02    | 3.0000000000000000
 1998-10-13    | 3.0000000000000000
