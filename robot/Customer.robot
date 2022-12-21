*** Settings ***
Resource       resources/ResourceApi.robot
Suite Setup    Connect My API



*** Test Cases ***
Should Create a Customer with Success
    [Tags]    success_customer
    Create customer
    Status Code Should Be    201

Should Not Create a Customer with Name alredy registered
    [Tags]    name_registered
    Got error 422 when the customer name is registered
    Internal Code Should Be    ML-001
    Error Message Should Be    Nome já cadastrado

Should Not Create a Customer with Email alredy registered
    [Tags]    email_registered
    Got error 422 when the customer email is registered
    Internal Code Should Be    ML-001
    Error Message Should Be    Email já cadastrado
