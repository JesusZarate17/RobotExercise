*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp add_remove_elements page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/AddRemoveElementsApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/AddRemoveElements.robot

*** Variables ***
${NUMBER_OF_ELEMENTS}       20

*** Test Cases ***
Add 20 Elements, Verify its Count and Delete them
    [Documentation]         Test to verify that the app adds and deletes the correct number of elements (20)
    AddRemoveElementsApp.Navigate To
    AddRemoveElementsApp.Verify Page Loaded
    AddRemoveElementsApp.Add N Number of Elements    ${NUMBER_OF_ELEMENTS}
    AddRemoveElementsApp.Verify Elements Added are Equals to N    ${NUMBER_OF_ELEMENTS}
    AddRemoveElementsApp.Remove N Number of Elements    ${NUMBER_OF_ELEMENTS}
    AddRemoveElementsApp.Verify Elements where Deleted