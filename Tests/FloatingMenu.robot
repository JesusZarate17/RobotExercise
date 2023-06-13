*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp floating menu page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/FloatingMenuApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/FloatingMenu.robot

*** Test Cases ***
Verify Floating Menu is still visible at the bottom of the page
    [Documentation]    Test to verify that the floating menu options are visible
    FloatingMenuApp.Navigate To
    FloatingMenuApp.Scroll to the Bottom and Verify Menu is Visible