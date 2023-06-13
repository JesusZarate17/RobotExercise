*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${JS_ALERTS_URL}                    https://the-internet.herokuapp.com/javascript_alerts
${JS_ALERT_BUTTON}                  Click for JS Alert
${JS_PROMPT_BUTTON}                 Click for JS Prompt
${ALERT_CONFIRMATION_MESSAGE}       You successfully clicked an alert
${PROMPT_CONFIRMATION_MESSAGE}      You entered:${SPACE}

*** Keywords ***
Navigate To
    go to               ${JS_ALERTS_URL}

Click JS Alert Button and Accept Alert
    click button            ${JS_ALERT_BUTTON}
    handle alert            ACCEPT
    Validate Confirmation Message       ${ALERT_CONFIRMATION_MESSAGE}

Click JS Prompt Button and Enter Text
    [Arguments]    ${input_text}
    click button                ${JS_PROMPT_BUTTON}
    input text into alert       ${input_text}
    Validate Confirmation Message       ${PROMPT_CONFIRMATION_MESSAGE}${input_text}

Validate Confirmation Message
    [Arguments]    ${message}
    element text should be      result      ${message}

