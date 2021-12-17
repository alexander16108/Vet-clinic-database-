---- DAY 3 ----
BEGIN TRANSACTION;
--BEGIN--

--INSERT DATA INTO OWNERS TABLE

INSERT INTO owners (full_name, age) VALUES ('sam smith', 34),
 ('Jennifer Orwell', 19),
 ('Bob', 45),
 ('Melody Pond', 77),
 ('Dean Winchester', 14),
 ('Jodie Whittaker', 38);

-- INSERT DATA INTO SPECIES TABLE

INSERT INTO species (name_of_species) VALUES ('Digamon'), ('Pikachu');

-- INSERT INTO ANIMALS TABLE

ALTER TABLE animals DROP COLUMN full_name;


INSERT INTO animals (animal_name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id)
VALUES
  ('Agumon', '2020-2-3', 0, true, 10.23, 2, 1),
  ('Gabumon', '2018-11-15', 2, true, 8, 2, 2),
  ('Pikachu', '2021-1-7', 1, false, 15.04, 1, 2),
  ('Devimon', '2017-5-12', 5, true, 11, 2, 3),
  ('Charmander', '2020-2-8', 0, false, 11, 1, 4),
  ('Plantmon', '2022-11-15', 2, true, 5.7, 2, 3),
  ('Squirtle', '1993-4-2', 3, false, 12.13, 1, 4),
  ('Angemon', '2005-6-12', 1, true, 45, 2, 5),
  ('Boarmon', '2005-6-7', 7, true, 20.4, 2, 5),
  ('Blossom', '1998-10-13', 3, true, 17, 1, 4)
;

INSERT INTO vets (vet_name, vet_age, vet_graduation_date)
VALUES
  ('William Tatcher', 45, '2000-4-23'),
  ('Maisy Smith', 26, '2019-1-17'),
  ('Stephanie Mendez', 64, '1981-5-4'),
  ('Jack Harkness', 38, '2008-6-8')
;

-- Insert data for specialties
-- Vet William Tatcher is specialized in Pokemon.
-- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
-- Vet Jack Harkness is specialized in Digimon.

INSERT INTO specializations (species_id, vet_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 3),
  (2, 4)
;

INSERT INTO visits (animals_id, vet_id, date_of_visit)
VALUES
  (1, 1, '2020-5-24'),
  (1, 3, '2020-7-22'),
  (2, 4, '2021-2-2'),
  (3, 2, '2020-1-5'),
  (3, 2, '2020-3-8'),
  (3, 2, '2020-5-14'),
  (4, 3, '2021-5-4'),
  (5, 4, '2021-2-24'),
  (6, 2, '2019-12-21'),
  (6, 1, '2020-8-10'),
  (6, 2, '2021-4-7'),
  (7, 3, '2019-9-29'),
  (8, 4, '2020-10-3'),
  (8, 4, '2020-11-4'),
  (9, 2, '2019-1-24'),
  (9, 2, '2019-5-15'),
  (9, 2, '2020-2-27'),
  (9, 2, '2020-8-3'),
  (10, 3, '2020-5-24'),
  (10, 1, '2021-1-11')
;

COMMIT;