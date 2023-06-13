*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${DISAPPEARING_ELEMENTS_URL}            https://the-internet.herokuapp.com/disappearing_elements
${present}


*** Keywords ***
Navigate To
    go to           ${DISAPPEARING_ELEMENTS_URL}

Refresh Page Until Gallery Button is Visible
    ${present}      run keyword and return status    page should contain element    css=a[href="/gallery/"]
    WHILE    ${present} != ${TRUE}
        reload page
        wait until page contains    Home
        ${present}      run keyword and return status    page should contain element    css=a[href="/gallery/"]
        log    Gallery button is NOT visible
    END
    log    Gallery button is visible


Refresh Page Until Gallery Button is NOT Visible
    ${present}      run keyword and return status    page should contain element    css=a[href="/gallery/"]
    WHILE    ${present}
        reload page
        wait until page contains    Home
        ${present}      run keyword and return status    page should contain element    css=a[href="/gallery/"]
        log    Gallery button is visible
    END
    log    Gallery button is NOT visible
