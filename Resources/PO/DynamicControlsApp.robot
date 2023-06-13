*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${DYNAMIC_CONTROLS_URL}         https://the-internet.herokuapp.com/dynamic_controls
${REMOVE_BUTTON}                css=button[onclick="swapCheckbox()"]
${ENABLE_BUTTON}                css=button[onclick="swapInput()"]
${CHECKBOX}                     css=div[id="checkbox]
${INPUT}                        css=input[type="text"]
${VERIFICATION_MESSAGE}         css=p[id="message"]

*** Keywords ***
Navigate To
    go to           ${DYNAMIC_CONTROLS_URL}

Click "Remove" button and Verify checkbox is removed
    click button                        ${REMOVE_BUTTON}
    wait until page contains element    ${VERIFICATION_MESSAGE}
    element should not be visible       ${CHECKBOX}

Click "Enable" button and Verify input is enabled
    click button                        ${ENABLE_BUTTON}
    wait until page contains element    ${VERIFICATION_MESSAGE}
    element should be enabled           ${INPUT}