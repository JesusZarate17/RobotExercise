*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${ADD_REMOVE_ELEMENT_URL}       https://the-internet.herokuapp.com/add_remove_elements/
${ADD_ELEMENT_BUTTON}           css=button[onclick="addElement()"]
${DELETE_BUTTON}                css=button[onclick="deleteElement()"]

*** Keywords ***
Navigate To
    go to           ${ADD_REMOVE_ELEMENT_URL}

Verify Page Loaded
    wait until page contains element        ${ADD_ELEMENT_BUTTON}

Add N Number of Elements
    [Arguments]             ${NUMBER_OF_ELEMENTS}
    repeat keyword          ${NUMBER_OF_ELEMENTS}     Add Element

Remove N Number of Elements
    [Arguments]             ${NUMBER_OF_ELEMENTS}
    repeat keyword          ${NUMBER_OF_ELEMENTS}     Delete Element

Verify Elements Added are Equals to N
    [Arguments]             ${NUMBER_OF_ELEMENTS}
    ${elements_added} =     Get Elements Added
    should be equal as integers     ${NUMBER_OF_ELEMENTS}       ${elements_added}

Verify Elements where Deleted
    ${elements_added} =     Get Elements Added
    should be equal as integers     0       ${elements_added}

Add Element
    click button            ${ADD_ELEMENT_BUTTON}

Delete Element
    click button            ${DELETE_BUTTON}

Get Elements Added
    ${elements_added} =     get element count       ${DELETE_BUTTON}
    return from keyword     ${elements_added}