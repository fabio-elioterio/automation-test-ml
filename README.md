# Mercado Livro: Automated Testing
Automation Test of Marcado Livro project with: Robot Framework, Java + Rest Assured & Cucumber and Kotlin with Rest Assured.

You can see the project code and everthing about how to config and use it here: https://github.com/fabio-elioterio/mercado-livro-kotlin

## Customer Test Cases
**1 - Should Create a Customer with Success**

**Given** that I have the customer's request body

**When** I try to create the customer with the method 'POST'

**Then** the customer should be created

**And** I get the staus code 'Created'

**2 - Should Not Create a Customer with Name alredy registered**

**Given** that I have the customer's request body 

**When** I try to create the customer with the method 'POST'

**Then** I get the status code error 422 with the message 'Nome já cadastrado'

**3 - Should Not Create a Customer with Same Email**

**Given**

**When**

**Then**
