*** Settings ***
Documentation    Robot Framework script to test the Amazon website
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers

*** Variables ***
${email}              marimaasikas680@gmail.com
${password}           MariMaasikas555&

*** Test Cases ***
Test Sign In
    Open Amazon Website
    Page Should Be Fully Loaded
    Click Sign In Button
    Enter Email or Mobile Number    ${email}
    Click Continue Button
    Enter Password    ${password}
    Click Sign In Submit Button
    User Should Be Logged In

Test Sign Out
    Open Amazon Website
    Page Should Be Fully Loaded
    Click Sign In Button
    Enter Email or Mobile Number    ${email}
    Click Continue Button
    Enter Password    ${password}
    Click Sign In Submit Button
    User Should Be Logged In

    Hover Over Account and Lists
    Click Sign Out
    Page Should Contain    Enter Email or Mobile Number 

*** Keywords ***
Open Amazon Website
    Open Browser    https://www.amazon.com    Chrome

Page Should Be Fully Loaded
    Wait Until Page Contains Element    css=#nav-logo-sprites

Click Sign In Button
    Click Element    id=nav-link-accountList

Enter Email or Mobile Number
    [Arguments]    ${email}
    Input Text    id=ap_email    ${email}

Click Continue Button
    Click Element    id=continue

Enter Password
    [Arguments]    ${password}
    Input Password    id=ap_password    ${password}

Click Sign In Submit Button
    Click Element    id=signInSubmit

User Should Be Logged In
    Wait Until Page Contains    Hello, Mari     timeout=20s
    Page Should Contain    Your Orders

Hover Over Account and Lists
    Mouse Over    css=#nav-link-accountList

Click Sign Out
    Click Element    css=.nav-menu-signout