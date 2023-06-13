*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp horizontal slider page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/HorizontalSliderApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/HorizontalSlider.robot

*** Variables ***
${DESIRED_VALUE}            3.5

*** Test Cases ***
Validate Slider Moves to the Desired Value
    [Documentation]    Test to validate slider movement and correct value shown on screen
    HorizontalSliderApp.Navigate To
    HorizontalSliderApp.Set Slider to Desired Value             ${DESIRED_VALUE}
    HorizontalSliderApp.Validate Slider is in Desired Value     ${DESIRED_VALUE}