/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg decimal,
    PRIMARY KEY (id)
);

--DAY 3 --
-- BEGIN TRANSACTION--
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS species;

CREATE TABLE owners(
 owner_id SERIAL NOT NULL PRIMARY KEY,
 full_name VARCHAR(200),
 age INT,
 );
 
CREATE TABLE species(
 species_id SERIAL NOT NULL PRIMARY KEY,
 name_of_species VARCHAR(200) );
 
 CREATE TABLE animals (
    animal_id SERIAL NOT NULL PRIMARY KEY,
    full_name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg decimal,
    animal_species_id INT,
    owner_id INT,
    CONSTRAINT fk_species 
    FOREIGN KEY(animal_species_id) 
    REFERENCES species(species_id)
    CONSTRAINT fk_owner 
    FOREIGN KEY(owner_id) 
    REFERENCES owners(owner_id)
    );