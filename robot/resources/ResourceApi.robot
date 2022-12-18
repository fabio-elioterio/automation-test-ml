*** Settings ***
Library        RequestsLibrary
Library        Collections

*** Variables ***
${URL}    http://localhost:8080

*** Keywords ***
## SET UP
Connect My API
    Create Session    customer_api    ${URL}

## ACTIONS
Create customer
    ${HEADERS}    Create Dictionary    content-type=application/json   
    ${RESPONSE}    POST    url=${URL}/customers    data={"name": "Joao", "email": "joao@email.com", "password": "65421"}
    ...                                          headers=${HEADERS}
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

## ASSERTS
Status Code Should Be
    [Arguments]    ${WISHED_STATUS_CODE}
    Should Be Equal As Strings    ${WISHED_STATUS_CODE}    ${RESPONSE.status_code}

