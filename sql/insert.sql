-- Insert Clients
INSERT INTO Clients (Nom, Prenom, Adresse)
VALUES ('Thrall', 'Go\'el', 'Orgrimmar, Durotar'),
       ('Jaina', 'Proudmoore', 'Theramore, Dustwallow Marsh'),
       ('Sylvanas', 'Windrunner', 'Undercity, Tirisfal Glades'),
       ('Malfurion', 'Stormrage', 'Moonglade, Kalimdor'),
       ('Anduin', 'Wrynn', 'Stormwind Keep, Elwynn Forest');

-- Insert Produits
INSERT INTO Produits (Nom, Prix)
VALUES ('Frostmourne Replica', 999.99),
       ('Thunderfury Replica', 899.99),
       ('Ashbringer Replica', 799.99),
       ('Doomhammer Replica', 699.99),
       ('Staff of Antonidas', 599.99);

-- Insert Commandes
INSERT INTO Commandes (Id_Client, Date)
VALUES (1, '2024-03-15'),
       (2, '2024-03-16'),
       (3, '2024-03-17'),
       (4, '2024-03-18'),
       (5, '2024-03-19');

INSERT INTO Details_Commande (Id_Commande, Id_Produit, Quantite)
VALUES (1, 4, 1),
       (2, 5, 1),
       (3, 1, 1),
       (4, 3, 1),
       (5, 2, 1);