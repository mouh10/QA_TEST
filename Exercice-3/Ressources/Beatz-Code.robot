*** Settings ***
Library     RequestsLibrary
Library     Collections
Variables    ../Variables/Variables.py

*** Keywords ***

Create Session To Fulfillment API
    [Documentation]    Crée une session vers l'API de Fulfillment
    Create Session    fulfillment    ${BASE_URL}    headers=${HEADERS}

Get Orders
    [Arguments]    ${params}=${EMPTY}
    ${response}=    GET On Session    fulfillment    /order    params=${params}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Get Orders Test
    [Documentation]    Test de récupération de la liste des commandes
    ${params}=    Create Dictionary    limit=5
    ${orders}=    Get Orders    ${params}
    Should Not Be Empty    ${orders}
    ${order_count}=    Get Length    ${orders}
    Log To Console    ${orders}

Get Order By Id
    [Arguments]    ${order_id}
    ${response}=    GET On Session    fulfillment    /order/${order_id}
    RETURN    ${response}

Run Get Order By Valid Id Test
    [Arguments]    ${order_id}
    ${response}=    Get Order By Id    ${order_id}
    Should Be Equal As Strings    ${response.status_code}    200
    ${order}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${order}
    Log To Console    ${order}

Get Order By Id Test
    [Documentation]    Test pour récupérer une commande spécifique
    ${params}=    Create Dictionary    limit=5
    ${orders_response}=    Get Orders    ${params}
    ${orders}=    Set Variable    ${orders_response['orders']}
    Run Keyword If    ${orders} != []    Run Get Order By Valid Id Test    ${orders[0]['orderId']}
    ...    ELSE    Log To Console    Aucune commande disponible pour effectuer un test.

Issue Refund
    [Arguments]    ${order_id}    ${refund_data}
    ${response}=    POST On Session    fulfillment    /order/${order_id}/issue_refund    json=${refund_data}
    RETURN    ${response}

Issue Refund Test
    [Documentation]    Test pour émettre un remboursement
    ${order_id}=    Set Variable    26-12345-12345
    ${refund_data}=    Create Dictionary    amount=100.00
    ${response}=    Issue Refund    ${order_id}    ${refund_data}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.json()}

Get Orders List Failed
    [Documentation]    Cas négatif : récupération liste avec erreur attendue
    ${params}=    Create Dictionary    limit=5
    ${response}=    Get Orders    ${params}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Not Be Empty    ${response}
    Log To Console    ${response}

Get Order By Id Failed
    [Documentation]    Cas négatif : commande inexistante
    ${order_id}=    Set Variable    99999999
    ${response}=    Get Order By Id    ${order_id}
    Should Be Equal As Strings    ${response.status_code}    404
    Log To Console    ${response}

Issue Refund Failed
    [Documentation]    Cas négatif : remboursement sur commande inexistante
    ${order_id}=    Set Variable    99999999
    ${refund_data}=    Create Dictionary    amount=100.00
    ${response}=    Issue Refund    ${order_id}    ${refund_data}
    Should Be Equal As Strings    ${response.status_code}    404
    Log To Console    ${response}