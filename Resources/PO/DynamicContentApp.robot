*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             String

*** Variables ***
${DYNAMIC_CONTENT_URL}      https://the-internet.herokuapp.com/dynamic_content
${IMAGES_LOCATOR}           xpath=//div[@id="content"]//img

*** Keywords ***
Navigate To
    go to           ${DYNAMIC_CONTENT_URL}

Store Images within a list and Verify the names are not duplicate
    [Arguments]    ${number_of_images}
    @{IMAGES_LIST}          create list
    ${list_length}          get length      ${IMAGES_LIST}
    WHILE       ${list_length}<${number_of_images}
        @{elements} =           Get WebElements   ${IMAGES_LOCATOR}
        FOR    ${element}       IN      @{elements}
            ${src} =        get element attribute       ${element}     src
            ${image} =      fetch from right    ${src}      /
            ${image} =      fetch from left     ${image}    .
            append to list      ${IMAGES_LIST}      ${image}
        END
        ${IMAGES_LIST}      remove duplicates   ${IMAGES_LIST}
        ${list_length}      get length          ${IMAGES_LIST}
        reload page
    END
    log    ${IMAGES_LIST}
