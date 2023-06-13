*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${KEY_PRESSES_URL}                  https://the-internet.herokuapp.com/key_presses
${INPUT_FIELD}                      target
${RESULT_FIELD}                     result

*** Keywords ***
Navigate To
    go to               ${KEY_PRESSES_URL}

Place on Input Field and Press Key
    [Arguments]         ${key}
    press keys          ${INPUT_FIELD}          ${key}

Validate Entered Keys Message
    [Arguments]    ${message}
    element text should be      ${RESULT_FIELD}     ${message}
