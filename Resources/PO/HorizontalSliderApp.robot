*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${HORIZONTAL_SLIDER_URL}            https://the-internet.herokuapp.com/horizontal_slider
${SLIDER_LOCATOR}                   css=input[type="range"]
${SLIDER_RANGE_VALUE}               range

*** Keywords ***
Navigate To
    go to               ${HORIZONTAL_SLIDER_URL}

Validate Slider is in Desired Value
    [Arguments]    ${value}
    element text should be      ${SLIDER_RANGE_VALUE}      ${value}

Set Slider to Desired Value
    [Arguments]    ${value}
    click element       ${SLIDER_LOCATOR}
    run keyword if      ${value}<2.5        Move Left       ${value}
    ...     ELSE IF     ${value}>2.5        Move Right      ${value}

Move Left
    [Arguments]    ${value}
    ${movimientos}      evaluate    int(2.5*2 - ${value}*2)
    repeat keyword      ${movimientos}       press keys          None        ARROW_LEFT

Move Right
    [Arguments]    ${value}
    ${movimientos}      evaluate    int(${value}*2 - 2.5*2)
    repeat keyword      ${movimientos}       press keys          None        ARROW_RIGHT