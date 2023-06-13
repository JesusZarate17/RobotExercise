*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp drag and drop page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/DragAndDropApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/DragAndDrop.robot

*** Test Cases ***
Validate Dragging Box A to Box B and Back Again
    [Documentation]    Test to validate drag and drop of two boxes switching them once and again
    DragAndDropApp.Navigate To
    DragAndDropApp.Drag and Drop Box A to B and Validate they were Exchanged
    DragAndDropApp.Verify Which is the First Box    B
    DragAndDropApp.Drag and Drop Box A to B and Validate they were Exchanged
    DragAndDropApp.Verify Which is the First Box    A