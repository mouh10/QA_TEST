*** Settings ***
Library           RequestsLibrary
Variables    ../Variables/Variables.py

*** Keywords ***

Créer Session
    Create Session    fakestore    ${BASE_URL}

### CREATE ###

Créer Produit Valide
    ${body}=    Create Dictionary    title=Laptop    price=500000    description=Ordinateur EliteBook    
    ...    image=https://image.com    category=Electronics
    ${resp}=    POST On Session    fakestore    /products    json=${body}
    Should Be Equal As Integers    ${resp.status_code}    200

Créer Produit Sans Titre
    ${body}=    Create Dictionary    price=200000    description=Sans titre    image=https://image.com 
    ${resp}=    POST On Session    fakestore    /products    json=${body}
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Not Be Equal As Integers    ${resp.status_code}    400 #

Créer Produit Prix Négatif
    ${body}=    Create Dictionary    title=MauvaisPrix    price=-10    description=Prix invalide    image=https://image.com 
    ${resp}=    POST On Session    fakestore    /products    json=${body}
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Not Be Equal As Integers    ${resp.status_code}    400 #

### READ ###

Lire Produit Existant
    ${resp}=    GET On Session    fakestore    /products/1
    Should Be Equal As Integers    ${resp.status_code}    200

Lire Produit ID Inexistant
    ${resp}=    GET On Session    fakestore    /products/9999
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue = Should Be Equal As Integers    ${resp.status_code}    404 #

Lire Produit ID Invalide Texte
    ${resp}=    GET On Session    fakestore    /products/abc
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Not Be Equal As Integers    ${resp.status_code}    200 #

### UPDATE ###

Mettre à Jour Produit Valide
    ${body}=    Create Dictionary    title=PC Révisé    price=450000
    ${resp}=    PUT On Session    fakestore    /products/1    json=${body}
    Should Be Equal As Integers    ${resp.status_code}    200

Mettre à Jour Produit Inexistant
    ${body}=    Create Dictionary    title=Fake    price=123
    ${resp}=    PUT On Session    fakestore    /products/9999    json=${body}
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Be Equal As Integers    ${resp.status_code}    404 #

Mettre à Jour Produit Prix Invalide
    ${body}=    Create Dictionary    price=“Texte”    title=Test
    ${resp}=    PUT On Session    fakestore    /products/1    json=${body}
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Not Be Equal As Integers    ${resp.status_code}    200 #

### DELETE ###

Supprimer Produit Valide
    ${resp}=    DELETE On Session    fakestore    /products/1
    Should Be Equal As Integers    ${resp.status_code}    200

Supprimer Produit Inexistant
    ${resp}=    DELETE On Session    fakestore    /products/9999
    Should Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Be Equal As Integers    ${resp.status_code}    404 #

Supprimer Produit ID Texte
    ${resp}=    DELETE On Session    fakestore    /products/xyz    expected_status=ANY
    Should Not Be Equal As Integers    ${resp.status_code}    200
    # Reponse Attendue Should Not Be Equal As Integers    ${resp.status_code}    200 #
