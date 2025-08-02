*** Settings ***
Resource    ../Ressources/Beatz-Code.robot

*** Test Cases ***
Execution Service
    Ouvrir Navigateur
    Verification Page
    Connexion
    Verification Tableau
    Deconnexion
    Connexion Remember
    Formulaire Valide
    Formulaire Invalide
    Formulaire Cancel
    Detail Profile
    Deconnexion
    #Close Browser
