*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp disappearing elements page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/DisappearingElementsApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/DisappearingElements.robot

*** Test Cases ***
Validate that "Gallery" button is visible
    [Documentation]    Test to verify "Gallery" button is visible or refresh until it is
    DisappearingElementsApp.Navigate To
    DisappearingElementsApp.Refresh Page Until Gallery Button is Visible

Validate that "Gallery" button is not visible
    [Documentation]    Test to verify "Gallery" button is not visible or refresh until it is not
    DisappearingElementsApp.Navigate To
    DisappearingElementsApp.Refresh Page Until Gallery Button is NOT Visible