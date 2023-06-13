*** Settings ***
Documentation       Tests to verify the functionality of the HerokuApp broken_images page
Resource            ../Data/InputData.robot
Resource            ../Resources/PO/BrokenImagesApp.robot
Resource            ../Resources/Common/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

#Run the script:
#robot -d results tests/BrokenImages.robot

*** Variables ***
${NUMBER_OF_IMAGES_BROKEN}          2
${NUMBER_OF_IMAGES_AVAILABLE}       1

*** Test Cases ***
Validate the number of images broken and available
    BrokenImagesApp.Navigate To
    BrokenImagesApp.Verify the Correct X and Y number of Available and Broken Images    ${NUMBER_OF_IMAGES_AVAILABLE}   ${NUMBER_OF_IMAGES_BROKEN}