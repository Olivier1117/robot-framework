*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  5.0s

*** Settings ***
Library  SeleniumLibrary

*** Settings ***
Library           SeleniumLibrary
Test Setup    Open Browser    https://www.google.com/    chrome
Test Teardown    Close Browser

*** Variables ***
${BASE_URL}       https://www.google.com/
${URL}    https://magento.softwaretestingboard.com/
${EMAIL}    bara_olivier@hotmail.com
${PASSWORD}    1867Paloma117&

*** Test Cases ***
Luma Test
    Maximize Browser Window
    Login    ${EMAIL}    ${PASSWORD}
    Logout
   
*** Keywords ***
Login
    [Documentation]    Test du formule de connexion
    [Arguments]    ${EMAIL}    ${PASSWORD}
    Go To    ${URL}
    Click Element    link=Sign In
    Input Text    id=email    ${EMAIL}
    Input Text    id=pass    ${PASSWORD}
    Click Element    xpath=//form[@id='login-form'][1]/fieldset/div[4]/div[1]/button/span


Logout
    [Documentation]    Test de deconnexion
    Wait Until Page Contains Element    xpath=//div[@class='panel header'][1]/ul[@class='header links']    timeout=10s 
    Click Button   xpath=//div[@class='panel header'][1]/ul[@class='header links'][1]/li[@class='customer-welcome']/span/button
    Click Element    xpath=//div[@class='customer-menu']/ul/li[@class='authorization-link']/a