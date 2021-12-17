---- DAY 3 ----
BEGIN TRANSACTION
--BEGIN--

--INSERT DATA INTO OWNERS TABLE

INSERT INTO owners (full_name, age) VALUES ('sam smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- INSERT DATA INTO SPECIES TABLE

INSERT INTO species (name_of_species) VALUES ('Digamon');
INSERT INTO species (name_of_species) VALUES ('Pikachu');

-- INSERT INTO ANIMALS TABLE

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Charmander', '2020-2-8', 0, false, 11, 2, 4);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Plantmon', '2022-11-15', 2, true, 5.7, 1, 3);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Squirtle', '1993-4-2', 3, false, 12.13, 2, 4);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Angemon', '2005-6-12', 1, true, -45, 1, 5);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Boarmon', '2005-6-7', 7, true, 20.4, 1, 5);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Blossom', '1998-10-13', 3, true, 17, 2, 4);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Agumon', '1992-4-12', 1, true, -45, 1, 1);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Gabumon', '2012-9-22', 1, true, -45, 1, 2);

INSERT INTO animals (full_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id) VALUES ('Pikachu', '2020-1-19', 1, true, -45, 2, 2);

--ALTERNATIVE FOR UPDATING SPECIES_ID
UPDATE animals 
SET animal_species_id = 1 
WHERE animal_name 
LIKE '%mon%';

UPDATE animals
SET owner_id =  5
WHERE animal_name = 'Angemon' AND 'Boarmon';
