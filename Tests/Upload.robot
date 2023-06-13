*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp upload page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/UploadApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/Upload.robot

*** Test Cases ***
Verify File Upload
    [Documentation]    Test to verify that a user can successfully upload a file
    UploadApp.Navigate To
    UploadApp.Create File to Upload
    UploadApp.Upload File and Verify it was Uploaded