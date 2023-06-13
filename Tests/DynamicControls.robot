*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp dynamic controls page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/DynamicControlsApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/DynamicControls.robot

*** Test Cases ***
Validate that checkbox is removed when clicking "Remove" button
    [Documentation]    Test to verify "Remove" button functionality
    DynamicControlsApp.Navigate To
    DynamicControlsApp.Click "Remove" button and Verify checkbox is removed

Validate that input is enabled when clicking "Enable" button
    [Documentation]    Test to verify "Enable" button functionality
    DynamicControlsApp.Navigate To
    DynamicControlsApp.Click "Enable" button and Verify input is enabled
