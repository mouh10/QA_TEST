*** Settings ***
Resource    ../Ressources/Beatz-Code.robot

*** Test Cases ***
Execution Store
    Créer Session
    Créer Produit Valide
    Créer Produit Sans Titre
    Créer Produit Prix Négatif
    Lire Produit Existant
    Lire Produit ID Inexistant
    Lire Produit ID Invalide Texte
    Mettre à Jour Produit Valide
    Mettre à Jour Produit Inexistant
    Mettre à Jour Produit Prix Invalide
    Supprimer Produit Valide
    Supprimer Produit Inexistant
    Supprimer Produit ID Texte
