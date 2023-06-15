*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN_URL}                https://the-internet.herokuapp.com/login
${USERNAME_LOCATOR}         id=username
${PASSWORD_LOCATOR}         id=password
${LOGIN_BUTTON}             css=button.radius
${LOGOUT_BUTTON}            css=a[href="/logout"]
${LOGIN_MESSAGE}            id=flash

*** Keywords ***
Navigate To
    go to               ${LOGIN_URL}

Login with Credentials
    [Arguments]         ${username}             ${password}
    input text          ${USERNAME_LOCATOR}     ${username}
    input password      ${PASSWORD_LOCATOR}     ${password}
    click element       ${LOGIN_BUTTON}

Log Out
    click element       ${LOGOUT_BUTTON}

Validate Successful Login
    wait until page contains element    ${LOGIN_MESSAGE}
    page should contain     You logged into a secure area!

Validate Successful Log Out
    wait until page contains element    ${LOGIN_MESSAGE}
    page should contain     You logged out of the secure area!

Validate Unsuccessful Login with Invalid Username
    wait until page contains element    ${LOGIN_MESSAGE}
    page should contain     Your username is invalid!

Validate Unsuccessful Login with Invalid Password
    wait until page contains element    ${LOGIN_MESSAGE}
    page should contain     Your password is invalid!

