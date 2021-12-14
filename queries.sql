/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE full_name LIKE '%mon%';
SELECT * FROM animals WHERE date_of_birth BETWEEN 2016 AND 2019;
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE full_name IN (Agumon AND Pikachu);
SELECT full_name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE full_name != (Gabumon);
SELECT * FROM animals WHERE weight_kg >= 10.4 AND <= 17.3;
