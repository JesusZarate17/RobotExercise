*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN_URL}                https://the-internet.herokuapp.com/login

*** Keywords ***
Navigate To
    go to               ${LOGIN_URL}

Login with Credentials
    [Arguments]         ${username}     ${password}
    input text          id=username     ${username}
    input password      id=password     ${password}
    click element       css=button.radius

Log Out
    click element       css=a[href="/logout"]

Validate Successful Login
    wait until page contains element    id=flash
    page should contain     You logged into a secure area!

Validate Successful Log Out
    wait until page contains element    id=flash
    page should contain     You logged out of the secure area!

Validate Unsuccessful Login with Invalid Username
    wait until page contains element    id=flash
    page should contain     Your username is invalid!

Validate Unsuccessful Login with Invalid Password
    wait until page contains element    id=flash
    page should contain     Your password is invalid!

