*** Settings ***
Resource    ../Ressources/Beatz-Code.robot

Suite Setup    Create Session SandBox

*** Test Cases ***
Suite Setup
    Create Session SandBox
    Get Orders Test
    Get Order By Id Test
