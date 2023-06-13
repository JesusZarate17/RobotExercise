*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp JavaScript Alerts page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/JSAlertsApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/JSAlerts.robot

*** Variables ***
${INPUT_TEXT}           testing

*** Test Cases ***
Click JS Alert and Validate Confirmation Message is Displayed Correctly
    JSAlertsApp.Navigate To
    JSAlertsApp.Click JS Alert Button and Accept Alert

Click JS Prompt, Enter Text and Validate Confirmation Message is Displayed Correctly
    JSAlertsApp.Navigate To
    JSAlertsApp.Click JS Prompt Button and Enter Text    ${INPUT_TEXT}