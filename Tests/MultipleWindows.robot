*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp key presses page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/MultipleWindowsApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/MultipleWindows.robot

*** Test Cases ***
Click on Link to a New Window and Validate Text Displayed
    [Documentation]    Test navigation to a new window and verify text displayed there
    MultipleWindowsApp.Navigate To
    MultipleWindowsApp.Go to New Window
    MultipleWindowsApp.Validate Text Displayed on the New Window