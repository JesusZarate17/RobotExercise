*** Settings ***
Library         SeleniumLibrary
Resource        ../../Data/InputData.robot


*** Variables ***
${BROWSER} =         chrome

*** Keywords ***
Initialize Selenium
    Set selenium timeout        10s

Begin Web Test
    Initialize Selenium
    open browser                about:blank          ${BROWSER}     alias=Chrome
    maximize browser window

End Web Test
    close all browsers

