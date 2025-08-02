*** Settings ***
Library           AppiumLibrary

Variables        ../Variables/Variables.py
Variables        ../Variables/Locator.py

*** Keywords ***
Open Application MyApp
    Open Application       ${REMOTE_URL}   platformName=${PLATFORM_NAME}    deviceName=${DEVICE_NAME}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}
    
Enter username
    Wait Until Element Is Visible    ${USERNAME}    5
    Click Element    ${USERNAME}
    Input Text    ${USERNAME}    johnd
    
Enter password
    Wait Until Element Is Visible    ${PASSWORD}    5
    Click Element    ${PASSWORD}
    Input Password    ${PASSWORD}    m38rmF$

Log In
    Wait Until Element Is Visible    ${LOGIN}    5
    Click Element    ${LOGIN}

Fill the Form
     Wait Until Element Is Visible    ${FORM_TITLE}    5
     Click Element    ${FORM_TITLE}
     Input Text    ${FORM_TITLE}    HP PAVILION

     Wait Until Element Is Visible    ${FORM_PRICE}    5
     Click Element    ${FORM_PRICE}
     Input Text    ${FORM_PRICE}    200000

     Wait Until Element Is Visible    ${FORM_DESCRIPTION}    5
     Click Element    ${FORM_DESCRIPTION}
     Input Text    ${FORM_DESCRIPTION}    INTEL CORE I5 / RAM 16 GO / STOCKAGE SSD 512

     Wait Until Element Is Visible    ${FORM_CATEGORIE}    5
     Click Element    ${FORM_CATEGORIE}
     Input Text    ${FORM_CATEGORIE}    INFORMATIQUE

     Wait Until Element Is Visible    ${FORM_URL}    5
     Click Element    ${FORM_URL}
     Input Text    ${FORM_URL}    https://media.s-bol.com/mPZVP9nYm18r/LjE9op/550x469.jpg

     Click Element    ${FORM_BUTTON_ADD}

Afficher Produit
    Click Element    ${PRODUIT}
