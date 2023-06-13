*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${FLOATING_MENU_URL}        https://the-internet.herokuapp.com/floating_menu
${HOME_MENU}                css=a[href="#home"]
${NEWS_MENU}                css=a[href="#news"]
${CONTACT_MENU}             css=a[href="#contact"]
${ABOUT_MENU}               css=a[href="#about"]

*** Keywords ***
Navigate To
    go to               ${FLOATING_MENU_URL}

Scroll to the Bottom and Verify Menu is Visible
    press keys          None     END
    element should be visible    ${HOME_MENU}
    element should be visible    ${NEWS_MENU}
    element should be visible    ${CONTACT_MENU}
    element should be visible    ${ABOUT_MENU}