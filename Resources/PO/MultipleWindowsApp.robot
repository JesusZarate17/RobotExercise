*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${MULTIPLE_WINDOWS_URL}             https://the-internet.herokuapp.com/windows
${WINDOW_LINK}                      Click Here
${NEW_WINDOW_MESSAGE}               New Window

*** Keywords ***
Navigate To
    go to               ${MULTIPLE_WINDOWS_URL}

Go to New Window
    click link          ${WINDOW_LINK}
    switch window       ${NEW_WINDOW_MESSAGE}

Validate Text Displayed on the New Window
    page should contain             ${NEW_WINDOW_MESSAGE}