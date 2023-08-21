*** Settings ***
Documentation    Robot Framework script to test the Amazon website
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers

*** Keywords ***
Wait for Element and Extract Background Color
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${color_value} =    Execute Javascript    return window.getComputedStyle(arguments[0], null).getPropertyValue("background-color");    ${locator}
    [Return]    ${color_value}


Validate Color
    [Arguments]    ${actual_color}    ${expected_color}
    Should Be Equal As Strings    ${actual_color}    ${expected_color}

*** Test Cases ***
TestSearchButtonColor
    ${search_button_locator} =    Set Variable    xpath=//input[@id='nav-search-submit-button']

    ${search_button_color} =    Wait for Element and Extract Background Color    ${search_button_locator}
    
    # Validate the search button color
    Validate Color    ${search_button_color}    #f08804
