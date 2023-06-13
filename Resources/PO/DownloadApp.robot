*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library     Collections
Library     String

*** Variables ***
${DOWNLOAD_URL}             https://the-internet.herokuapp.com/download
${IMAGES_LOCATOR}           css=a[href*="download/"]

*** Keywords ***
Navigate To
    go to                   ${DOWNLOAD_URL}

Download Files and Validate Download
    @{download_links}   Get Download Links
    FOR    ${link}    IN    @{download_links}
        Download File    ${link}
        ${file_name}    Get File Name    ${link}
        Validate File Downloaded    ${file_name}
    END

Get Download Links
    [Documentation]    Returns a list of download links on the page
    @{elements}     Get WebElements     ${IMAGES_LOCATOR}
    @{links}        create list
    FOR    ${element}   IN      @{elements}
        ${link}     get element attribute    ${element}   href
        append to list    ${links}      ${link}
    END
    [Return]    ${links}

Download File
    [Arguments]    ${download_link}
    ${file_name}    Get File Name    ${download_link}
    Click Link    css=a[href*='${filename}']
    Sleep    5s


Get File Name
    [Arguments]    ${file_url}
    ${file}   fetch from right    ${file_url}     /
    ${file_name}    replace string    ${file}   %20    ${SPACE}
    [Return]        ${file_name}

Validate File Downloaded
    [Arguments]    ${file_name}
    ${download_dir}     Get Local Download Directory
    ${file_path}    Set Variable    ${download_dir}\\${file_name}
    File Should Exist    ${file_path}

Get Local Download Directory
    ${user_home}        get environment variable    UserProfile
    [Return]    ${user_home}\\Downloads