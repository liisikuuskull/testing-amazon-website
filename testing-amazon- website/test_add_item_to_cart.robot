*** Settings ***
Documentation    Robot Framework script to test the Amazon website
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers

*** Variables ***
${search_term}    headsets

*** Test Cases ***
Test Amazon Page Load
    Open Amazon Website
    Check Amazon Title

Test Add to Shopping Cart
    Open Amazon Website
    When The User Enters In The Search Bar    ${search_term}
    Submit Search
    Wait Until Page Contains Results
    Click Best Seller Search Result
    Click Add to Cart Button
    Wait Until Page Contains    Added to Cart
    Click Cart Icon
    Wait Until Page Contains    Subtotal

*** Keywords ***
Open Amazon Website
    Open Browser    https://www.amazon.com    Chrome

Check Amazon Title
    ${actual_title}    Get Title
    Should Be Equal As Strings    ${actual_title}    Amazon.com. Spend less. Smile more.

When The User Enters In The Search Bar
    [Arguments]    ${search_term}
    Input Text    css=#twotabsearchtextbox    ${search_term}
    Press Key    css=#twotabsearchtextbox    \\13

Submit Search
    Press Key    css=#twotabsearchtextbox    \\13    

Click Best Seller Search Result
    Wait Until Element Is Visible    css=.s-result-list .s-include-content-margin h2 a:contains("Best Seller")
    Click Element    css=.s-result-list .s-include-content-margin h2 a:contains("Best Seller")


Click Add to Cart Button
    Wait Until Element Is Visible    id=add-to-cart-button
    Click Element    id=add-to-cart-button

Click Cart Icon
    Wait Until Element Is Visible    id=nav-cart
    Click Element    id=nav-cart

Wait Until Page Contains Results
    Wait Until Page Contains Element    css=.s-result-list
