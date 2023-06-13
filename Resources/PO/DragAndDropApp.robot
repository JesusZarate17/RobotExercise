*** Settings ***
Library             SeleniumLibrary     plugins=SeleniumTestability;True;30 Seconds;True

*** Variables ***
${DRAG_AND_DROP_URL}            https://the-internet.herokuapp.com/drag_and_drop
${BOX_A}                        xpath=//div[@id="column-a"]/header
${BOX_B}                        xpath=//div[@id="column-b"]/header
${FIRST_BOX}                    (//div[@class="column"]/header)[1]

*** Keywords ***
Navigate To
    go to           ${DRAG_AND_DROP_URL}

Drag and Drop Box A to B and Validate they were Exchanged
    drag and drop       ${BOX_A}       ${BOX_B}        html5=True

Verify Which is the First Box
    [Arguments]         ${correct_first_box}
    ${FIRST_BOX_TEXT}   get text    (//div[@class="column"]/header)[1]
    should be equal as strings      ${FIRST_BOX_TEXT}       ${correct_first_box}