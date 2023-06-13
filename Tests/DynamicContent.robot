*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp dynamic content page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/DynamicContentApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/DynamicContent.robot

*** Test Cases ***
Validate refreshing until N different images are displayed
    [Documentation]    Tests page refreshing until a given number of images is displayed
    DynamicContentApp.Navigate To
    DynamicContentApp.Store Images within a list and Verify the names are not duplicate    5