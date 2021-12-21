-- Database Structure for the Entire database.
DROP TABLE IF EXISTS specializations;
DROP TABLE IF EXISTS visits;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS vets;
-- create a table for owners 
CREATE TABLE owners(
 id SERIAL NOT NULL PRIMARY KEY,
 full_name VARCHAR(200),
 age INT
 );
 
 -- create a table for species.
CREATE TABLE species(
 id SERIAL NOT NULL PRIMARY KEY,
 name_of_species VARCHAR(200) 
 );

-- create a table for vets
CREATE TABLE vets(
    id SERIAL NOT NULL PRIMARY KEY,
    vet_name VARCHAR(200),
    vet_age INT,
    vet_graduation_date DATE
);

-- create a table for specialization in relationship with species and vets 
CREATE TABLE specializations(
    species_id INT,
    vet_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id)
    REFERENCES species(id),
   CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id)
);

 CREATE TABLE animals(
    id SERIAL NOT NULL PRIMARY KEY,
    animal_name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species_id INT,
    owner_id INT,
    CONSTRAINT fk_species
    FOREIGN KEY(species_id)
    REFERENCES species(id),
    CONSTRAINT fk_owner
    FOREIGN KEY(owner_id)
    REFERENCES owners(id)
    );

-- create a table for visit in relationship with animals and vets.
CREATE TABLE visits(
    vet_id INT,
    animals_id INT,
    date_of_visit DATE,
    CONSTRAINT fk_animals
    FOREIGN KEY(animals_id)
    REFERENCES animals(id),
    CONSTRAINT fk_vet
    FOREIGN KEY(vet_id)
    REFERENCES vets(id)
);


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

-- Optimized Execution analysis by creating Indexes
CREATE INDEX animals_id_asc ON visits (animals_id ASC);
CREATE INDEX vet_id_asc ON visits (vet_id ASC);
CREATE INDEX date_of_visit_asc ON visits (date_of_visit ASC);
CREATE INDEX full_name_asc ON owners (full_name ASC);
CREATE INDEX owners_age_asc ON owners (age ASC);
CREATE INDEX emails_asc ON owners (email ASC);

DROP INDEX date_of_visit_asc;

