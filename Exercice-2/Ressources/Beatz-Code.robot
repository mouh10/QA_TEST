*** Settings ***
Library        SeleniumLibrary
Variables    ../Variables/Variables.py

*** Keywords ***

Ouvrir Navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Verification Page
    Title Should Be    Customer Service
    Sleep    2s

Connexion
    Click Link    Sign In
    Sleep    2s
    Click Element    name=email-name
    Input Text    name=email-name    Mohamed@gmail.com
    Sleep    2s
    Click Element    name=password-name
    Input Password    name=password-name   Gueye
    Sleep    2s
    Click Button    Submit
    Sleep    2s

Connexion Remember
    Click Link    Sign In
    Sleep    2s
    Click Element    name=email-name
    Input Text    name=email-name    Mohamed@gmail.com
    Sleep    2s
    Click Element    name=password-name
    Input Password    name=password-name   Gueye
    Sleep    2s
    Click Element    id=remember
    Sleep    2s
    Click Button    Submit
    Sleep    2s

Connexion Invalide
    Click Link    Sign In
    Sleep    2s
    Click Element    name=email-name
    Input Text    name=email-name    ""
    Sleep    2s
    Click Element    name=password-name
    Input Password    name=password-name   ""
    Click Button    Submit
    Page Should Contain    Login
    Sleep    2s

Verification Tableau
    ${lignes}=    Get Element Count    css=table#customers > tbody > tr
    Should Be True    ${lignes} > 1
    Sleep    2s
Formulaire Valide
    Click Link    new-customer
    Sleep    2s
    Input Text    id=EmailAddress    Mohamed@example.com
    Sleep    2s
    Input Text    id=FirstName   Mohamed
    Sleep    2s
    Input Text    id=LastName   Gueye
    Sleep    2s
    Input Text    id=City     Dakar
    Sleep    2s
    Select From List By Value    id=StateOrRegion    CA
    Sleep    2s
    Select Radio Button    gender    male
    Sleep    2s
    Click Element    name=promos-name
    Sleep    2s
    Click Button    Submit
    Sleep    4s

Formulaire Invalide
    Click Link    new-customer
    Sleep    2s
    Input Text    id=EmailAddress    Mohamed@example.com
    Sleep    2s
    Input Text    id=FirstName   Mohamed
    Sleep    2s
    Input Text    id=City     Dakar
    Sleep    2s
    Select From List By Value    id=StateOrRegion    CA
    Sleep    2s
    Select Radio Button    gender    male
    Sleep    2s
    Click Element    name=promos-name
    Sleep    2s
    Click Button    Submit
    Sleep    2s
    Page Should Contain    Add Customer
    Sleep    4s

Formulaire Cancel
    Go Back
    Click Link    new-customer
    Sleep    2s
    Input Text    id=EmailAddress    Mohamed@example.com
    Sleep    2s
    Input Text    id=FirstName   Mohamed
    Sleep    2s
    Input Text    id=City     Dakar
    Sleep    2s
    Select From List By Value    id=StateOrRegion    CA
    Sleep    2s
    Select Radio Button    gender    male
    Sleep    2s
    Click Element    name=promos-name
    Sleep    2s
    Click Element    css=a.btn.btn-default[href="customers.html"]
    Sleep    2s
    Page Should Contain    Our Happy Customers
    Sleep    4s

Detail Profile
    Go Back
    Sleep    2s
    Click Element    css=a[href="user.html"]
    Page Should Contain    ashley.jacobs@gmail.com
    Sleep    2s
    Go Back
    Sleep    2s

Deconnexion
    Click Link    Sign Out
    Page Should Contain    Signed Out
    Sleep    4s
