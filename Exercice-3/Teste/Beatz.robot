*** Settings ***
Resource    ../Ressources/Beatz-Code.robot

Suite Setup    Create Session To Fulfillment API

*** Test Cases ***
Suite Setup
    Create Session To Fulfillment API
    Get Orders Test
    Get Order By Id Test
    #Issue Refund Test
    #Get Orders List Failed
    #Get Order By Id Failed
    #Issue Refund Failed