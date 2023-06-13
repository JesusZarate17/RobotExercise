*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp exit intent page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/ExitIntentApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/ExitIntent.robot

*** Test Cases ***
Move cursor out of viewport and Verify a window modal appears
    [Documentation]    Test to verify a window modal is shown when mouse cursor is moved to the URL bar
    ExitIntentApp.Navigate To
    ExitIntentApp.Move Mouse Cursor Up
    ExitIntentApp.Validate Modal is Displayed