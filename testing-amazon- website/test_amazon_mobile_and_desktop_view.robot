*** Settings ***
Documentation    Robot Framework script to test Amazon site in mobile and desktop views
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome

*** Test Cases ***
Test Amazon Site in Mobile View
    [Tags]    mobile
    Set Window Size    360    640
    Open Amazon Site

Test Amazon Site in Desktop View
    [Tags]    desktop
    Set Window Size    1920    1080
    Open Amazon Site

*** Keywords ***
Open Amazon Site
    Open Browser    https://www.amazon.com    Chrome
    Wait Until Page Contains    Amazon.com
    Sleep    10s
