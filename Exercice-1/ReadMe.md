### CAHIER DE TESTS ###

### CREATE (Scénario passant) ###

Description : Ajouter un produit valide
    Entrée : {
        "title": "Ordinateur Portable",
        "price": 50000,
        "description": "Processeur Intel Core Ultra 7",
        "category": "bags",
        "image": "https://example.com/bag.jpg",
        "rating": { "rate": 4.2, "count": 25 }
    }
    Résultat attendu : Code 200

### CREATE (Scénarios non passants) ###

1.Titre manquant
   Résultat : Erreur validation (400) ou message d’erreur
2.Prix non numérique
   Résultat : Erreur de type ou message d’erreur

### READ (Scénario passant) ###

Description : Lire un produit existant avec un ID connu
    Entrée : GET /products/{id}
    Résultat attendu: Statut 200 + données du produit

### READ (Scénarios non passants) ###

1.ID Inexistant
   Résultat : 404 Not Found ou message d’erreur
2.ID Invalide
   Résultat : Erreur 400 ou message d’erreur

### UPDATE (Scénario passant) ###

Description : Modifier le prix d’un produit existant
    Entrée : json
    { 
        "price": 400000 
    }
    Résultat attendu : Produit mis à jour avec nouveau prix

### UPDATE (Scénarios non passants) ###

1.Mettre à Jour Produit ID Inexistant
    Résultat : Erreur 400 ou message d’erreur
2.Mettre à Jour Produit Prix Invalide
    Résultat : Erreur 400 ou message d’erreur

### DELETE (Scénario passant) ###

Description : Supprimer un produit par ID
    Résultat attendu : Statut 200

### DELETE (Scénarios non passants) ###

1.Produit avec ID inexistant
    Résultat : 404 Not Found ou message d’erreur
2.Produit ID Texte
    Résultat : 404 Not Found ou message d’erreur
