CREATE DATABASE IF NOT EXISTS DEMO_SQL;

USE DEMO_SQL;
DROP TABLE IF EXISTS Details_Commandes;
DROP TABLE IF EXISTS Commandes;
DROP TABLE IF EXISTS Produits;
DROP TABLE IF EXISTS Clients;

CREATE TABLE IF NOT EXISTS Clients
(
    Id      INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom     VARCHAR(25),
    Prenom  VARCHAR(25),
    Adresse VARCHAR(255)

);

CREATE TABLE IF NOT EXISTS Produits
(
    Id   INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nom  VARCHAR(255),
    Prix FLOAT(5)
);

CREATE TABLE IF NOT EXISTS Commandes
(
    Id        INT(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Id_Client INT,
    Date DATE,
    FOREIGN KEY (Id_Client) REFERENCES Clients (Id)
);

CREATE TABLE IF NOT EXISTS Details_Commande
(
    Id_Commande INT,
    Id_Produit  INT,
    Quantite    INT(10),
    PRIMARY KEY (Id_Commande, Id_Produit),
    FOREIGN KEY (Id_Commande) REFERENCES Commandes (Id),
    FOREIGN KEY (Id_Produit) REFERENCES Produits (Id)

)