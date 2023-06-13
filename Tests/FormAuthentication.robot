*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp form authentication page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/FormAuthenticationApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/FormAuthentication.robot

*** Variables ***
${VALID_USERNAME}           tomsmith
${VALID_PASSWORD}           SuperSecretPassword!
${INVALID_USERNAME}         tomsmith1
${INVALID_PASSWORD}         SuperS1ecretPassword!


*** Test Cases ***
Validate Login with valid credentials and Log Out
    [Documentation]    Test to validate Login with both valid username and password
    FormAuthenticationApp.Navigate To
    FormAuthenticationApp.Login with Credentials    ${VALID_USERNAME}       ${VALID_PASSWORD}
    FormAuthenticationApp.Validate Successful Login
    FormAuthenticationApp.Log Out
    FormAuthenticationApp.Validate Successful Log Out

Validate Login with invalid username
    [Documentation]    Test to validate Login with invalid username and valid password
    FormAuthenticationApp.Navigate To
    FormAuthenticationApp.Login with Credentials    ${INVALID_USERNAME}       ${VALID_PASSWORD}
    FormAuthenticationApp.Validate Unsuccessful Login with Invalid Username

Validate Login with invalid password
    [Documentation]    Test to validate Login with valid username and invalid password
    FormAuthenticationApp.Navigate To
    FormAuthenticationApp.Login with Credentials    ${VALID_USERNAME}       ${INVALID_PASSWORD}
    FormAuthenticationApp.Validate Unsuccessful Login with Invalid Password