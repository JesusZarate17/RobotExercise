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
    open browser                about:blank          ${BROWSER}
    maximize browser window

End Web Test
    close all browsers