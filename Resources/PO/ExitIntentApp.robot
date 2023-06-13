*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library     ../../Resources/ScreenScript.py

*** Variables ***
${EXIT_INTENT_URL}              https://the-internet.herokuapp.com/exit_intent
${CENTER_TARGET}                css=a[target="_blank"]

*** Keywords ***
Navigate To
    go to               ${EXIT_INTENT_URL}

Move Mouse Cursor Up
    mouse over          ${CENTER_TARGET}
    move cursor up

Validate Modal is Displayed
    page should contain    This is a modal window