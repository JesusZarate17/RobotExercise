*** Settings ***
Library             SeleniumLibrary
Library             String

*** Variables ***
${BASIC_AUTH_URL}           https://the-internet.herokuapp.com/basic_auth

*** Keywords ***
Navigate To
    go to       ${BASIC_AUTH_URL}

Login with credentials
    [Arguments]    ${username}      ${password}
    ${RAW_URL} =        fetch from right    ${BASIC_AUTH_URL}   //
    ${LOGIN_URL} =      set variable    https://${USERNAME}:${PASSWORD}@${RAW_URL}
    go to    ${LOGIN_URL}

Validate the Authentication was Successful
    Page Should Contain    Congratulations! You must have the proper credentials.

Validate the Authentication was NOT Successful
    Page Should Not Contain    Congratulations! You must have the proper credentials.