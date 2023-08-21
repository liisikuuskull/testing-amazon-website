*** Settings ***
Documentation    Robot Framework script to test the Amazon website
Library           SeleniumLibrary
Suite Setup       Open Browser    https://www.amazon.com/    Chrome
Suite Teardown    Close All Browsers


*** Keywords ***
Open Amazon Website
    Open Browser    https://www.amazon.com    Chrome

Check Amazon Title
    ${actual_title}    Get Title
    Should Be Equal As Strings    ${actual_title}    Amazon.com. Spend less. Smile more.

*** Test Cases ***
Test Amazon Page Load
    Open Amazon Website
    Check Amazon Title

