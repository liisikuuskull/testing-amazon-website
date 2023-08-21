*** Settings ***
Documentation    Robot Framework script to change language on the Amazon website
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers

*** Variables ***
${desired_language}   DE  # Deutsch

*** Test Cases ***
Test Change Language
    Open Amazon Website
    Page Should Be Fully Loaded
    Change Language    ${desired_language}
    Verify Language Is Changed    ${desired_language}


*** Keywords ***
Open Amazon Website
    Open Browser    https://www.amazon.com    Chrome

Page Should Be Fully Loaded
    Wait Until Page Contains Element    css=#nav-logo-sprites

Change Language
    [Arguments]    ${language_code}
    Click Element    css=a.icp-button
    Click Element    css=a[aria-label="Choose a language for shopping."]
    Wait Until Page Contains Element    xpath=//span[contains(text(), '${language_code}')]    timeout=10s
    
Verify Language Is Changed
    [Arguments]    ${expected_language}
    Wait Until Page Contains    ${expected_language}    timeout=10s
