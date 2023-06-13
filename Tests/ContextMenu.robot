*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp context menu page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/ContextMenuApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/ContextMenu.robot

*** Test Cases ***
Verify an Alert is Open when the Box is Right Clicked
    [Documentation]     Test to verify an alert is open when a box is right clicked, then close it and verify that
    ContextMenuApp.Navigate To
    ContextMenuApp.Right Click Box and Validate Alert is Open and Close Correctly