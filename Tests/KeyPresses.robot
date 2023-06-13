*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp key presses page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/KeyPressesApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/KeyPresses.robot

*** Variables ***
${ESCAPE_MESSAGE}           You entered: ESCAPE
${SPACE_MESSAGE}            You entered: SPACE

*** Test Cases ***
Click on the field, Press ESC key and Validate Displayed Message
    [Documentation]    Test to validate correct message is displayed after entering ESC key on input field
    KeyPressesApp.Navigate To
    KeyPressesApp.Place on Input Field and Press Key    ESC
    KeyPressesApp.Validate Entered Keys Message         ${ESCAPE_MESSAGE}

Click on the field, Press SPACE key and Validate Displayed Message
    [Documentation]    Test to validate correct message is displayed after entering SPACE key on input field
    KeyPressesApp.Navigate To
    KeyPressesApp.Place on Input Field and Press Key    SPACE
    KeyPressesApp.Validate Entered Keys Message         ${SPACE_MESSAGE}