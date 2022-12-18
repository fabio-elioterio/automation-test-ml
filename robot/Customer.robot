*** Settings ***
Resource       resources/ResourceApi.robot
Suite Setup    Connect My API




*** Test Cases ***
Should Create a Customer with Success
    Create customer
    Status Code Should Be    201