USE demo_sql;


#● Récupérer la liste des clients triés par nom.
SELECT *
FROM CLIENTS c
ORDER BY c.Nom;
#● Trouver les produits dont le prix est supérieur à 30

SELECT *
FROM produits p
WHERE p.Prix >= 30;

#● Récupérer les commandes et les noms des clients associés.

SELECT c.Date, cl.Nom, dc.Quantite, p.Nom
FROM commandes c
         LEFT JOIN clients cl ON c.Id_Client = cl.Id
         LEFT JOIN details_commande dc on c.Id = dc.Id_Commande
         LEFT JOIN produits p on dc.Id_Produit = p.Id;

#● Lister les produits commandés pour chaque commande, avec leur quantité..

SELECT cl.Nom AS Nom_Client, p.Nom AS Produit, dc.Quantite
FROM commandes c
         LEFT JOIN clients cl ON c.Id_Client = cl.Id
         LEFT JOIN details_commande dc on c.Id = dc.Id_Commande
         LEFT JOIN produits p on dc.Id_Produit = p.Id;


#● Calculer le total des ventes pour chaque produit.

SELECT p.nom,ROUND(SUM(p.Prix * dc.Quantite), 2) AS Total_ventes
FROM details_commande dc
         JOIN produits p ON p.Id = dc.Id_Produit
GROUP BY p.nom;


#● Trouver le nombre total de commandes passées par chaque client

SELECT DISTINCT cl.nom, COUNT(c.id) AS nb_commandes
FROM commandes c
         LEFT JOIN clients cl ON c.Id_Client = cl.Id
GROUP BY cl.Nom;