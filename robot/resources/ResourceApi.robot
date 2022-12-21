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
    ${RESPONSE}    POST    url=${URL}/customers    data={"name": "Deusemar", "email": "deuser@email.com", "password": "65421"}
    ...                                          headers=${HEADERS}
    Log    ${RESPONSE.text}
    Set Test Variable    ${RESPONSE}

Got error 422 when the customer name is registered
    ${HEADERS}    Create Dictionary    content-type=application/json   
    ${RESPONSE}    POST    url=${URL}/customers    data={"name": "Joao", "email": "joaojunior@email.com", "password": "65421"}
    ...                                          headers=${HEADERS}    expected_status=anything
    Log    ${RESPONSE.text}
    Status Should Be    422    ${RESPONSE}
    Set Test Variable    ${RESPONSE}

## ASSERTS
Status Code Should Be
    [Arguments]    ${WISHED_STATUS_CODE}
    Log    ${RESPONSE.status_code}
    Status Should Be    ${WISHED_STATUS_CODE}    ${RESPONSE}

Internal Code Should Be
    [Arguments]    ${WISHED_INTERNAL_CODE}
    Dictionary Should Contain Item    ${RESPONSE.json()}    internalCode    ${WISHED_INTERNAL_CODE}    

Error Message Should Be
    [Arguments]    ${WISHED_MESSAGE}
    ${ERRORS}    Get From List    ${RESPONSE.json()["errors"]}    0
    Dictionary Should Contain Item    ${ERRORS}    message    ${WISHED_MESSAGE}
