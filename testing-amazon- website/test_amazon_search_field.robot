*** Settings ***
Documentation    Robot Framework script to test Amazon search bar
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Test Amazon Search Bar
    Click Element    css=#searchDropdownBox
    Click Element    css=[value="search-alias=electronics-intl-ship"]

    
    Input Text    css=#twotabsearchtextbox    Headphones

    
    Submit Form    id=nav-search-bar-form

    
    Wait Until Page Contains    Headphones  

    Click Element    xpath=(//img[@class="s-image"])[1]

    Wait Until Element Is Visible    xpath=//img[@class="s-image"][1]    

    

*** Keywords ***
Wait Until Page Contains
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}    timeout=20s
