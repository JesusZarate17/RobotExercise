*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp download page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/DownloadApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/Download.robot

*** Test Cases ***
Download every file and validate each one was downloaded
    [Documentation]    Test to verify each file on page is being downloaded correctly
    DownloadApp.Navigate To
    DownloadApp.Download Files and Validate Download