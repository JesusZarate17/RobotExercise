*** Settings ***
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${CHECKBOXES_URL}       https://the-internet.herokuapp.com/checkboxes
@{CHECKBOX_1}           xpath=//input[@type="checkbox"][1]      xpath=//input[@type="checkbox"][2]

*** Keywords ***
Navigate To
    go to           ${CHECKBOXES_URL}

Select the Checkbox
    [Arguments]         ${checkbox_number}
    ${index}    evaluate    int(${checkbox_number})-int(1)
    select checkbox     ${CHECKBOX_1}[${index}]

Verify Checkbox is Selected
    [Arguments]         ${checkbox_number}
    ${index}    evaluate    int(${checkbox_number})-int(1)
    checkbox should be selected    ${CHECKBOX_1}[${index}]
