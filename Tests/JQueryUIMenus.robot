*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp JQueryUIMenus page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/JQueryUIMenusApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/JQueryUIMenus.robot

*** Variables ***
${FILENAME}                     menu.xls

*** Test Cases ***
Verify File is Downloaded through a JQuery UI Menu
    [Documentation]    Test to verify that a file is downloaded correctly navigating through a JQuery UI Menu
    JQueryUIMenusApp.Navigate To
    JQueryUIMenusApp.Download File
    JQueryUIMenusApp.Verify File was Downloaded    ${FILENAME}