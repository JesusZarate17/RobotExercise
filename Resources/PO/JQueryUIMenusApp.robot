*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary

*** Variables ***
${JQUERY_MENU_URL}              https://the-internet.herokuapp.com/jqueryui/menu
${SLIDER_LOCATOR}               css=input[type="range"]
${ENABLED_MENU}                 ui-id-3
${DOWNLOAD_MENU}                ui-id-4
${EXCEL_ITEM}                   ui-id-7

*** Keywords ***
Navigate To
    go to               ${JQUERY_MENU_URL}

Download File
    mouse over          ${ENABLED_MENU}
    wait until element is visible    ${DOWNLOAD_MENU}
    mouse over          ${DOWNLOAD_MENU}
    wait until element is visible    ${EXCEL_ITEM}
    click element       ${EXCEL_ITEM}
    sleep    3s

Verify File was Downloaded
    [Arguments]    ${file_name}
    ${download_dir}     Get Local Download Directory
    ${file_path}    Set Variable    ${download_dir}\\${file_name}
    File Should Exist    ${file_path}

Get Local Download Directory
    ${user_home}        get environment variable    UserProfile
    [Return]    ${user_home}\\Downloads