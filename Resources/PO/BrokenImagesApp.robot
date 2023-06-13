*** Settings ***
Library             SeleniumLibrary
Library             RequestsLibrary
Library             Collections

*** Variables ***
${BROKEN_IMAGES_URL}        https://the-internet.herokuapp.com/broken_images
${IMAGES}                   //div[@class="example"]/img
@{BROKEN_IMAGES}
@{AVAILABLE_IMAGES}


*** Keywords ***
Navigate To
    go to           ${BROKEN_IMAGES_URL}

Count Available and Broken Images
    ${AVAILABLE_IMAGES_LIST}     create list
    ${BROKEN_IMAGES_LIST}        create list
    @{elements} =           Get WebElements   ${IMAGES}
    FOR    ${element}       IN      @{elements}
        ${image} =          get element attribute       ${element}     src
        Create Session      example         ${image}
        ${response}         get request     example     /
        ${status_code}      Set Variable    ${response.status_code}
        run keyword if      ${status_code} == 200      append to list    ${AVAILABLE_IMAGES_LIST}    ${image}
        ...     ELSE        append to list    ${BROKEN_IMAGES_LIST}      ${image}
        Delete All Sessions
    END
    ${available_images_count} =     get length    ${AVAILABLE_IMAGES_LIST}
    ${broken_images_count} =        get length    ${BROKEN_IMAGES_LIST}
    [Return]        ${available_images_count}     ${broken_images_count}

Verify the Correct X and Y number of Available and Broken Images
    [Arguments]    ${correct_available_number}     ${correct_broken_number}
    ${available_images_count}     ${broken_images_count}        Count Available and Broken Images
    should be equal as integers    ${available_images_count}    ${correct_available_number}
    should be equal as integers    ${broken_images_count}       ${correct_broken_number}