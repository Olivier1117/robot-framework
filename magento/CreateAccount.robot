*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  5.0s

*** Test Cases ***
robotframework-testing_selenium
    [Setup]  Run Keywords  Open Browser  https://magento.softwaretestingboard.com/?ref=hackernoon.com  ${BROWSER}
    ...              AND   Set Selenium Speed  ${SELSPEED}
    click    link=Create an Account
    open    https://magento.softwaretestingboard.com/customer/account/create/
    click    id=firstname
    type    id=firstname    Olivier
    click    id=lastname
    type    id=lastname    BARA
    click    id=email_address
    type    id=email_address    baa_olivier@hotmail.com
    click    id=password
    type    id=password    1867Paloma117&
    click    id=password-confirmation
    type    id=password-confirmation    1867Paloma117&
    click    xpath=//form[@id='form-validate']/div/div/button/span
    open    https://magento.softwaretestingboard.com/customer/account/
    [Teardown]  Close Browser

*** Keywords ***
open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

