*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${CONTEXT_MENU_URL}         https://the-internet.herokuapp.com/context_menu
${BOX}                      hot-spot
${ALERT_TEXT}               You selected a context menu


*** Keywords ***
Navigate To
    go to           ${CONTEXT_MENU_URL}

Right Click Box and Validate Alert is Open and Close Correctly
    open context menu               ${BOX}
    alert should be present         ${ALERT_TEXT}       ACCEPT
    alert should not be present