*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp basic_auth page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/BasicAuthApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Variables ***
${VALID_USERNAME}           admin
${VALID_PASSWORD}           admin
${INVALID_USERNAME}         admin1
${INVALID_PASSWORD}         admin1

*** Test Cases ***
Login with Valid Credentials
    BasicAuthApp.Navigate To
    BasicAuthApp.Login with credentials      ${VALID_USERNAME}     ${VALID_PASSWORD}
    BasicAuthApp.Validate the Authentication was Successful

Login with Invalid Credentials
    BasicAuthApp.Navigate To
    BasicAuthApp.Login with credentials      ${INVALID_USERNAME}     ${INVALID_PASSWORD}
    BasicAuthApp.Validate the Authentication was NOT Successful