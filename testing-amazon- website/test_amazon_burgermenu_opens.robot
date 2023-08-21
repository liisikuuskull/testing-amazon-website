*** Settings ***
Documentation    Robot Framework script to test if the Amazon burger menu opens
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers

*** Keywords ***
Open Amazon Website
    Open Browser    https://www.amazon.com    Chrome

Page Should Be Fully Loaded
    Wait Until Page Contains Element    css=#nav-logo-sprites timeout=20s

Click Burger Menu Icon
    Click Element    id=nav-hamburger-menu
    Sleep 2s
    Click Element    css=.hm-icon.nav-sprite
    Click Element    xpath=//i[@class="hm-icon nav-sprite"]


Verify Customer Profile Icon
    Wait Until Element Is Visible    id=hmenu-customer-profile-left
    Element Should Be Visible    id=hmenu-customer-avatar-icon

*** Test Cases ***
Test Amazon Burger Menu Opens
    Open Amazon Website
    Page Should Be Fully Loaded
    Click Burger Menu Icon           
    Verify Customer Profile Icon
