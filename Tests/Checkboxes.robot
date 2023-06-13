*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp checkboxes page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/CheckboxesApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/AddRemoveElements.robot

*** Test Cases ***
Select "checkbox 1" and Validate it was Selected
    CheckboxesApp.Navigate To
    CheckboxesApp.Select the Checkbox   1
    CheckboxesApp.Verify Checkbox is Selected   1

Select "checkbox 2" and Validate it was Selected
    CheckboxesApp.Navigate To
    CheckboxesApp.Select the Checkbox   2
    CheckboxesApp.Verify Checkbox is Selected   2