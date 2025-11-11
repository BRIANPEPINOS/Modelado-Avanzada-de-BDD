
CREATE DATABASE IF NOT EXISTS GastroApp; 

USE GastroApp;

CREATE TABLE IF NOT EXISTS Categorias (
  id_categoria      INT PRIMARY KEY,
  nombre_categoria  VARCHAR(100) NOT NULL UNIQUE
);


INSERT INTO Categorias (id_categoria, nombre_categoria) VALUES
  (1, 'Entradas'),
  (2, 'Platos Fuertes'),
  (3, 'Bebidas');