*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary

*** Variables ***
${UPLOAD_URL}           https://the-internet.herokuapp.com/upload
${FILE_NAME}            test.txt
${CREATED_FILE_PATH}    ${EXECDIR}\\Created File\\${FILENAME}

*** Keywords ***
Navigate To
    go to               ${UPLOAD_URL}

Create File to Upload
    create file         ${CREATED_FILE_PATH}     testing

Upload File and Verify it was Uploaded
    choose file                 id=file-upload       ${CREATED_FILE_PATH}
    click element               id=file-submit
    element text should be      tag=h3              File Uploaded!
    element text should be      id=uploaded-files   ${FILE_NAME}
