USE demo_sql;

#● Sélectionner les clients n’ayant passé aucune commande

SELECT cl.nom
FROM clients cl
         LEFT JOIN commandes c ON cl.Id = c.Id_Client
WHERE c.Id_Client IS NULL;


#● Afficher les produits jamais commandés

SELECT p.nom
FROM produits p
         LEFT JOIN details_commande dc ON p.Id = dc.Id_Produit
WHERE dc.Id_Produit IS NULL;

#● Récupérer les clients ayant passé plus de 3 commandes

SELECT cl.nom, COUNT(c.Id) AS nb_commandes
FROM clients cl
         LEFT JOIN commandes c ON cl.Id = c.Id_Client
GROUP BY cl.nom
HAVING nb_commandes > 3;

#● Pour chaque client, afficher sa dernière commande (date et ID)

SELECT cl.nom AS Nom_Client, c.Date AS Date_commande, c.Id AS Id_Commande
FROM clients cl
         RIGHT JOIN commandes c ON cl.Id = c.Id_Client
WHERE c.Date = (SELECT Max(Date) from commandes WHERE commandes.Id_Client = c.Id);

#● Lister les clients ayant commandé des produits de plus de 100 € (sans doublons)

SELECT DISTINCT cl.nom AS Nom_Client, p.nom AS Nom_Produit, p.prix AS Prix_Produit
FROM clients cl
         INNER JOIN commandes c ON cl.Id = c.Id_Client
         INNER JOIN details_commande dc ON c.Id = dc.Id_Commande
         INNER JOIN produits p ON dc.Id_Produit = p.Id
WHERE p.Prix > 100;

#● Afficher le produit le plus vendu (en quantité totale)

SELECT p.nom AS Nom_Produit, SUM(dc.Quantite) AS Nb_tot_Produit_Vendu
FROM produits p
         JOIN details_commande dc ON p.Id = dc.Id_Produit
GROUP BY p.nom
ORDER BY Nb_tot_Produit_Vendu DESC
LIMIT 1;

#● Calculer pour chaque client son chiffre d'affaires total

SELECT cl.nom AS Nom_Client, SUM(p.prix * dc.quantite)  AS CA
FROM clients cl
         JOIN commandes c ON cl.Id = c.Id_Client
         JOIN details_commande dc ON c.Id = dc.Id_Commande
         JOIN produits p ON dc.Id_Produit = p.Id
GROUP BY cl.nom;

#● Pour chaque commande, lister le nombre de produits différents commandé

SELECT c.Id, c.Date AS Date_Commande, COUNT(DISTINCT dc.Id_Produit) AS Nombre_Produits_Differents
FROM commandes c
         JOIN details_commande dc ON c.Id = dc.Id_Commande
GROUP BY c.Id, c.Date;